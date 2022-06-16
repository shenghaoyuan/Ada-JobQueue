with Text_Io;
package body ModCountDownLatch is
   
   protected type Sync is
      procedure ReleaseShared(I:Integer);
      entry AcquireSharedInterruptibly(I:Integer);
      entry tryAcquireSharedNanos(I:Integer; Timeout: integer);
      procedure UpdateCount;
      function GetCount return natural;
   private
      Count : natural := GCount;
      unLocked : Boolean := false;
   end Sync;
   
   protected body Sync is
      
      procedure ReleaseShared(I:Integer) is
      begin
	 if Count > 0 then Count := Count - 1; end if;
      end ReleaseShared;
      
      entry AcquireSharedInterruptibly(I:Integer) when unlocked is
      begin
	 null;
      end AcquireSharedInterruptibly;
      
      entry tryAcquireSharedNanos(I:Integer; Timeout: integer) when unlocked is
      begin
	 null;
      end TryAcquireSharedNanos;
      
      procedure UpdateCount is
      begin
	 Count := Count + 1;
      end UpdateCount;
      
      function GetCount return Natural is
      begin
	 return Count;
      end GetCount;
   end Sync;
   
   MySync: Sync;

   procedure await is
   begin
      MySync.acquireSharedInterruptibly(1);
   end Await;

   function await(Timeout: integer) return Boolean is
   begin
      MySync.tryAcquireSharedNanos(1, timeout);
      return True;
   end Await;

   procedure CountDown is
   begin
      MySync.releaseShared(1);
   end CountDown;

   procedure updateCount is
   begin
      MySync.updateCount;
   end UpdateCount;

   function GetCount return Integer is
   begin
        return MySync.GetCount;
   end GetCount;
   
end ModCountDownLatch;
