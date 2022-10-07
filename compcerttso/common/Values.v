From compcert.lib Require Import Coqlib Integers.
From compcert.common Require Import AST Values.

(** Force a value to have a given type (by returning [Vundef] if it does not
    have the right type). This is used for ensuring that the values on 
    [MEwrite] and [Ecall] edges have the right types. *)
Definition conv (v: val) (t: typ) : val :=
  match v, t with
  | Vundef, _ => v
  | Vint _, Tint => v (**r TODO: see ha_type *)
  | Vlong _, Tlong => v
  | Vfloat _, Tfloat => v
  | Vsingle _, Tsingle => v
  | Vptr _ _, Tint => if Archi.ptr64 then Vundef else v
  | Vptr _ _, Tlong => if Archi.ptr64 then v else Vundef
  | (Vint _ | Vsingle _), Tany32 => v
  | Vptr _ _, Tany32 => if Archi.ptr64 then Vundef else v
  | _, Tany64 => v
  | _, _ => Vundef
  end.

Fixpoint conv_list (vl: list val) (tl: list typ) {struct tl} : list val :=
  match tl with
  | nil => nil
  | t1 :: ts => 
     match vl with 
       | nil => Vundef :: conv_list nil ts
       | v1 :: vs => conv v1 t1 :: conv_list vs ts
     end
  end.

(** Truth values.  Pointers and non-zero integers are treated as [True].
  The integer 0 (also used to represent the null pointer) is [False].
  [Vundef] and floats are neither true nor false. *)

Definition is_true (v: val) : Prop :=
  match v with
  | Vint n => n <> Int.zero
  | Vptr _ _ => True
  | _ => False
  end.

Definition is_false (v: val) : Prop :=
  match v with
  | Vint n => n = Int.zero
  | _ => False
  end.

Lemma load_result_wt:
  forall chunk v,
  Val.has_type (Val.load_result chunk v) (type_of_chunk chunk).
Proof.
  intros; case chunk; case v; simpl; try lia.
  Transparent Archi.ptr64.
  all: intros; simpl; try lia.
  reflexivity.
Qed.

Lemma has_type_lessdef:
  forall v1 t v2, Val.lessdef v1 v2 -> Val.has_type v2 t -> Val.has_type v1 t.
Proof.
  destruct 1; intro.
  assumption.
  simpl. lia.
Qed.

Lemma lessdef_list_length:
  forall {l l'} (LD : Val.lessdef_list l l'),
  length l = length l'.
Proof.
  induction l; intros. inv LD. reflexivity.
  inv LD. simpl; f_equal. eauto.
Qed.

Lemma conv_wt: forall v typ, Val.has_type (conv v typ) typ.
Proof.
  intros; case v; case typ; simpl; try lia.
  Transparent Archi.ptr64.
  intros; reflexivity.
Qed.

Lemma conv_wt2: forall v t, Val.has_type v t -> conv v t = v.
Proof. repeat destruct v; destruct t; intro; simpl; try reflexivity; try inversion H. Qed.

Lemma conv_list_wt:
  forall vl tl, Val.has_type_list (conv_list vl tl) tl.
Proof.
  intros; revert vl.
  elim tl; intros; simpl. apply I.
  case vl; intros; simpl. split; [apply I | apply H].
  split; [apply conv_wt | apply H].
Qed.

Lemma conv_list_wt2:
  forall vl tl, Val.has_type_list vl tl -> conv_list vl tl = vl.
Proof.
  induction vl; destruct tl; simpl; intro; try lia. reflexivity.
  rewrite conv_wt2, IHvl;
  [reflexivity | destruct H; assumption | destruct H; assumption].
Qed.

Lemma conv_lessdef:
  forall typ v1 v2, Val.lessdef v1 v2 -> Val.lessdef (conv v1 typ) (conv v2 typ).
Proof.
  destruct 1; constructor.
Qed.

Lemma conv_list_lessdef:
  forall tl v1 v2, Val.lessdef_list v1 v2 -> Val.lessdef_list (conv_list v1 tl) (conv_list v2 tl).
Proof.
  intro tl; elim tl; simpl. intros. constructor.
  intros a l IH v1 v2.
  destruct v1; destruct v2; simpl; intro H; inv H; constructor.
  constructor.
  apply IH; constructor. apply conv_lessdef. assumption.
  apply IH. assumption.
Qed.

Definition lessdef_sum {A} (vs1 vs2 : A + val) :=
  match vs1, vs2 with
    | inl a1, inl a2 => a1 = a2
    | inr v1, inr v2 => Val.lessdef v1 v2
    | _, _ => False
  end.

Definition lessdef_listsum {A} (l1 l2 : list (A + val)) :=
  list_forall2 lessdef_sum l1 l2.