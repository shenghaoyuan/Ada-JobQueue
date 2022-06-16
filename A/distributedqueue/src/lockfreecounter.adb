with System.Atomic_Primitives; use System.Atomic_Primitives;

package body LockFreeCounter is
   procedure Reset (C: in out Counter) is
   begin
      C.Value := C.Init;
   end Reset;
   
   procedure decr(C: in out Counter; z : out boolean) is
      V: uint32 := C.Value;
   begin
      loop
	 exit when Lock_Free_Try_Write_32(C.Value'Address, V, V-1);
	 V := C.Value;
      End loop;
      if V=1 then
	 C.Value := C.Init;
	 Z := True;
      else
	 Z := False;
      end if;
   end decr;
   
   procedure decr(C: in out Counter; z : out uint32) is
      V: uint32 := C.Value;
   begin
      loop
	 exit when Lock_Free_Try_Write_32(C.Value'Address, V, V-1);
	 V := C.Value;
      End loop;
      Z := V-1;
      if Z=0 then C.value := C.Init; end if;
   end decr;
end LockFreeCounter;

