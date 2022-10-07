generic
   type Elem is private;
package AtomicReference is
  type Reference is tagged record
     Value : Elem;
     pragma Atomic(Value);
  end record;
  
  function Get(R: Reference) return Elem;
  procedure set (R: in out Reference; Q: Elem);
  procedure compareAndSet (R: in out Reference; old: Elem; N: Elem);
  procedure compareAndSet (R: in out Reference; old: Elem; N: Elem; Done: out Boolean);

end AtomicReference;
