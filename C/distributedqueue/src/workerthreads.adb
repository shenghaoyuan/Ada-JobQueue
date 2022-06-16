with BoundedWorkStealingPool;
with ModCountDownLatch;
with Text_IO;

package body WorkerThreads is
   package StealingPool is new BoundedWorkStealingPool(Object, EMPTY, 50);
   
   Workers : array (TID) of WorkerThread;
   
   pools: array (TID) of StealingPool.Pool;
   
   function Steal(Id: TID) return Object is
   begin
      return StealingPool.steal(Pools(Id));
   end Steal;
   
   procedure pushTask(Id: TID; Tsk: Object) is
   begin
--      Text_IO.Put_Line("pushTask call");
      StealingPool.pushBottom(Pools(Id), tsk);
--      Text_IO.Put_Line("pushTask exit");
   end pushTask;
   
   procedure start(Id: TID) is
   begin
      Workers(Id).Start(Id);
   end Start;
   
   task body WorkerThread is
      ThreadSeqNum : TID;
      
      package Mypool is
	 function IsEmpty return Boolean;
	 procedure pushBottom(Obj: in Object);
	 function PopBottom return Object;
	 function Steal return Object;
      end Mypool;
      
      package body Mypool is
	 function IsEmpty return Boolean is
	 begin
	    return StealingPool.IsEmpty(Pools(ThreadSeqNum));
	 end IsEmpty;
	 procedure pushBottom(Obj: in Object) is
	 begin
	    StealingPool.pushBottom(Pools(ThreadSeqNum), Obj);
	 end PushBottom;
	 function PopBottom return Object is
	 begin
	    return StealingPool.popBottom(Pools(ThreadSeqNum));
	 end PopBottom;
	 function Steal return Object is
	 begin
	    return StealingPool.steal(Pools(ThreadSeqNum));
	 end Steal;
      end Mypool;
      
      function nextVictim(ThreadSeqNum: TID) return TID is
      begin
	 if ThreadSeqNum = TID'Last then return TID'First;
	 else return ThreadSeqNum+1;
	 end if;
      end NextVictim;
      
      previousVictim : TID;
      keepLooping : boolean := true;
      Counter : Integer := 0;
      

      procedure pushTask(item : Object) is
      begin
	 myPool.pushBottom(item);
      end PushTask;
      
      function Steal return Object is
      begin
	 return myPool.steal;
      end Steal;
      
      function stopped return Boolean is
      begin
	 return countDownLatch.getCount <= 0;
      end Stopped;
	 
      function FindTask return Object is
	 LocalTask : Object := myPool.popBottom;
      begin
--	 Text_Io.Put_Line("find task 1");
	 if localTask /= EMPTY then
--	    Text_Io.Put_Line("find task ok");
	    return localTask;
	 end if;
	 -- search for task from victim
--	 Text_Io.Put_Line("find task 2");
	 while (not stopped) loop
	    declare
	       stolenTask : Object;
	    begin
--	       Text_Io.Put_Line("find task 3 steal call");
	       StolenTask := Steal(PreviousVictim);
--	       Text_Io.Put_Line("find task steal exit");
	       if stolenTask /= EMPTY then
		  -- found a stolen task to execute
--		  Text_Io.Put_Line("find task ex");
		  return stolenTask;
	       end if;
	    end;
--	    Text_Io.Put_Line("find task 4");
	    -- update victim
	    previousVictim := nextVictim(previousVictim);
	    if previousVictim = ThreadSeqNum then
	       previousVictim := nextVictim(previousVictim);
	    end if;
	 end loop;
--	 Text_Io.Put_Line("find task end");	 
	 return EMPTY;
      end findTask;
      
   begin
      accept Start (Num: TID) do
	 ThreadSeqNum := Num;
	 previousVictim  := nextVictim(threadSeqNum);
      end;
      --Text_Io.Put_Line("start worker " & TID'Image(ThreadSeqNum));
      -- loop trying to execute tasks unit executor has been stopped
      while KeepLooping loop
--	 Text_Io.Put_Line("call findTask " & TID'Image(ThreadSeqNum));
	 declare
	    myTask : Object := findTask;
	 begin
--	    Text_Io.Put_Line("findTask called " & TID'Image(ThreadSeqNum));
	    counter := 0;
	    if MyTask /= EMPTY then
	       begin
--		  Text_Io.Put_Line("run start " & TID'Image(ThreadSeqNum));
		  Run(MyTask, ThreadSeqNum);
--		  Text_Io.Put_Line("run end " & TID'Image(ThreadSeqNum));
		  countDownLatch.countDown;
--	       exception
--		  when others => 
--		     Text_Io.Put_Line("exception...");
--		     countDownLatch.countDown;
--		     exit;
	       end;
	    else 
	       Counter := Counter + 1;
	       if counter > 1_000_000 then
		  declare
		     lastTaskAttempt : Object := findTask;
		  begin
		  text_io.put_line("find task fail 1000000");
		     if lastTaskAttempt = EMPTY then
			-- no more tasks in queues
			while (countDownLatch.getCount > 0) loop
			   countDownLatch.countDown;
			end loop;
		     else 
			counter := 0;
			pushTask(lastTaskAttempt);
		     end if;
		  end;
	       end if;
	    end if;
	 end;
	 keepLooping := not stopped;
      end loop;
   exception
      when others => text_io.put_line("exception in worker");
   end WorkerThread;
begin
   for I in TID loop
      StealingPool.Init(Pools(I));
   end loop;
end WorkerThreads;

