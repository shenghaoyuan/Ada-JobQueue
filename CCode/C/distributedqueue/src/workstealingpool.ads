with AtomicReference;

generic
   type Object is private;
   EMPTY: Object;
package WorkStealingPool is
   type Pool is limited private;
   procedure Init(P:in out Pool);
   function IsEmpty(P: Pool)  return Boolean;
   procedure pushBottom(P: in out Pool; Obj: in Object);
   function PopBottom(P: in out Pool) return Object;
   function Steal(P: in out Pool) return Object;
   
private
   type Node;
   type NodePtr is access Node;

   package AtomicNodeRef is new AtomicReference(NodePtr);
   type NodeRef is new AtomicNodeRef.Reference with record null; end record;
   type Node is record
      Val : Object := EMPTY;
      Next: NodeRef;
      Prev : NodeRef;
      Id: Integer := 0;
   end record;
   
   type Pool is record
      Tail: NodeRef;
      Head: NodeRef;
   end record;
   
end WorkStealingPool;
