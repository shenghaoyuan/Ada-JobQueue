with Text_Io;
--DistributedQueue
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Ada.Calendar.Formatting; use Ada.Calendar.Formatting;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with System.Multiprocessors; use System.Multiprocessors;

with WorkerThreads;
with StandardWstTaskExecutor;
with LockFreeCounter;
with GNAT.OS_Lib;
with System.Atomic_Primitives; use System.Atomic_Primitives;

with Ada.Numerics.Generic_Elementary_Functions;

procedure Main is

   package newEF is new Ada.Numerics.Generic_Elementary_Functions (Float_Type => Float);
   use newEF;

   Start_Time : Ada.Calendar.Time;
   Number : Integer := 10;

   current_time : Integer := 0;
   c1: constant := 0.0123;
   c2: Constant := 0.0234;
   c3: Constant := 0.0345;
   c4: Constant := 0.0456;
   c5: Constant := 0.0567;
   c6: Constant := 0.0678;
   c7: Constant := 0.0789;
   c8: Constant := 0.0901;
   c9: Constant := 0.1012;
   c10: Constant := 0.1123;
   c11: Constant := 0.1234;
   c12: Constant := 0.1345;

   t: Integer;
   A: Float;
   Omega: Float;
   I: Float;
   Xi: Float;
   Eta: Float;
   Lambda: Float;

   time: Float;
   M_A: Float;
   M_I: Float;
   M_Omega: Float;
   M_Xi: Float;
   M_Eta: Float;
   M_Lambda: Float;
   N_A: Float;
   N_I: Float;
   N_Omega: Float;
   N_Xi: Float;
   N_Eta: Float;
   N_Lambda: Float;

   type TID is new Integer range 1..4; -- 4 workers

   type action is access procedure (Id: TID);

   procedure Run(A: Action; Id: TID) is
   begin
      A.all(Id);
   end Run;

   package Workers is new StandardWstTaskExecutor(TID, Action, null, Run);

   c_small_step_07 : LockFreeCounter.counter(2);
   c_small_step_08 : LockFreeCounter.counter(4);
   c_small_step_09 : LockFreeCounter.counter(4);
   c_small_step_10 : LockFreeCounter.counter(5);
   c_small_step_11 : LockFreeCounter.counter(5);
   c_small_step_12 : LockFreeCounter.counter(4);
   c_small_step_time : LockFreeCounter.counter(6);

   procedure Small_Step_01(Id: TID);
   procedure small_step_02(Id: TID);
   procedure small_step_03(Id: TID);
   procedure small_step_04(Id: TID);
   procedure small_step_05(Id: TID);
   procedure small_step_06(Id: TID);
   procedure small_step_07(Id: TID);
   procedure small_step_08(Id: TID);
   procedure small_step_09(Id: TID);
   procedure small_step_10(Id: TID);
   procedure small_step_11(Id: TID);
   procedure small_step_12(Id: TID);
   procedure small_step_time(Id: TID);
   procedure start_step(Id: TID);

   procedure small_step_01(Id: TID) is
      t_t : Integer;
      t_time : Float;
   begin
      t_t := 10;
      t := t_t;
      t_t := t;

      t_time := Float (t_t - current_time);

      time := t_time;

      Workers.submit(small_step_02'Access, id);
      Workers.submit(small_step_03'Access, id); Workers.submit(small_step_04'Access, id);
      Workers.submit(small_step_05'Access, id); Workers.submit(small_step_06'Access, id);
   end small_step_01;

   procedure small_step_02(Id: TID) is
      t_time : Float;
      t_M_Lambda : Float;
   begin
      t_time := time;

      t_M_Lambda := c6 * t_time;

      M_Lambda := M_Lambda;
      Workers.submit(small_step_07'Access, id); Workers.submit(small_step_08'Access, id);
      Workers.submit(small_step_09'Access, id); Workers.submit(small_step_10'Access, id);
      Workers.submit(small_step_11'Access, id);
   end small_step_02;

   procedure small_step_03(Id: TID) is
      t_time : Float;
      t_M_A : Float;
   begin
      t_time := time;
      t_M_A := c1 * t_time;

      M_A := t_M_A;
      Workers.submit(small_step_07'Access, id); Workers.submit(small_step_08'Access, id);
      Workers.submit(small_step_09'Access, id); Workers.submit(small_step_10'Access, id);
      Workers.submit(small_step_11'Access, id); Workers.submit(small_step_12'Access, id);
   end small_step_03;

   procedure small_step_04(Id: TID) is
      t_time : Float;
      t_M_Eta : Float;
   begin
      t_time := time;
      t_M_Eta := c5 * t_time;

      M_Eta := t_M_Eta;
      Workers.submit(small_step_08'Access, id);
      Workers.submit(small_step_09'Access, id); Workers.submit(small_step_10'Access, id);
      Workers.submit(small_step_11'Access, id); Workers.submit(small_step_12'Access, id);
   end small_step_04;

   procedure small_step_05(Id: TID) is
      t_time : Float;
      t_M_Xi : Float;
   begin
      t_time := time;
      t_M_Xi:= c4 * t_time;

      M_Xi := t_M_Xi;
      Workers.submit(small_step_08'Access, id);
      Workers.submit(small_step_09'Access, id); Workers.submit(small_step_10'Access, id);
      Workers.submit(small_step_11'Access, id); Workers.submit(small_step_12'Access, id);
   end small_step_05;

   procedure small_step_06(Id: TID) is
      t_time : Float;
      t_M_Omega : Float;
   begin
      t_time := time;
      t_M_Omega := c3 * t_time;

      M_Omega := t_M_Omega;
      Workers.submit(small_step_10'Access, id);
      Workers.submit(small_step_11'Access, id); Workers.submit(small_step_12'Access, id);
   end small_step_06;

   procedure small_step_07(Id: TID) is
      cpt : uint32;
      t_M_A : Float;
      t_M_Lambda : Float;
      t_N_A : Float;
      t_A : Float;
      tt_A : Float;
   begin
      c_small_step_07.decr(cpt);
      if (cpt > 0) then return; end if;
      t_M_A := M_A;
      t_M_Lambda := M_Lambda;

      t_N_A := c7 * t_M_A * (Cos (t_M_Lambda));

      N_A := t_N_A;

      t_A := t_M_A + t_N_A;

      A := t_A;

      tt_A := A;
      Workers.submit(small_step_time'Access, id);
   end small_step_07;

   procedure small_step_08(Id: TID) is
      cpt : uint32;
      t_M_A : Float;
      t_M_Xi : Float;
      t_M_Eta : Float;
      t_M_Lambda : Float;
      t_N_Xi : Float;
      t_Xi : Float;
      tt_Xi : Float;
   begin
      c_small_step_08.decr(cpt);
      if (cpt > 0) then return; end if;
      t_M_A := M_A;
      t_M_Xi := M_Xi;
      t_M_Eta := M_Eta;
      t_M_Lambda := M_Lambda;

      t_N_Xi := (t_M_A * t_M_Xi * Cos (t_M_Eta)) / (Cos (t_M_Lambda) * c10);

      N_Xi := t_N_Xi;

      t_Xi := t_M_Xi + t_N_Xi;

      Xi := t_Xi;

      tt_Xi := Xi;

      Workers.submit(small_step_time'Access, id);
   end small_step_08;

   procedure small_step_09(Id: TID) is
      cpt : uint32;
      t_M_A : Float;
      t_M_Xi : Float;
      t_M_Eta : Float;
      t_M_Lambda : Float;
      t_N_Eta : Float;
      t_Eta : Float;
      tt_Eta : Float;
   begin
      c_small_step_09.decr(cpt);
      if (cpt > 0) then return; end if;
      t_M_A := M_A;
      t_M_Xi := M_Xi;
      t_M_Eta := M_Eta;
      t_M_Lambda := M_Lambda;

      t_N_Eta := (t_M_A * t_M_Xi * Sin (t_M_Eta)) / (Sin (t_M_Lambda) * c11);

      N_Eta := t_N_Eta;

      t_Eta := t_M_Eta + t_N_Eta;

      Eta := t_Eta;

      tt_Eta := Eta;

      Workers.submit(small_step_time'Access, id);
   end small_step_09;

   procedure small_step_10(Id: TID) is
      cpt : uint32;
      t_time : Float;
      t_M_A : Float;
      t_M_Xi : Float;
      t_M_Eta : Float;
      t_M_Omega : Float;
      t_M_Lambda : Float;
      t_N_I : Float;
   t_M_I : Float;
      t_I : Float;
      tt_I : Float;
   begin
      c_small_step_10.decr(cpt);
      if (cpt > 0) then return; end if;
      t_M_A := M_A;
      t_M_Xi := M_Xi;
      t_M_Eta := M_Eta;
      t_M_Omega := M_Omega;
      t_M_Lambda := M_Lambda;
      t_time := time;

      t_N_I := (t_M_A * t_M_Xi * Sin (t_M_Eta)) / (Cos (t_M_Lambda) * c8 * t_M_Omega * t_time);

      N_I := t_N_I;

      t_M_I := c2 * t_time;
      M_I := t_M_I;

      t_I := t_M_I + t_N_I;

      I := t_I;

      tt_I := I;

      Workers.submit(small_step_time'Access, id);
   end small_step_10;

   procedure small_step_11(Id: TID) is
      cpt : uint32;
      t_M_A : Float;
      t_M_Xi : Float;
      t_M_Eta : Float;
      t_M_Lambda : Float;
      t_M_Omega : Float;
      t_time : Float;
      t_N_Lambda : Float;
      t_Lambda : Float;
      tt_Lambda : Float;
   begin
      c_small_step_11.decr(cpt);
      if (cpt > 0) then return; end if;
      t_M_A := M_A;
      t_M_Xi := M_Xi;
      t_M_Eta := M_Eta;
      t_M_Omega := M_Omega;
      t_M_Lambda := M_Lambda;
      t_time := time;

      t_N_Lambda := (t_M_A * t_M_Xi * Sin (t_M_Eta)) / (Sin (t_M_Lambda) * c12 * t_M_Omega * t_time);

      N_Lambda := t_N_Lambda;

      t_Lambda := t_M_Lambda + t_N_Lambda;

      Lambda := t_Lambda;

      tt_Lambda := Lambda;
      Workers.submit(small_step_time'Access, id);
   end small_step_11;

   procedure small_step_12(Id: TID) is
      cpt : uint32;
      t_M_A : Float;
      t_M_Xi : Float;
      t_M_Eta : Float;
      t_M_Omega : Float;
      t_time : Float;
      t_N_Omega : Float;
      t_Omega : Float;
      tt_Omega : Float;
   begin
      c_small_step_12.decr(cpt);
      if (cpt > 0) then return; end if;
      t_M_A := M_A;
      t_M_Xi := M_Xi;
      t_M_Eta := M_Eta;
      t_M_Omega := M_Lambda;
      t_time := time;

      t_N_Omega := (t_M_A * t_M_Xi * Cos (t_M_Eta)) / (Sin (t_M_Omega) * c9 * t_time);

      N_Omega := t_N_Omega;

      t_Omega := t_M_Omega + t_N_Omega;

      Omega := t_Omega;

      tt_Omega := Omega;
      Workers.submit(small_step_time'Access, id);
   end small_step_12;

   procedure small_step_time(Id: TID) is
      cpt : uint32;
   begin
      c_small_step_time.decr(cpt);
      if (cpt > 0) then return; end if;

      Number := Number -1;
      --Put_Line(Integer'Image(Number));
      if Number = 0 then
         Ada.Text_IO.Put_Line(Duration'Image(Ada.Calendar.Clock - Start_Time));
         --raise PROGRAM_ERROR with "END";
         GNAT.OS_Lib.OS_Exit (0);
      else
         Workers.submit(start_step'Access, id);
      end if;
   end small_step_time;

   procedure start_step(Id: TID) is
   begin
      Workers.submit(Small_Step_01'Access, id);--JP
   end start_step;
begin
   Start_Time := Ada.Calendar.Clock;
   Workers.submit(Start_Step'Access);--JP
end Main;
