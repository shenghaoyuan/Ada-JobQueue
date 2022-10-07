From compcert.lib Require Import Coqlib.

From compcerttso.lib Require Export Vlib.

From Coq Require Import ZArith.

Definition ZPle (p q: positive) := Z.le (Zpos p) (Zpos q).

Lemma Ple_total: forall (p q : positive), ZPle p q \/ ZPle q p.
Proof.
  unfold ZPle; intros; lia.
Qed.

Definition ple (x y: positive) : {ZPle x y} + {~ ZPle x y}.
Proof.
  intros; apply Z_le_dec.
Qed.