with ModCountDownLatch;
with WorkStealingPool;
with WorkerThreads;
with Text_IO;
package body StandardWstTaskExecutor is

   package Workers is new WorkerThreads(TID, Object, EMPTY, run);
   
   package countDownLatch renames Workers.countDownLatch;
   
   allThreadsStarted : boolean := false;
   
   protected type PrCounter is
      procedure IncrementAndGet(R: out Integer);
   private
      Counter: Integer := Integer(TID'First)-1;
   end PrCounter;
   
   protected body PrCounter is
      procedure IncrementAndGet(R: out Integer) is
      begin
	 Counter := Counter+1;
	 R := Counter;
      end IncrementAndGet;
   end PrCounter;
   
   startedThreadsCounter : PrCounter;
   
   procedure submit(tsk : Object) is
      NumActiveThreads: Integer;
   begin
--      Text_IO.Put_Line("submit");
      startedThreadsCounter.IncrementAndGet(NumActiveThreads);
--      Text_IO.Put_Line("submit uc0");
      countDownLatch.updateCount;
--      Text_IO.Put_Line("submit uc1");
      if numActiveThreads <= Integer(TID'Last) then
--	 Text_IO.Put_Line("submit 1a");
	 Workers.pushTask(TID(NumActiveThreads), tsk);
--	 Text_IO.Put_Line("submit 1b");
      else
--	 Text_IO.Put_Line("submit exc");
	 raise TOO_MANY_THREADS;
      end if;
      if numActiveThreads <= Integer(TID'Last) then
--	 Text_IO.Put_Line("submit 2a");
	 Workers.start(TID(NumActiveThreads));
--	 Text_IO.Put_Line("submit 2b");
      end if;
   end Submit;
   
   -- id: current worker
   procedure submit(tsk : Object; Id: TID) is
   begin
      countDownLatch.updateCount;
--      Text_IO.Put_Line("submit by " & TID'Image(Id));
      Workers.pushTask(Id, tsk);
--      Text_IO.Put_Line("submit 2 by " & TID'Image(Id));
      if not allThreadsStarted then
	 declare
	    numActiveThreads : Integer;
	 begin
	    startedThreadsCounter.IncrementAndGet(numActiveThreads);
	    if numActiveThreads <= Integer(TID'Last) then
	       Workers.start(TID(NumActiveThreads));
	    else
	       allThreadsStarted := true;
	    end if;
	 end;
      end if;
--      Text_IO.Put_Line("submit end by " & TID'Image(Id));
   end Submit;
   
   procedure TriggerShutdown is
   begin
      countDownLatch.countDown;
   end TriggerShutdown;
   
   procedure AwaitTermination is
      keepLooping : boolean := true;
   begin
      while keepLooping loop
	 begin
	    countDownLatch.await;
	 exception
            when InterruptedException => null;
	 end;
	 keepLooping := not stopped;
      end loop;
   end AwaitTermination;
   
   function stopped return Boolean is
   begin
      return countDownLatch.getCount <= 0;
   end Stopped;

end StandardWstTaskExecutor;
