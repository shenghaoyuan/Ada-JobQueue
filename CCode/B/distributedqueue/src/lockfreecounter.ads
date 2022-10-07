with System.Atomic_Primitives; use System.Atomic_Primitives;

package LockFreeCounter is
   
   type counter(init: uint32) is tagged record
      value: uint32 := init;
   end record with volatile;
   procedure Reset (C: in out Counter);
   procedure decr(C: in out Counter; z: out boolean);
   procedure decr(C: in out Counter; z : out uint32);
end LockFreeCounter;
