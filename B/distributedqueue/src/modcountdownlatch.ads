generic 
   gCount : natural;
package ModCountDownLatch is
   InterruptedException: exception;
   procedure Await;
   procedure CountDown;
   procedure UpdateCount;
   function GetCount return Integer;
end ModCountDownLatch;
