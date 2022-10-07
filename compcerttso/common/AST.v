From compcert.lib Require Import Coqlib.

(** Object kind is used to match allocation and deallocation : free has to called with exactly the same kind that was used for alloc *)

Inductive mobject_kind : Type :=
  | MObjGlobal : mobject_kind
  | MObjStack : mobject_kind
  | MObjHeap : mobject_kind.

Scheme Equality for mobject_kind.
(** 
Type of memory retsrictions. At the moment, memory can be retsricted to a set of blocks.*)

Definition mem_restr : Type := Z -> bool.

Definition low_mem_restr : mem_restr :=
  fun b => if zeq b 0 then true else false.

Definition no_mem_restr : mem_restr :=
  fun b => true.