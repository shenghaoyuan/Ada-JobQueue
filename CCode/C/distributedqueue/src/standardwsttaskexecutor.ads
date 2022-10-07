generic
   type TID is range <>;
   type Object is private;
   Empty: Object;
   with procedure Run (O: Object; Id : TID);
package StandardWstTaskExecutor is
   procedure submit(tsk : Object; Id: TID);
   procedure submit(tsk : Object);
   procedure TriggerShutdown;
   procedure AwaitTermination;
   function stopped return Boolean;
   TOO_MANY_THREADS: exception;
   InterruptedException: exception;
end StandardWstTaskExecutor;
