--https://www.dre.vanderbilt.edu/~schmidt/PDF/work-stealing-dequeue.pdf
with Text_Io;
package body BoundedWorkStealingPool is
   procedure Init(P: in out Pool) is
   begin
      P.top.Set(0);
      P.bot.Set(0);
      for I in Index loop
	 P.Queue(I).Set(empty);
      end loop;
   end Init;
   
   function IsEmpty(P: Pool) return boolean is
   begin
      return P.bot.Get <= P.top.Get;
   end IsEmpty;

   procedure pushBottom(P: in out Pool; O: Object) is
      B: I64 := P.bot.get;
      T: I64 := P.top.get;
      Size: I64 := B - T;
   begin
--      Text_Io.Put_Line("push str: top="&I64'Image(T)&", bot="&I64'Image(B));
      if O=empty then
      Text_Io.Put_Line("push str null: top="&I64'Image(T)&", bot="&I64'Image(B));
	 raise NullPointer;
      end if;
      if Size >= I64(QUEUE_CAPACITY) then 
  Text_Io.Put_Line("push str full: top="&I64'Image(T)&", bot="&I64'Image(B));
	 raise Full; 
      end if;
--   Text_Io.Put_Line("push str 2: top="&I64'Image(T)&", bot="&I64'Image(B));
      P.Queue(Index(B mod I64(QUEUE_CAPACITY))).Set(O);
      P.bot.Set(B+1);
--      Text_Io.Put_Line("push end: top="&I64'Image(T)&", bot="&I64'Image(B));
   end PushBottom;
   
   function PopBottom(P:in out Pool) return Object is
      B : I64 := P.bot.Get - 1;
      T : I64;
      Size : I64;
   begin
      P.Bot.Set(B);
      T := P.Top.get;
--      Text_Io.Put_Line("pop str: top="&I64'Image(T)&", bot="&I64'Image(B+1));
      Size := B - T;
      if Size < 0 then
	 P.Bot.Set(T);
	 return Empty; 
      end if;
      declare
	 O : Object := P.Queue(Index(B mod I64(QUEUE_CAPACITY))).get;
	 Done: Boolean;
      begin
	 if Size > 0 then return O; end if;
	 P.top.CompareAndSet(T,T+1,Done);
	 if not Done then
	    O := Empty;
	 end if;
	 P.Bot.Set(T+1);
--	 Text_Io.Put_Line("pop end: top="&I64'Image(P.Top.get)&", bot="&I64'Image(P.Bot.get));
	 return O;
      end;
   end PopBottom;
   
   function Steal(P:in out Pool) return Object is
      B: I64 := P.bot.get;
      T: I64 := P.top.get;
      Size : I64 := B - T;
      O: Object;
      Done: Boolean;
   begin
--      Text_Io.Put_Line("steal - size = " & I64'Image(Size));
--      Text_Io.Put_Line("steal str: top="&I64'Image(T)&", bot="&I64'Image(B));
      if Size <= 0 then return Empty; end if;
      O := P.Queue(Index(T mod I64(QUEUE_CAPACITY))).Get;
      P.Top.CompareAndSet(T, T+1, Done);
      if Done then
--	 Text_Io.Put_Line("steal end: top="&I64'Image(P.Top.get)&", bot="&I64'Image(P.Bot.get));
	 return O;
      else
	 return empty;
      end if;
   end Steal;
end BoundedWorkStealingPool;

