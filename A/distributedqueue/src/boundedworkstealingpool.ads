with AtomicReference;

generic
   type Object is private;
   Empty: Object;
   QUEUE_CAPACITY : positive;
package BoundedWorkStealingPool is
   type Pool is limited private;
   procedure Init(P: in out Pool);
   function IsEmpty(P: Pool) return Boolean;
   procedure pushBottom(P: in out Pool; O: Object);
   function PopBottom(P: in out Pool) return Object;
   function Steal(P: in out Pool) return Object;
   Full: exception;
   NullPointer: exception;
private
   type I64 is new Long_Integer;
   type Index is new Integer range 0..QUEUE_CAPACITY-1;
   package AtomicIndexRef is new AtomicReference(I64);
   type AtomicIndex is new AtomicIndexRef.Reference with record Null; end record;
   package AtomicValueRef is new AtomicReference(Object);
   type AtomicValue is new AtomicValueRef.Reference with record null; end record;
   type Elems is array (Index) of AtomicValue;
   type Pool is record
      Queue : Elems;
      top : AtomicIndex ;-- volatile
      bot : AtomicIndex ; -- volatile
   end record;
end BoundedWorkStealingPool;
