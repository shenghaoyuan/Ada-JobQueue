with System.Atomic_Primitives; use System.Atomic_Primitives;
generic
   type T is private;
   with procedure TerminationHandler(P:T);
package LockFreeTermination is
   
   procedure Termination(P:T);
   procedure Activation (Nb: Uint32 := 1);
end LockFreeTermination;
