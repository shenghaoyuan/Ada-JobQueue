(* generated by Ott 0.21.2 from: Csyntax2.v Csyntax1.ott *)

From Coq Require Import Arith Bool List.

(** Abstract syntax for the Clight language *)

From compcert.lib Require Import Coqlib Integers Floats.
From compcert.common Require Import AST Errors.
From compcert.cfrontend Require Import Ctypes Cop.

From compcerttso.common Require Import AST.
From compcerttso.lib Require Import Coqlib.

(** * Abstract syntax *)


Inductive expr : Type :=  (*r typed expression *)
 | Expr : expr_descr -> type -> expr (*r expression *)
with expr_descr : Type :=  (*r basic expressions *)
 | Econst_int : int -> expr_descr (*r integer literal *)
 | Econst_float : float -> expr_descr (*r float literal *)
 | Evar : ident -> expr_descr (*r variable *)
 | Ederef : expr -> expr_descr (*r unary pointer dereference *)
 | Eaddrof : expr -> expr_descr (*r address-of *)
 | Eunop : unary_operation -> expr -> expr_descr (*r unary operation *)
 | Ebinop : binary_operation -> expr -> expr -> expr_descr (*r binary operation *)
 | Ecast : type -> expr -> expr_descr (*r type cast *)
 | Econdition : expr -> expr -> expr -> expr_descr (*r conditional *)
 | Eandbool : expr -> expr -> expr_descr (*r sequential and *)
 | Eorbool : expr -> expr -> expr_descr (*r sequential or *)
 | Esizeof : type -> expr_descr (*r size of a type *)
 | Efield : expr -> ident -> expr_descr (*r access to a member of a struct or union *).

(** Extract the type part of a type-annotated Clight expression. *)

Definition typeof (e: expr) : type :=
  match e with Expr de te => te end.


(** ** Statements *)

(** Clight statements include all C statements.
  Only structured forms of [switch] are supported; moreover,
  the [default] case must occur last.  Blocks and block-scoped declarations
  are not supported. *)



Definition opt_lhs : Type := option (ident * type).

Definition opt_e : Type := option expr.

Definition es : Type := list expr.
Definition label := ident. (*r label *)

Inductive atomic_statement : Set :=  (*r atomic *)
 | AScas : atomic_statement (*r compare and swap *)
 | ASlkinc : atomic_statement (*r locked inc *).

Inductive statement : Type :=  (*r statements *)
 | Sskip : statement (*r do nothing *)
 | Sassign : expr -> expr -> statement (*r assignment [lvalue = rvalue] *)
 | Scall : opt_lhs -> expr -> es -> statement (*r function or procedure call *)
 | Ssequence : statement -> statement -> statement (*r sequence *)
 | Sifthenelse : expr -> statement -> statement -> statement (*r conditional *)
 | Swhile : expr -> statement -> statement (*r while *)
 | Sdowhile : expr -> statement -> statement (*r do while *)
 | Sfor : statement -> expr -> statement -> statement -> statement (*r for loop *)
 | Sbreak : statement (*r break *)
 | Scontinue : statement (*r continue *)
 | Sreturn : opt_e -> statement (*r return *)
 | Sswitch : expr -> labeled_statements -> statement (*r switch *)
 | Slabel : label -> statement -> statement (*r labelled statement *)
 | Sgoto : label -> statement (*r goto *)
 | Sthread_create : expr -> expr -> statement (*r thread creation *)
 | Satomic : opt_lhs -> atomic_statement -> es -> statement (*r atomic operation *)
 | Smfence : statement (*r mfence *)
with labeled_statements : Type :=  (*r labeled statements *)
 | LSdefault : statement -> labeled_statements (*r default *)
 | LScase : int -> statement -> labeled_statements -> labeled_statements (*r labeled case *).