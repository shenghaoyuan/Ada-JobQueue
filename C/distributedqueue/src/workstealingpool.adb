with Text_IO;
with Ada.Exceptions; use Ada.Exceptions;
package body WorkStealingPool is
   
   function IsEmpty(P: Pool) return Boolean is
   begin
      return P.tail.get.id - P.head.Get.Id <= 0;
   end IsEmpty;
   
   function Count(P: Pool) return integer is
      Count: integer := 0;
      Current : NodePtr := P.Head.Get.Next.Get;
   begin
--      Text_Io.Put_Line("count start");
      while Current /= null loop
--	 Text_Io.Put_Line("count loop");
	 Count := Count + 1;
	 current := current.next.Get;
      end loop;
--      Text_Io.Put_Line("count end");
      return count;
   end Count;
   
   
   function GetTail(P: in out Pool) return NodePtr is
--      LocalTail: NodePtr := P.Tail.get;
--      LocalNext: NodePtr := LocalTail.Next.Get;
      LocalTail: NodePtr;
      LocalNext: NodePtr;
   begin
--      Text_IO.Put("getTail 1a - count = ");
--      if P.Tail.Get = null then
--	 Text_Io.Put_Line("?? - no cell"); Text_IO.Flush;
--      else
--	 Text_Io.Put_Line(Integer'Image(Count(P))); Text_IO.Flush;
--      end if;
      LocalTail := P.Tail.get;
--      Text_IO.Put_Line("getTail 1b"); Text_IO.Flush;
--      begin
	 LocalNext := LocalTail.Next.Get;
--      exception
--	 when Exc : others  => LocalNext := null;
--      end;
--      Text_IO.Put_Line("getTail 1c"); Text_IO.Flush;
      while (localNext /= null) loop
--	 Text_IO.Put_Line("getTail 2");
	 P.tail.compareAndSet(localTail, localNext);
--	 Text_IO.Put_Line("getTail 3");
	 localTail := P.tail.get;
	 localNext := LocalTail.next.get; -- BUG dans le code Java???
      end loop;
--      Text_IO.Put_Line("getTail 4");
      return P.tail.get;
   end GetTail;
      
   procedure TryResetCounter(P: in out Pool) is
   begin
      if P.tail.get.id >= Integer'Last then
	 P.head.get.id := 0;
	 P.tail.get.id := P.tail.get.id - P. head.get.id;
      end if;
   end TryResetCounter;
   
   ------------------------------------------------
   
   procedure Init(P: in out Pool) is
   begin
      P.Tail.set(new Node);
      P.Head.Set(P.Tail.Get);
      P.Tail.Get.Next.Set(null);
      P.Tail.Get.prev.Set(null);
   end Init;
   
   procedure pushBottom(P: in out Pool; Obj: in Object) is
      LocalTail: NodePtr := null;
      NewNode: NodePtr := new Node;
      Done: Boolean;
   begin
      newNode.val := obj;
      
      Text_IO.Put_Line("pushBottom 1 - count = " & Integer'Image(Count(P)));
      if Obj=EMPTY then Text_Io.Put_Line("push empty!"); end if;
      
      TryResetCounter(P);
      
      Text_IO.Put_Line("pushBottom 2");
      
      loop
	 Text_IO.Put_Line("pushBottom 3");
	 localTail := GetTail(P);
	 Text_IO.Put_Line("pushBottom 4");
	 
	 -- TODO: This should be atomic.

	 newNode.next.set(null); -- bug Java
	 Text_IO.Put_Line("pushBottom 5");
	 newNode.id := localTail.id + 1;
	 newNode.prev.set(localTail);
	 Text_IO.Put_Line("pushBottom 6");
	 localTail.next.compareAndSet(null, NewNode, done);
	 exit when Done;
      end loop;
      
--      Text_IO.Put_Line("pushBottom 7");
      
      P.tail.compareAndSet(localTail, newNode);
      
--      Text_IO.Put_Line("pushBottom end");
--      Text_IO.Put_Line("pushBottom end - count = " & Integer'Image(Count(P)));
   end pushBottom;
   
   function PopBottom(P: in out Pool) return Object is
   begin
--      Text_Io.Put_Line("pop bot 0 - count = " & Integer'Image(Count(P)));
      -- keep spinning until we catch the proper head.
      loop
--	 Text_Io.Put_Line("pop bot 1");
	 declare
	    localHead : NodePtr := P.head.get;
	    localNext : NodePtr := localHead.next.get;
	    localTail : NodePtr := P.tail.get;
	    Done:Boolean;
	 begin
	    -- if the queue is empty then return the default
--	    Text_Io.Put_Line("pop bot 2");
	    if localNext = null then
--	       Text_Io.Put_Line("pop bot 3");
	       return EMPTY;
	    elsif localHead = LocalTail  then
	       -- our tail is lagging behind so we need to swing it.
	       P.tail.compareAndSet(localTail, localHead);
	    else
	       localNext.prev.set(localHead.prev.get);
	       -- if no other thread changed the head then we are good to
	       -- go and we can return the local value;
	       -- BUG Java NOT
	       P.head.compareAndSet(localHead, LocalNext, Done);
	       if done then
--		  Text_Io.Put_Line("pop bot end");
		  
--		  Text_Io.Put_Line("pop bot end count = " & Integer'Image(Count(P)));      
		  return localNext.val;
	       end if;
	    end if;
	 end;
      end loop;
   end PopBottom;
   
   function Steal(P: in out Pool) return Object is
      LocalTail : NodePtr;
      LocalPrev: NodePtr;
      SwapNode: NodePtr := new Node;
      Done: Boolean;
   begin
      loop
--	 Text_Io.Put_Line("steal 1");
--	 Text_Io.Put_Line("steal 1 count = " & Integer'Image(Count(P)));
	 -- get the tail.
	 localTail := GetTail(P);
	 localPrev := localTail.prev.get;
	 
	 if localPrev = null then
--	    Text_Io.Put_Line("steal 2");
	    return EMPTY;
	 elsif localPrev.Prev.get = null then
--	    Text_Io.Put_Line("steal 3");
	    return EMPTY;
	 elsif localPrev.Prev.get = P.Head.get then
--	    Text_Io.Put_Line("steal 4");
	    return EMPTY;
	 elsif localTail = null then
--	    Text_Io.Put_Line("steal 5");
	    return EMPTY;
	 end if;
	 
--	 Text_Io.Put_Line("steal 6");
	 
	 -- Set the swap node values that will exchange the element
	 -- in a sense that it will skip right through it.
	 swapNode.next.set(localTail.next.get);
	 swapNode.prev.set(localPrev.prev.get);
	 swapNode.val := localPrev.val;
	 swapNode.id := localPrev.id;
	 
	 -- BUG?? modif algo Java
	 LocalPrev.Next.Set(SwapNode); -- BUG si //
	 P.tail.compareAndSet(localTail, SwapNode, done);
	 exit when Done;
      end loop;
      
--      Text_Io.Put_Line("steal end");
--      Text_Io.Put_Line("steal end count = " & Integer'Image(Count(P)));
      
      return localTail.val;
   end Steal;

end WorkStealingPool;
