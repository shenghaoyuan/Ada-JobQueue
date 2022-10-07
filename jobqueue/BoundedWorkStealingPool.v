(** * BoundedWorkStealingPool *)

From compcert.lib Require Import Coqlib Integers Floats Maps.
From compcert.common Require Import AST Errors Values Events Globalenvs Errors.
From compcert.cfrontend Require Import Ctypes Cop Csyntax Ctyping.

From compcerttso.common Require Import AST Values Events Libtactics Memcomp.
From compcerttso.lib Require Import Coqlib Mergesort.

From Coq Require Import ZArith List.
Import ListNotations.

Section BoundedWorkStealingPool.

Definition pointer := val. (**r pointer = Vptr b ofs *)

(**
boundedworkstealingpool.adb

function Steal(P:in out Pool) return Object is
  B: I64 := P.bot.get; -- TEmem (MEread ptr 
  T: I64 := P.top.get; -- TEmem (MEread
  Size : I64 := B - T;
  O: Object;
  Done: Boolean;
begin
  if Size <= 0 then return Empty; end if;
  O := P.Queue(Index(T mod I64(QUEUE_CAPACITY))).Get;
  P.Top.CompareAndSet(T, T+1, Done); --steal modify the TOP
  if Done then
    return O;
  else
    return empty;
  end if;
end Steal;

*)

Inductive sem_steal (P: pointer) (c: memory_chunk) (Index QUEUE_CAPACITY: nat): list mem_event -> val -> Prop :=
  | sem_stealEmpty:
    forall B T bot_ofs top_ofs,
      let decl_B := MEread (Val.add P (Vint bot_ofs)) c (Vint B) in
      let decl_T := MEread (Val.add P (Vint top_ofs)) c (Vint T) in
        sem_steal P c Index QUEUE_CAPACITY [decl_B; decl_T] Vzero
  | sem_stealSucc:
    forall B T O bot_ofs top_ofs,
      let decl_B := MEread (Val.add P (Vint bot_ofs)) c (Vint B) in
      let decl_T := MEread (Val.add P (Vint top_ofs)) c (Vint T) in
      let queue_get_Index := MEread (Val.add P
        (Vint (Int.modu top_ofs (Int.repr (Z.of_nat QUEUE_CAPACITY))))) c (Vint O) in
      let T1 := Vint (Int.add T Int.one) in
      let queue_casT := MErmw (Val.add P (Vint top_ofs)) Mint32 T1 (rmw_CAS (Vint T) T1) in
        sem_steal P c Index QUEUE_CAPACITY [decl_B; decl_T; queue_get_Index; queue_casT] (Vint O)
  | sem_stealFail:
    forall B T O T2 bot_ofs top_ofs,
      let decl_B := MEread (Val.add P (Vint bot_ofs)) c (Vint B) in
      let decl_T := MEread (Val.add P (Vint top_ofs)) c (Vint T) in
      let queue_get_Index := MEread (Val.add P
        (Vint (Int.modu top_ofs (Int.repr (Z.of_nat QUEUE_CAPACITY))))) c (Vint O) in
      let T1 := Vint (Int.add T (Int.repr 1)) in
      let queue_casF := MErmw (Val.add P (Vint top_ofs)) Mint32 T2 (rmw_CAS (Vint T) T1) in
        ~(Val.eq T2 T1) ->
          sem_steal P c Index QUEUE_CAPACITY [decl_B; decl_T; queue_get_Index; queue_casF] Vzero.

(**
   procedure pushBottom(P: in out Pool; O: Object) is
      B: I64 := P.bot.get; --Mread
      T: I64 := P.top.get; --Mread 
      Size: I64 := B - T;
   begin
      if O=empty then
	      raise NullPointer;
      end if;
      if Size >= I64(QUEUE_CAPACITY) then 
	      raise Full; 
      end if;
      P.Queue(Index(B mod I64(QUEUE_CAPACITY))).Set(O); -- Mwrite
      P.bot.Set(B+1); --Mwrite
   end PushBottom;
 
*)

Inductive pushResult :=
  | NullPointer
  | Full
  | OK.

Inductive sem_push (P: pointer) (O: val) (c: memory_chunk) (Index QUEUE_CAPACITY: nat): list mem_event -> pushResult -> Prop :=
  | sem_pushEmpty:
      Val.eq O Vzero ->
        sem_push P O c Index QUEUE_CAPACITY [] NullPointer
  | sem_pushFull:
    forall B T bot_ofs top_ofs,
      let decl_B := MEread (Val.add P (Vint bot_ofs)) c (Vint B) in
      let decl_T := MEread (Val.add P (Vint top_ofs)) c (Vint T) in
      let size := Int.sub B T in
        ~ (Val.eq O Vzero) ->
        Int.cmp Cge size (Int.repr (Z.of_nat QUEUE_CAPACITY)) = true ->
          sem_push P O c Index QUEUE_CAPACITY [decl_B; decl_T] Full
  | sem_pushSucc:
    forall B T bot_ofs top_ofs,
      let decl_B := MEread (Val.add P (Vint bot_ofs)) c (Vint B) in
      let decl_T := MEread (Val.add P (Vint top_ofs)) c (Vint T) in
      let size := Int.sub B T in

      let queue_get_Index := MEwrite (Val.add P
        (Vint (Int.modu bot_ofs (Int.repr (Z.of_nat QUEUE_CAPACITY))))) c O in

      let set_B_plus_1 := MEwrite (Val.add P (Vint bot_ofs)) c (Vint (Int.add B Int.one)) in
        ~ (Val.eq O Vzero) ->
        Int.cmp Cge size (Int.repr (Z.of_nat QUEUE_CAPACITY)) = false ->
        sem_push P O c Index QUEUE_CAPACITY [decl_B; decl_T; queue_get_Index; set_B_plus_1] OK.


(**
   function PopBottom(P:in out Pool) return Object is
      B : I64 := P.bot.Get - 1; -- Mread
      T : I64;
      Size : I64;
   begin
      P.Bot.Set(B); -- Mwrite // if local_queue.size > 1, pop is done here for the point of view outside ...
      T := P.Top.get; -- Mread // when we read the TOP, the steal may take the top ... so we may get the negative size ...
      Size := B - T;
      if Size < 0 then -- someone takes (steals?) an elements, local queue is empty
	      P.Bot.Set(T); -- Mwrite
	      return Empty; -- 
      end if;
      declare
	      O : Object := P.Queue(Index(B mod I64(QUEUE_CAPACITY))).get; -- Mread
	      Done: Boolean;
      begin
	      if Size > 0 then return O; end if; -- local queue has enough elements
        -- case: Size = 0, so T = B - 1, we try to remove the only element
	      P.top.CompareAndSet(T,T+1,Done); -- Mmwf -- we may not allow to do because someone is doing it...
	      if not Done then
	        O := Empty; -- someone steals the only element, so the local queue is empty
	      end if;
	      P.Bot.Set(T+1); -- Mwrite --this is to stop others steal this local queue
	      return O; -- this may be Empty
      end;
   end PopBottom;

*)

Inductive sem_pop (P: pointer) (c: memory_chunk) (Index QUEUE_CAPACITY: nat): list mem_event -> val -> Prop :=
  | sem_popEmpty:
    forall B T bot_ofs top_ofs,
      let decl_B := MEread (Val.add P (Vint bot_ofs)) c (Vint B) in
      let set_B  := MEwrite (Val.add P (Vint bot_ofs)) c (Vint B) in
      let decl_T := MEread (Val.add P (Vint top_ofs)) c (Vint T) in
      let size := Int.sub B T in
      let set_T  := MEwrite (Val.add P (Vint top_ofs)) c (Vint T) in
      Int.lt size Int.zero ->
        sem_pop P c Index QUEUE_CAPACITY [decl_B; set_B; decl_T; set_T] Vzero

  | sem_popFull:
    forall B T O bot_ofs top_ofs,
      let decl_B := MEread (Val.add P (Vint bot_ofs)) c (Vint B) in
      let set_B  := MEwrite (Val.add P (Vint bot_ofs)) c (Vint B) in
      let decl_T := MEread (Val.add P (Vint top_ofs)) c (Vint T) in
      let size := Int.sub B T in

      let queue_get_Index := MEread (Val.add P
        (Vint (Int.modu bot_ofs (Int.repr (Z.of_nat QUEUE_CAPACITY))))) c O in
        Int.cmp Cgt size Int.zero ->
          sem_pop P c Index QUEUE_CAPACITY [decl_B; set_B; decl_T; queue_get_Index] O


  | sem_popSizeZeroSucc:
    forall B T O bot_ofs top_ofs,
      let decl_B := MEread (Val.add P (Vint bot_ofs)) c (Vint B) in
      let set_B  := MEwrite (Val.add P (Vint bot_ofs)) c (Vint B) in
      let decl_T := MEread (Val.add P (Vint top_ofs)) c (Vint T) in
      let size := Int.sub B T in

      let queue_get_Index := MEread (Val.add P
        (Vint (Int.modu bot_ofs (Int.repr (Z.of_nat QUEUE_CAPACITY))))) c O in
        Int.eq size Int.zero ->

      let T1 := Vint (Int.add T Int.one) in
      let queue_casT := MErmw (Val.add P (Vint top_ofs)) Mint32 T1 (rmw_CAS (Vint T) T1) in
      let set_T_plus_1  := MEwrite (Val.add P (Vint top_ofs)) c T1 in

        sem_pop P c Index QUEUE_CAPACITY [decl_B; set_B; decl_T; queue_get_Index; queue_casT; set_T_plus_1] O


  | sem_popSizeZeroFail:
    forall B T O T2 bot_ofs top_ofs,
      let decl_B := MEread (Val.add P (Vint bot_ofs)) c (Vint B) in
      let set_B  := MEwrite (Val.add P (Vint bot_ofs)) c (Vint B) in
      let decl_T := MEread (Val.add P (Vint top_ofs)) c (Vint T) in
      let size := Int.sub B T in

      let queue_get_Index := MEread (Val.add P
        (Vint (Int.modu bot_ofs (Int.repr (Z.of_nat QUEUE_CAPACITY))))) c O in

      let T1 := Vint (Int.add T (Int.repr 1)) in
      let queue_casF := MErmw (Val.add P (Vint top_ofs)) Mint32 T2 (rmw_CAS (Vint T) T1) in
        Int.eq size Int.zero ->
        ~(Val.eq T2 T1) ->
          sem_pop P c Index QUEUE_CAPACITY [decl_B; set_B; decl_T; queue_get_Index; queue_casF] Vzero.

(**r

thread0
- steal q1
  - empty
  - succ v
    - 

thread1

- (push | pop)* q1 

thread2
- steal q1


...
TSOmachine
- q

*)

(** 
macro CAS(result, pos, expected, new) {
if (table[pos] = expected) {
table[pos] := new;
result := TRUE
} else { 
result := FALSE
}
} 


void lock(int *exclusion) {
  while (CAS(exclusion, 1, 0))
    while ( *exclusion)
      ;
}

*)


Inductive wait (exclusion: pointer) (chunk: memory_chunk): list mem_event -> Prop :=
| wait_False:
  wait exclusion chunk [MEread exclusion chunk Vzero]
| wait_True:
  forall l, wait exclusion chunk l ->
    wait exclusion chunk ([MEread exclusion chunk Vone] ++ l)
.

Inductive lock (exclusion: pointer) (chunk: memory_chunk): list mem_event -> Prop :=
| While_CAS_False:
  lock exclusion chunk [MErmw exclusion chunk Vzero
    (rmw_CAS Vone Vzero)]
| While_CAS_True:
  forall l, wait exclusion chunk l ->
    lock exclusion chunk ([MErmw exclusion chunk Vone
    (rmw_CAS Vone Vzero)] ++ l)
.

End BoundedWorkStealingPool.