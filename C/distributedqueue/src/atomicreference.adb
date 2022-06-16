with System.Atomic_Primitives;
with Ada.Unchecked_Conversion; use System.Atomic_Primitives;

package body AtomicReference is
   function elem2Int is
	 new Ada.Unchecked_Conversion (Source => Elem, Target => uint64);
   function int2elem is
	 new Ada.Unchecked_Conversion (Source => uint64, Target => Elem);
   function Get(R: Reference) return Elem is
      V : Uint64 := Lock_Free_Read_64(R.Value'Address);
   begin
      return Int2elem(Lock_Free_Read_64(R.Value'Address));
   end Get;
   pragma Inline (Get);
   
   procedure set (R: in out Reference; Q: Elem) is
   begin
      R.value := Q;
   end Set;
   pragma Inline (Set);
   
   procedure compareAndSet (R: in out Reference; old: Elem; N: Elem) is
      Expected : Uint64 := Elem2int(Old);
      done: boolean;
   begin
      Done := System.Atomic_Primitives.Lock_Free_Try_Write_64(R.Value'address, expected, Elem2int(N));
   end CompareAndSet;
   
   procedure compareAndSet (R: in out Reference; old: Elem; N: Elem; Done: out Boolean) is
      Expected : Uint64 := Elem2int(Old);
   begin
      Done := System.Atomic_Primitives.Lock_Free_Try_Write_64(R.Value'address, expected, Elem2int(N));
   end CompareAndSet;
   pragma Inline (CompareAndSet);
   -- -O2 -gnatpn
end AtomicReference;
