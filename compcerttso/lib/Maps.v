From compcert.lib Require Import Coqlib Integers Maps.

From compcerttso.lib Require Import Coqlib.

Notation "a ! b <- c" := (PTree.set b c a) (at level 1, b at next level).

Module IndexedPair(X Y: INDEXED_TYPE).
  Definition t := (X.t * Y.t)%type.

  Fixpoint indexp (t1 t2 : positive) : positive :=
    match t1, t2 with
    | xH   , xH    => xH
    | xH   , xO p2 => xI(xI(xO(p2)))
    | xH   , xI p2 => xI(xI(xI(p2)))
    | xO p1, xH    => xI(xO(xO(p1)))
    | xO p1, xO p2 => xO(xO(xO(indexp p1 p2)))
    | xO p1, xI p2 => xO(xO(xI(indexp p1 p2)))
    | xI p1, xH    => xI(xO(xI(p1)))
    | xI p1, xO p2 => xO(xI(xO(indexp p1 p2)))
    | xI p1, xI p2 => xO(xI(xI(indexp p1 p2)))
    end.

  Lemma indexp_inj: 
    forall (p1 p2 q1 q2: positive), 
      indexp p1 p2 = indexp q1 q2 -> p1 = q1 /\ p2 = q2.
  Proof.
    intro p1. 
    induction p1 as [p IH|p IH|];
      intros p2 q1 q2;
      destruct p2; destruct q1; destruct q2; 
      intro H; try discriminate; try reflexivity; simpl in H;
      try injection H as H1; try apply IH in H1;
      try destruct H1; try split; try congruence.
  Qed.
      
  Definition index (p: X.t * Y.t): positive :=
    match p with (a, b) => indexp (X.index a) (Y.index b) end. 

  Lemma index_inj: forall (x y: X.t * Y.t), index x = index y -> x = y.
  Proof.
    intros x y. destruct x. destruct y. unfold index.
    intro H. apply indexp_inj in H. destruct H as [H1 H2].
    apply X.index_inj in H1. apply Y.index_inj in H2.
    congruence.
  Qed.
  Lemma eq: forall (x y: X.t * Y.t), {x = y} + {x <> y}.
  Proof.
    decide equality; try apply Y.eq; try apply X.eq.
  Qed.
End IndexedPair.

Module ZZIndexed := IndexedPair(ZIndexed)(ZIndexed).

Module ZZMap := IMap(ZZIndexed).