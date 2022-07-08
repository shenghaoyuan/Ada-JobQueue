(** * BoundedWorkStealingPool *)

From Coq Require Import ZArith List.
Import ListNotations.

Section BoundedWorkStealingPool.
  
  Context {int: Type}.
  Variable Int_add: int -> int -> int.

  Inductive pointer : Type :=
  | Ptr : Z -> int -> pointer.

  Definition Pointer_add (p : pointer) (i : int) : pointer :=
  match p with
  | Ptr b off => Ptr b (Int_add off i)
  end.

  Inductive val: Type :=
  | Vundef: val
  | Vint: int -> val (*
  | Vfloat: float -> val *)
  | Vptr: pointer -> val.

  Inductive memory_chunk : Type :=
  | Mint8signed : memory_chunk (* 8-bit signed integer *)
  | Mint8unsigned : memory_chunk (* 8-bit unsigned integer *)
  | Mint16signed : memory_chunk (* 16-bit signed integer *)
  | Mint16unsigned : memory_chunk (* 16-bit unsigned integer *)
  | Mint32 : memory_chunk (* 32-bit integer, or pointer *)
  | Mfloat32 : memory_chunk (* 32-bit single-precision float *)
  | Mfloat64 : memory_chunk. (* 64-bit double-precision float *)

  (** Read-modify-write instructions *)
  Inductive rmw_instr :=
   | rmw_ADD (v: val)
   | rmw_CAS (vold vnew: val)
   | rmw_SET (v: val).

(**
  Object kind is used to match allocation and deallocation : free has to called with exactly the same kind that was used for alloc
*)

  Inductive mobject_kind : Type :=
  | MObjGlobal : mobject_kind
  | MObjStack : mobject_kind
  | MObjHeap : mobject_kind.

  Inductive mem_event :=
  | MEfence
  | MEwrite (p: pointer) (chunk: memory_chunk) (v: val)
  | MEread (p: pointer) (chunk: memory_chunk) (v: val)
  | MErmw (p: pointer) (chunk: memory_chunk) (v: val) (instr: rmw_instr)
  | MEalloc (p: pointer) (size: int) (k: mobject_kind)
  | MEfree (p: pointer) (k: mobject_kind).

  Variable bot_ofs top_ofs: int.
  Variable Int_sub: int -> int -> int.
  Variable Pointer_add: pointer -> int -> pointer.
  Variable Int_leb: int -> int -> bool.
  Variable Int_repr: Z -> int.
  Variable Int_modu : int -> int -> int.


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
  P.Top.CompareAndSet(T, T+1, Done);
  if Done then
    return O;
  else
    return empty;
  end if;
end Steal;

*)

  Definition Steal (P: pointer) (c: memory_chunk) (B T O: int) (Index QUEUE_CAPACITY: nat) := (**r exists P = Vptr b ofs *)
    let decl_B := MEread (Pointer_add P bot_ofs) c (Vint B) in
    let decl_T := MEread (Pointer_add P top_ofs) c (Vint T) in
    let size := Int_sub B T in
      if Int_leb size (Int_repr 0) then
        [decl_B; decl_T]
      else
      let queue_get_Index := MEread (Pointer_add P
        (Int_modu top_ofs (Int_repr (Z.of_nat QUEUE_CAPACITY)))) c (Vint O) in
        [].

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
  wait exclusion chunk [MEread exclusion chunk (Vint (Int_repr 0%Z))]
| wait_True:
  forall l, wait exclusion chunk l ->
    wait exclusion chunk ([MEread exclusion chunk (Vint (Int_repr 1%Z))] ++ l)
.

Inductive lock (exclusion: pointer) (chunk: memory_chunk): list mem_event -> Prop :=
| While_CAS_False:
  lock exclusion chunk [MErmw exclusion chunk (Vint (Int_repr 0%Z))
    (rmw_CAS (Vint (Int_repr 1%Z)) (Vint (Int_repr 0%Z)))]
| While_CAS_True:
  forall l, wait exclusion chunk l ->
    lock exclusion chunk ([MErmw exclusion chunk (Vint (Int_repr 1%Z))
    (rmw_CAS (Vint (Int_repr 1%Z)) (Vint (Int_repr 0%Z)))] ++ l)
.

End BoundedWorkStealingPool.