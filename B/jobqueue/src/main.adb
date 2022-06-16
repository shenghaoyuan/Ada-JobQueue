--SequentialCode
with Ada.Text_IO ; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Ada.Calendar.Formatting; use Ada.Calendar.Formatting;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with System.Multiprocessors; use System.Multiprocessors;
with System.Multiprocessors.Dispatching_Domains; use System.Multiprocessors.Dispatching_Domains;

with Ada.Numerics.Generic_Elementary_Functions;

procedure Main is

   package newEF is new Ada.Numerics.Generic_Elementary_Functions (Float_Type => Float);
   use newEF;

   Start_Time : Ada.Calendar.Time;

   Number : Integer := 1000;
   K : constant := 10000;

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

   type action is access procedure;
   type index is mod K;
   type todolist is array (index) of action;

   protected type counter(init: integer := 1) is
      procedure decr(z: out boolean);
   private
      c:integer := init;
   end counter;

   protected body counter is
      procedure decr(z : out boolean) is
      begin
         c := c - 1;
         if c=0 then c := init; z := true;
         else
            z := false;
         end if;
      end decr;
   end counter;

   protected type taskQueue is
      entry put(a:in action);
      entry get(a:out action);
      function size return  Integer;
   private
      todo : todolist := (others => null);
      head : index := 0;
      tail : index := 0;
      count : integer range 0..K := 0;
   end taskQueue;

   NBtask : Integer := 0;
   protected body taskQueue is
      entry put(a:in action) when count < K is
      begin
         todo(tail) := a;
         tail := tail+1;
         count := count+1;
      end put;

      entry get(a:out action) when count > 0 is
      begin
         a := todo(head);
         todo(head) := null;
         NBtask := NBtask + 1;
         head := head+1;
         count := count - 1;
      end get;

      function size return Integer is
      begin
         return count;
      end size;

   end taskQueue;
   tq: taskQueue;

   task type worker (K : CPU_Range) with CPU => K is
   end worker;

   task body worker is
      a:action;
   begin
      loop
         tq.get(a);
         a.all;
         if (Number = 0) then exit; end if;
      end loop;
   end worker;
   worker1 : worker(1);
   worker2 : worker(2);
   worker3 : worker(3);
   worker4 : worker(4);
   worker5 : worker(5);
   worker6 : worker(6);
   worker7 : worker(7);
   worker8 : worker(8);

   c_small_step_09 : counter(2);
   c_small_step_10 : counter(4);
   c_small_step_11 : counter(4);
   c_small_step_12 : counter(5);
   c_small_step_13 : counter(5);
   c_small_step_14 : counter(4);
   c_small_step_18 : counter(2);
   c_small_step_time : counter(6);

   procedure small_step_01;
   procedure small_step_02;
   procedure small_step_03;
   procedure small_step_04;
   procedure small_step_05;
   procedure small_step_06;
   procedure small_step_07;
   procedure small_step_08;
   procedure small_step_09;
   procedure small_step_10;
   procedure small_step_11;
   procedure small_step_12;
   procedure small_step_13;
   procedure small_step_14;
   procedure small_step_15;
   procedure small_step_16;
   procedure small_step_17;
   procedure small_step_18;
   procedure small_step_19;
   procedure small_step_20;
   procedure small_step_21;
   procedure small_step_22;
   procedure small_step_23;
   procedure small_step_24;
   procedure small_step_25;
   procedure small_step_26;
   procedure small_step_time;
   procedure end_step;

   procedure small_step_01 is
      t_t : Integer;
   begin
      t_t := 10;
      t := t_t;

      tq.put(small_step_02'access);
   end small_step_01;

   procedure small_step_02 is
      t_time : Float;
      t_t : Integer;
   begin
      t_t := t;

      t_time := Float (t_t - current_time);

      time := t_time;
      tq.put(small_step_03'access); tq.put(small_step_04'access);
      tq.put(small_step_05'access); tq.put(small_step_06'access);
      tq.put(small_step_07'access); tq.put(small_step_08'access);
   end small_step_02;

   procedure small_step_03 is
      t_time : Float;
      t_M_I : Float;
   begin
      t_time := time;

      t_M_I := c2 * t_time;

      M_I := t_M_I;
      tq.put(small_step_18'access);
   end small_step_03;

   procedure small_step_04 is
      t_time : Float;
      t_M_Lambda : Float;
   begin
      t_time := time;

      t_M_Lambda := c6 * t_time;

      M_Lambda := M_Lambda;
      tq.put(small_step_09'access); tq.put(small_step_10'access);
      tq.put(small_step_11'access); tq.put(small_step_12'access);
      tq.put(small_step_13'access);
   end small_step_04;

   procedure small_step_05 is
      t_time : Float;
      t_M_A : Float;
   begin
      t_time := time;
      t_M_A := c1 * t_time;

      M_A := t_M_A;
      tq.put(small_step_09'access); tq.put(small_step_10'access);
      tq.put(small_step_11'access); tq.put(small_step_12'access);
      tq.put(small_step_13'access); tq.put(small_step_14'access);
   end small_step_05;

   procedure small_step_06 is
      t_time : Float;
      t_M_Eta : Float;
   begin
      t_time := time;
      t_M_Eta := c5 * t_time;

      M_Eta := t_M_Eta;
      tq.put(small_step_10'access);
      tq.put(small_step_11'access); tq.put(small_step_12'access);
      tq.put(small_step_13'access); tq.put(small_step_14'access);
   end small_step_06;

   procedure small_step_07 is
      t_time : Float;
      t_M_Xi : Float;
   begin
      t_time := time;
      t_M_Xi:= c4 * t_time;

      M_Xi := t_M_Xi;

      tq.put(small_step_10'access);
      tq.put(small_step_11'access); tq.put(small_step_12'access);
      tq.put(small_step_13'access); tq.put(small_step_14'access);
   end small_step_07;

   procedure small_step_08 is
      t_time : Float;
      t_M_Omega : Float;
   begin
      t_time := time;
      t_M_Omega := c3 * t_time;

      M_Omega := t_M_Omega;
      tq.put(small_step_12'access);
      tq.put(small_step_13'access); tq.put(small_step_14'access);
   end small_step_08;

   procedure small_step_09 is
      rdy : boolean;
      t_M_A : Float;
      t_M_Lambda : Float;
      t_N_A : Float;
   begin
      c_small_step_09.decr(rdy);
      if (not rdy) then return; end if;
      t_M_A := M_A;
      t_M_Lambda := M_Lambda;

      t_N_A := c7 * t_M_A * (Cos (t_M_Lambda));

      N_A := t_N_A;
      tq.put(small_step_15'access);
   end small_step_09;

   procedure small_step_10 is
      rdy : boolean;
      t_M_A : Float;
      t_M_Xi : Float;
      t_M_Eta : Float;
      t_M_Lambda : Float;
      t_N_Eta : Float;
   begin
      c_small_step_10.decr(rdy);
      if (not rdy) then return; end if;
      t_M_A := M_A;
      t_M_Xi := M_Xi;
      t_M_Eta := M_Eta;
      t_M_Lambda := M_Lambda;

      t_N_Eta := (t_M_A * t_M_Xi * Sin (t_M_Eta)) / (Sin (t_M_Lambda) * c11);

      N_Eta := t_N_Eta;

      tq.put(small_step_16'access);
   end small_step_10;

   procedure small_step_11 is
      rdy : boolean;
      t_M_A : Float;
      t_M_Xi : Float;
      t_M_Eta : Float;
      t_M_Lambda : Float;
      t_N_Xi : Float;
   begin
      c_small_step_11.decr(rdy);
      if (not rdy) then return; end if;
      t_M_A := M_A;
      t_M_Xi := M_Xi;
      t_M_Eta := M_Eta;
      t_M_Lambda := M_Lambda;

      t_N_Xi := (t_M_A * t_M_Xi * Cos (t_M_Eta)) / (Cos (t_M_Lambda) * c10);

      N_Xi := t_N_Xi;
      tq.put(small_step_17'access);
   end small_step_11;

   procedure small_step_12 is
      rdy : boolean;
      t_M_A : Float;
      t_M_Xi : Float;
      t_M_Eta : Float;
      t_M_Omega : Float;
      t_M_Lambda : Float;
      t_time : Float;
      t_N_I : Float;
   begin
      c_small_step_12.decr(rdy);
      if (not rdy) then return; end if;
      t_M_A := M_A;
      t_M_Xi := M_Xi;
      t_M_Eta := M_Eta;
      t_M_Omega := M_Omega;
      t_M_Lambda := M_Lambda;
      t_time := time;

      t_N_I := (t_M_A * t_M_Xi * Sin (t_M_Eta)) / (Cos (t_M_Lambda) * c8 * t_M_Omega * t_time);

      N_I := t_N_I;
      tq.put(small_step_18'access);
   end small_step_12;

   procedure small_step_13 is
      rdy : boolean;
      t_M_A : Float;
      t_M_Xi : Float;
      t_M_Eta : Float;
      t_M_Lambda : Float;
      t_M_Omega : Float;
      t_time : Float;
      t_N_Lambda : Float;
   begin
      c_small_step_13.decr(rdy);
      if (not rdy) then return; end if;
      t_M_A := M_A;
      t_M_Xi := M_Xi;
      t_M_Eta := M_Eta;
      t_M_Omega := M_Omega;
      t_M_Lambda := M_Lambda;
      t_time := time;

      t_N_Lambda := (t_M_A * t_M_Xi * Sin (t_M_Eta)) / (Sin (t_M_Lambda) * c12 * t_M_Omega * t_time);

      N_Lambda := t_N_Lambda;
      tq.put(small_step_19'access);
   end small_step_13;

   procedure small_step_14 is
      rdy : boolean;
      t_M_A : Float;
      t_M_Xi : Float;
      t_M_Eta : Float;
      t_M_Omega : Float;
      t_time : Float;
      t_N_Omega : Float;
   begin
      c_small_step_14.decr(rdy);
      if (not rdy) then return; end if;
      t_M_A := M_A;
      t_M_Xi := M_Xi;
      t_M_Eta := M_Eta;
      t_M_Omega := M_Lambda;
      t_time := time;

      t_N_Omega := (t_M_A * t_M_Xi * Cos (t_M_Eta)) / (Sin (t_M_Omega) * c9 * t_time);

      N_Omega := t_N_Omega;
      tq.put(small_step_20'access);
   end small_step_14;

   procedure small_step_15 is
      t_M_A : Float;
      t_N_A : Float;
      t_A : Float;
   begin
      t_M_A := M_A;
      t_N_A := N_A;

      t_A := t_M_A + t_N_A;

      A := t_A;
      tq.put(small_step_21'access);
   end small_step_15;

   procedure small_step_16 is
      t_M_Eta : Float;
      t_N_Eta : Float;
      t_Eta : Float;
   begin
      t_M_Eta := M_Eta;
      t_N_Eta := N_Eta;

      t_Eta := t_M_Eta + t_N_Eta;

      Eta := t_Eta;
      tq.put(small_step_22'access);
   end small_step_16;

   procedure small_step_17 is
      t_M_Xi : Float;
      t_N_Xi : Float;
      t_Xi : Float;
   begin
      t_M_Xi := M_Xi;
      t_N_Xi := N_Xi;

      t_Xi := t_M_Xi + t_N_Xi;

      Xi := t_Xi;
      tq.put(small_step_23'access);
   end small_step_17;

   procedure small_step_18 is
      rdy : boolean;
      t_M_I : Float;
      t_N_I : Float;
      t_I : Float;
   begin
      c_small_step_18.decr(rdy);
      if (not rdy) then return; end if;
      t_M_I := M_I;
      t_N_I := N_I;

      t_I := t_M_I + t_N_I;

      I := t_I;

      tq.put(small_step_24'access);
   end small_step_18;

   procedure small_step_19 is
      t_M_Lambda : Float;
      t_N_Lambda : Float;
      t_Lambda : Float;
   begin
      t_M_Lambda := M_Lambda;
      t_N_Lambda := N_Lambda;

      t_Lambda := t_M_Lambda + t_N_Lambda;

      Lambda := t_Lambda;
      tq.put(small_step_25'access);
   end small_step_19;

   procedure small_step_20 is
      t_M_Omega : Float;
      t_N_Omega : Float;
      t_Omega : Float;
   begin
      t_M_Omega := M_Omega;
      t_N_Omega := N_Omega;


      t_Omega := t_M_Omega + t_N_Omega;


      Omega := t_Omega;
      tq.put(small_step_26'access);
   end small_step_20;

   procedure small_step_21 is
      t_A : Float;
   begin
      t_A := A;
      tq.put(small_step_time'access);
   end small_step_21;

   procedure small_step_22 is
      t_Eta : Float;
   begin

      t_Eta := Eta;
      tq.put(small_step_time'access);
   end small_step_22;

   procedure small_step_23 is

      t_Xi : Float;
   begin
      t_Xi := Xi;
      tq.put(small_step_time'access);
   end small_step_23;

   procedure small_step_24 is

      t_I : Float;
   begin
      t_I := I;
      tq.put(small_step_time'access);
   end small_step_24;

   procedure small_step_25 is
      t_Lambda : Float;

   begin
      t_Lambda := Lambda;
      tq.put(small_step_time'access);
   end small_step_25;

   procedure small_step_26 is

      t_Omega : Float;
   begin
      t_Omega := Omega;
      tq.put(small_step_time'access);
   end small_step_26;

   procedure small_step_time is
      rdy : boolean;
   begin
      c_small_step_time.decr(rdy);
      if (not rdy) then return; end if;
      Number := Number -1;
      t := t + 1;
      if Number = 0 then
         Ada.Text_IO.Put_Line(Duration'Image(Ada.Calendar.Clock - Start_Time));
         tq.put(end_step'access);
      else
         tq.put(small_step_01'access);
      end if;
   end small_step_time;

   procedure end_step is begin tq.put(end_step'Access);
   end end_step;

begin
   Start_Time := Ada.Calendar.Clock;
   --init;

   tq.put(small_step_01'access);

end Main;





