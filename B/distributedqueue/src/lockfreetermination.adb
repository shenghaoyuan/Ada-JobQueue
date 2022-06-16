with System.Atomic_Primitives; use System.Atomic_Primitives;
with Text_Io;
package body LockFreeTermination is
   
   Counter: Uint32 := 1;
   
   procedure Activation (Nb: Uint32 := 1) is
      V: uint32 := Counter;
   begin
--      Text_Io.Put_Line("act begin");
      loop
	 exit when Lock_Free_Try_Write_32(counter'Address, V, V+Nb);
	 V := Counter;
      End loop;      
--      Text_Io.Put_Line("act end");
   end Activation;
   
   procedure Termination(P:T) is
      V: uint32 := Counter;
   begin
      loop
--      Text_Io.Put_Line("termination " & Uint32'Image(V));
	 exit when Lock_Free_Try_Write_32(counter'Address, V, V-1);
	 V := Counter;
      End loop;
      if V /= 1 then return; end if;
      Counter := 1;
      TerminationHandler(P);
   end termination;
   
end LockFreeTermination;
