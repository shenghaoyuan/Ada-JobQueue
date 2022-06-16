with ModCountDownLatch;
generic
   type TID is range <>;
   type Object is private;
   Empty: Object;
   with procedure Run (O: Object; Id: TID);
package WorkerThreads is
   task type WorkerThread is
      entry Start(Num: TID);
   end WorkerThread;
   
   function Steal(Id: TID) return Object;
   procedure pushTask(Id: TID; Tsk: Object);
   procedure start(Id: TID);
   package countDownLatch is new ModCountDownLatch(1);
end WorkerThreads;
