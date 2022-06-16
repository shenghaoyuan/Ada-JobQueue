--SequentialCode
with Ada.Text_IO ; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Ada.Calendar.Formatting; use Ada.Calendar.Formatting;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with System.Multiprocessors; use System.Multiprocessors;
with System.Multiprocessors.Dispatching_Domains; use System.Multiprocessors.Dispatching_Domains;

procedure Main is
   Start_Time : Ada.Calendar.Time;
   Number : Integer := 1000;
   --  C: array (1..8) of CPU_Range := (1, 1, 1, 1, 1, 1, 1, 1);
   --  C: array (1..8) of CPU_Range := (1, 2, 1, 2, 1, 2, 1, 2);
     C: array (1..8) of CPU_Range := (1, 2, 3, 4, 1, 2, 3, 4);
   --C: array (1..8) of CPU_Range := (1, 2, 3, 4, 5, 6, 7, 8);

   tmp_DC : Integer;
   dj : Integer;


   procedure testloop is
      x, y : Float;
      jet_sign : Boolean;
      count_DC, jet_DC : Integer;
      C1_DC, C2_DC, C3_DC, C4_DC, C5_DC, C6_DC : Integer;
      --add_DC : Integer;
      C1, C2, C3, C4, C5, C6, C1to6 : Boolean := False;
      jsT, jsF : Boolean;
      f : Float;

      c_x, c_y : Boolean := False;
      c_jet_sign : Boolean := False;
      c_count_DC, c_jet_DC : Boolean := False;
      c_C1_DC, c_C2_DC, c_C3_DC, c_C4_DC, c_C5_DC, c_C6_DC : Boolean := False;
      c_tmp_DC, c_add_DC : Boolean := False;
      c_C1, c_C2, c_C3, c_C4, c_C5, c_C6, c_C1to6 : Boolean := False;
      c_jsT, c_jsF : Boolean := False;
      c_dj : Boolean := False;
      c_f : Boolean := False;

      task type Task1 with CPU => C(1) is
         entry S;
      end Task1;
      t01 : Task1;
      task type Task2 with CPU => C(2) is
         entry S;
      end Task2;
      t02 : Task2;
      task type Task3 with CPU => C(3) is
         entry S20;
      end Task3;
      t03 : Task3;
      task type Task4 with CPU => C(4) is
         entry S24;
      end Task4;
      t04 : Task4;
      task type Task5 with CPU => C(5) is
         entry S23;
      end Task5;
      t05 : Task5;
      task type Task6 with CPU => C(6) is
         entry S1; entry S2;
      end Task6;
      t06 : Task6;
      task type Task7 with CPU => C(7) is
         entry S6;
      end Task7;
      t07 : Task7;
      task type Task8 with CPU => C(8) is
         entry S6;
      end Task8;
      t08 : Task8;
      task type Task9 with CPU => C(1) is
         entry S6; entry S23;
      end Task9;
      t09 : Task9;
      task type Task10 with CPU => C(2) is
         entry S6; entry S23;
      end Task10;
      t10 : Task10;
      task type Task11 with CPU => C(3) is
         entry S6;
      end Task11;
      t11 : Task11;
      task type Task12 with CPU => C(4) is
         entry S6;
      end Task12;
      t12 : Task12;
      task type Task13 with CPU => C(5) is
         entry S7; entry S8; entry S9; entry S10; entry S11; entry S12;
      end Task13;
      t13 : Task13;
      task type Task14 with CPU => C(6) is
         entry S7;
      end Task14;
      t14 : Task14;
      task type Task15 with CPU => C(7) is
         entry S8;
      end Task15;
      t15 : Task15;
      task type Task16 with CPU => C(8) is
         entry S9;
      end Task16;
      t16 : Task16;
      task type Task17 with CPU => C(1) is
         entry S10;
      end Task17;
      t17 : Task17;
      task type Task18 with CPU => C(2) is
         entry S11;
      end Task18;
      t18 : Task18;
      task type Task19 with CPU => C(3) is
         entry S12;
      end Task19;
      t19 : Task19;
      task type Task20 with CPU => C(4) is
         entry S14; entry S15; entry S16; entry S17; entry S18; entry S19;
      end Task20;
      t20 : Task20;
      task type Task21 with CPU => C(5) is
         entry S;
      end Task21;
      t21 : Task21;
      task type Task22 with CPU => C(6) is
         entry S;
      end Task22;
      t22 : Task22;
      task type Task23 with CPU => C(7) is
         entry S21; entry S22;
      end Task23;
      t23 : Task23;
      task type Task24 with CPU => C(8) is
         entry S13;
      end Task24;
      t24 : Task24;

      task body Task1 is
         t_c_x: Boolean;
         t_x: Float;
      begin
         accept S;
         t_c_x := True;
         t_x := 1.0;

         c_x := t_c_x;
         x := t_x;
         t06.S1;
      end Task1;
      task body Task2 is
         t_c_y:Boolean;
         t_y:Float;
      begin
         accept S;
         t_c_y := True;
         t_y := 2.0;

         c_y := t_c_y;
         y := t_y;
         t06.S2;
      end Task2;
      task body Task3 is
         t_jet_DC : Integer;
      begin
         accept S20;
         t_jet_DC := jet_DC;
      end Task3;
      task body Task4 is
         t_count_DC : Integer;
      begin
         accept S24;
         t_count_DC := count_DC;
      end Task4;
      task body Task5 is
         t_c_jet_sign : Boolean;
         t_jet_sign : Boolean;
      begin
         accept S23;

         t_c_jet_sign := c_jet_sign;
         if c_jet_sign then
            t_jet_sign := jet_sign;
         end if;

      end Task5;
      task body Task6 is
         t_c_x : Boolean;
         t_c_y : Boolean;
         t_c_f : Boolean;
         t_x : Float;
         t_y : Float;
         t_f : Float;
      begin
         accept S1; accept S2;

         t_c_x := c_x;
         t_c_y := c_y;
         t_x := x;
         t_y := y;

         if (t_c_x and t_c_y) then
            t_c_f := True;
            t_f := t_y + 0.05 * t_x;
         else
            t_c_f := False;
         end if;

         c_f := t_c_f;
         f := t_f;

         t07.S6; t08.S6; t09.S6; t10.S6; t11.S6; t12.S6;
      end Task6;
      task body Task7 is
         t_c_x : Boolean;
         t_c_y : Boolean;
         t_c_f : Boolean;
         t_c_C1 : Boolean;
         t_x : Float;
         t_y : Float;
         t_f : Float;
         t_C1 : Boolean;
      begin
         accept S6;
         t_c_x := c_x;
         t_c_y := c_y;
         t_c_f := c_f;
         t_x := x;
         t_y := y;
         t_f := f;

         if (t_c_x and t_c_f and t_c_y) then
            t_c_C1 := True;
            t_C1 := (t_x < -0.5) and (t_f < -0.25) and (t_y < 0.15);
         else
            t_c_C1 := False;
         end if;

         c_C1 := t_c_C1;
         C1 := t_C1;

         t13.S7; t14.S7;
      end Task7;
      task body Task8 is
         t_c_x : Boolean;
         t_c_y : Boolean;
         t_c_f : Boolean;
         t_c_C2 : Boolean;
         t_x : Float;
         t_y : Float;
         t_f : Float;
         t_C2 : Boolean;
      begin
         accept S6;
         t_c_x := c_x;
         t_c_y := c_y;
         t_c_f := c_f;
         t_x := x;
         t_y := y;
         t_f := f;

         if (t_c_x and t_c_f and t_c_y) then
            t_c_C2 := True;
            t_C2 := (t_x < -1.0) and (-0.25 <= t_f) and (t_f < -0.15) and (t_y > 1.0);
         else
            t_c_C2 := False;
         end if;

         c_C2 := t_c_C2;
         C2 := t_C2;

         t13.S8; t15.S8;
      end Task8;
      task body Task9 is
         t_c_x : Boolean;
         t_c_y : Boolean;
         t_c_f : Boolean;
         t_c_C3 : Boolean;
         t_c_jet_sign : Boolean;
         t_x : Float;
         t_y : Float;
         t_f : Float;
         t_C3 : Boolean;
         t_jet_sign : Boolean;
      begin
         accept S6; accept S23;
         t_c_x := c_x;
         t_c_y := c_y;
         t_c_f := c_f;
         t_c_jet_sign := c_jet_sign;
         t_x := x;
         t_y := y;
         t_f := f;
         t_jet_sign := jet_sign;

         if (t_c_x and t_c_f and t_c_y and t_c_jet_sign) then
            t_c_C3 := True;
            t_C3 := ((t_x < -1.0) and (-0.15 <= t_f) and (t_f < -0.1) and (t_y < 1.0))
              or ((t_x < -2.0) and (-0.1 <= t_f) and (t_f < -0.05) and (t_y < 0.15))
              or ((-2.0 <= t_x)and (t_x < -1.0) and (-0.1 <= t_f) and (t_f < -0.05) and (t_jet_sign = False));
         else
            t_c_C3 := False;
         end if;

         c_C3 := t_c_C3;
         C3 := t_C3;
         t13.S9; t16.S9;
      end Task9;
      task body Task10 is
         t_c_x : Boolean;
         t_c_y : Boolean;
         t_c_f : Boolean;
         t_c_C4 : Boolean;
         t_c_jet_sign : Boolean;
         t_x : Float;
         t_y : Float;
         t_f : Float;
         t_C4 : Boolean;
         t_jet_sign : Boolean;
      begin
         accept S6; accept S23;

         t_c_x := c_x;
         t_c_y := c_y;
         t_c_f := c_f;
         t_c_jet_sign := c_jet_sign;
         t_x := x;
         t_y := y;
         t_f := f;
         t_jet_sign := jet_sign;

         if (t_c_x and t_c_f and t_c_y and t_c_jet_sign) then
            t_c_C4 := True;
            t_C4 := ( (1.0 < t_x) and (t_x <= 2.0) and (0.05 < t_f) and (t_f <= 0.1) and (t_jet_sign = False) )
              or ( (t_x > 1.0) and (0.05 < t_f) and (t_f <= 0.1) and (t_y > -0.15) )
              or ( (t_x > 2.0) and (0.1 < t_f) and (t_f <= 0.15) and (t_y > -0.15) );
         else
            t_c_C4 := False;
         end if;

         c_C4 := t_c_C4;
         C4 := t_C4;

         t13.S10; t17.S10;
      end Task10;
      task body Task11 is
         t_c_x : Boolean;
         t_c_y : Boolean;
         t_c_f : Boolean;
         t_c_C5 : Boolean;
         t_x : Float;
         t_y : Float;
         t_f : Float;
         t_C5 : Boolean;
      begin
         accept S6;

         t_c_x := c_x;
         t_c_y := c_y;
         t_c_f := c_f;
         t_x := x;
         t_y := y;
         t_f := f;

         if (t_c_x and t_c_f and t_c_y) then
            t_c_C5 := True;
            t_C5 := (t_x > 1.0) and (0.15 < t_f) and (t_f <= 0.25) and (t_y > -1.0);
         else
            t_c_C5 := False;
         end if;

         c_C5 := t_c_C5;
         C5 := t_C5;

         t13.S11; t18.S11;
      end Task11;
      task body Task12 is
         t_c_x : Boolean;
         t_c_f : Boolean;
         t_c_y : Boolean;
         t_c_C6 : Boolean;
         t_C6 : Boolean;
         t_x : Float;
         t_y : Float;
         t_f : Float;
      begin
         accept S6;

         t_c_x := c_x;
         t_c_y := c_y;
         t_c_f := c_f;
         t_x := x;
         t_y := y;
         t_f := f;

         if (t_c_x and t_c_f and t_c_y) then
            t_c_C6 := True;
            t_C6 := (t_x > 0.5) and (t_f > 0.25) and (t_y > -1.0);
         else
            t_c_C6 := False;
         end if;

         c_C6 := t_c_C6;
         C6 := t_C6;

         t13.S12; t19.S12;
      end Task12;
      task body Task13 is
         t_c_C1 : Boolean;
         t_c_C2 : Boolean;
         t_c_C3 : Boolean;
         t_c_C4 : Boolean;
         t_c_C5 : Boolean;
         t_c_C6 : Boolean;
         t_c_C1to6 : Boolean;
         t_C1 : Boolean;
         t_C2 : Boolean;
         t_C3 : Boolean;
         t_C4 : Boolean;
         t_C5 : Boolean;
         t_C6 : Boolean;
         t_C1to6 : Boolean;
         --t_C1_DC : Integer;
      begin
         accept S7; accept S8; accept S9; accept S10; accept S11; accept S12;

         t_c_C1 := c_C1;
         t_c_C2 := c_C2;
         t_c_C3 := c_C3;
         t_c_C4 := c_C4;
         t_c_C5 := c_C5;
         t_c_C6 := c_C6;
         t_C1 := C1;
         t_C2 := C2;
         t_C3 := C3;
         t_C4 := C4;
         t_C5 := C5;
         t_C6 := C6;

         if (t_c_C1 and t_c_C2 and t_c_C3 and t_c_C4 and t_c_C5 and t_c_C6) then
            t_c_C1to6 := True;
            t_C1to6 := t_C1 or t_C2 or t_C3 or t_C4 or t_C5 or t_C6;
         else
            t_c_C1to6 := False;
         end if;

         c_C1to6 := t_c_C1to6;
         C1to6 := t_C1to6;

         t24.S13;
      end Task13;
      task body Task14 is
         t_c_C1 : Boolean;
         t_C1 : Boolean;
         t_c_C1_DC : Boolean;
         t_C1_DC : Integer;
      begin
         accept S7;
         t_c_C1 := c_C1;
         t_C1 := C1;

         if (t_c_C1 and t_C1) then
            t_c_C1_DC := True;
            t_C1_DC := 500;
         else
            t_c_C1_DC := False;
         end if;

         c_C1_DC := t_c_C1_DC;
         C1_DC := t_C1_DC;
         t20.S14;
      end Task14;
      task body Task15 is
         t_c_C2 : Boolean;
         t_C2 : Boolean;
         t_c_C2_DC : Boolean;
         t_C2_DC : Integer;
      begin
         accept S8;
         t_c_C2 := c_C2;
         t_C2 := C2;

         if (t_c_C2 and t_C2) then
            t_c_C2_DC := True;
            t_C2_DC := 100;
         else
            t_c_C2_DC := False;
         end if;

         c_C2_DC := t_c_C2_DC;
         C2_DC := t_C2_DC;
         t20.S15;
      end Task15;
      task body Task16 is
         t_c_C3 : Boolean;
         t_C3 : Boolean;
         t_c_C3_DC : Boolean;
         t_C3_DC : Integer;
      begin
         accept S9;
         t_c_C3 := c_C3;
         t_C3 := C3;

         if (t_c_C3 and t_C3) then
            t_c_C3_DC := True;
            t_C3_DC := 10;
         else
            t_c_C3_DC := False;
         end if;

         c_C3_DC := t_c_C3_DC;
         C3_DC := t_C3_DC;
         t20.S16;
      end Task16;
      task body Task17 is
         t_c_C4 : Boolean;
         t_C4 : Boolean;
         t_c_C4_DC : Boolean;
         t_C4_DC : Integer;
      begin
         accept S10;
         t_c_C4 := c_C4;
         t_C4 := C4;

         if (t_c_C4 and t_C4) then
            t_c_C4_DC := True;
            t_C4_DC := -10;
         else
            t_c_C4_DC := False;
         end if;

         c_C4_DC := t_c_C4_DC;
         C4_DC := t_C4_DC;
         t20.S17;
      end Task17;
      task body Task18 is
         t_c_C5 : Boolean;
         t_C5 : Boolean;
         t_c_C5_DC : Boolean;
         t_C5_DC : Integer;
      begin
         accept S11;
         t_c_C5 := c_C5;
         t_C5 := C5;

         if (t_c_C5 and t_C5) then
            t_c_C5_DC := True;
            t_C5_DC := -100;
         else
            t_c_C5_DC := False;
         end if;

         c_C5_DC := t_c_C5_DC;
         C5_DC := t_C5_DC;

         t20.S18;
      end Task18;
      task body Task19 is
         t_c_C6 : Boolean;
         t_C6 : Boolean;
         t_c_C6_DC : Boolean;
         t_C6_DC : Integer;
      begin
         accept S12;

         t_c_C6 := c_C6;
         t_C6 := C6;

         if (t_c_C6 and t_C6) then
            t_c_C6_DC := True;
            t_C6_DC := -500;
         else
            t_c_C6_DC := False;
         end if;

         c_C6_DC := t_c_C6_DC;
         C6_DC := t_C6_DC;

         t20.S19;
      end Task19;
      task body Task20 is
         t_c_jet_DC : Boolean;
         t_c_C1_DC : Boolean;
         t_c_C2_DC : Boolean;
         t_c_C3_DC : Boolean;
         t_c_C4_DC : Boolean;
         t_c_C5_DC : Boolean;
         t_c_C6_DC : Boolean;
         t_C1_DC : Integer;
         t_C2_DC : Integer;
         t_C3_DC : Integer;
         t_C4_DC : Integer;
         t_C5_DC : Integer;
         t_C6_DC : Integer;
         t_jet_DC : Integer;
      begin
         accept S14; accept S15; accept S16; accept S17; accept S18; accept S19;
         t_c_C1_DC := c_C1_DC;
         t_c_C2_DC := c_C2_DC;
         t_c_C3_DC := c_C3_DC;
         t_c_C4_DC := c_C4_DC;
         t_c_C5_DC := c_C5_DC;
         t_c_C6_DC := c_C6_DC;
         t_C1_DC := C1_DC;
         t_C2_DC := C2_DC;
         t_C3_DC := C3_DC;
         t_C4_DC := C4_DC;
         t_C5_DC := C5_DC;
         t_C6_DC := C6_DC;

         t_c_jet_DC := True;
         if t_c_C1_DC then
            t_jet_DC := t_C1_DC;
         elsif t_c_C2_DC then
            t_jet_DC := t_C2_DC;
         elsif t_c_C3_DC then
            t_jet_DC := t_C3_DC;
         elsif t_c_C4_DC then
            t_jet_DC := t_C4_DC;
         elsif t_c_C5_DC then
            t_jet_DC := t_C5_DC;
         elsif t_c_C6_DC then
            t_jet_DC := t_C6_DC;
         else
            t_jet_DC := 0;
         end if;

         c_jet_DC := t_c_jet_DC;
         jet_DC := t_jet_DC;
         t03.S20;
      end Task20;
      task body Task21 is
         t_dj : Integer;
         t_c_jsT : Boolean;
         t_jsT : Boolean;
      begin
         accept S;
         t_dj := dj;

         if (not (t_dj = 0)) then
            t_c_jsT := True;
            t_jsT := True;
         else
            t_c_jsT := False;
         end if;

         c_jsT := t_c_jsT;
         jsT := t_jsT;

         t23.S21;
      end Task21;
      task body Task22 is
         t_dj : Integer;
         t_c_jsF : Boolean;
         t_jsF : Boolean;
      begin
         accept S;

         t_dj := dj;

         if (not (t_dj = 0)) then
            t_c_jsF := True;
            t_jsF := False;
         else
            t_c_jsF := False;
         end if;

         c_jsF := t_c_jsF;
         jsF := t_jsF;

         t23.S22;
      end Task22;
      task body Task23 is
         t_c_jet_sign : Boolean;
         t_c_jsT : Boolean;
         t_jet_sign : Boolean;
         t_jsT : Boolean;
         t_jsF : Boolean;
      begin
         accept S21; accept S22;

         t_c_jsT := c_jsT;
         t_jsT := jsT;
         t_jsF := jsF;

         t_c_jet_sign := True;
         if t_c_jsT then
            t_jet_sign :=  t_jsT;
         else
            t_jet_sign :=  t_jsF;
         end if;

         c_jet_sign := t_c_jet_sign;
         jet_sign := t_jet_sign;

         t05.S23; t09.S23; t10.S23;
      end Task23;
      task body Task24 is
         t_c_C1to6 : Boolean;
         t_C1to6 : Boolean;
         t_c_add_DC : Boolean;
         t_add_DC : Integer;
         t_tmp_DC : Integer;
         t_count_DC : Integer;
      begin
         accept S13;

         t_c_C1to6 := c_C1to6;
         t_C1to6 := C1to6;
         t_tmp_DC := tmp_DC;

         if (t_c_C1to6 and t_C1to6) then
            t_c_add_DC := True;
            t_add_DC := t_tmp_DC + 1;
         else
            t_c_add_DC := False;
         end if;

         if t_c_add_DC then
            t_count_DC := t_add_DC;
         else
            t_count_DC := t_tmp_DC;
         end if;

         count_DC := t_count_DC;

         t04.S24;
      end Task24;
   begin
      t01.S; t02.S; t21.S; t22.S;
   end testloop;

begin
   Start_Time := Ada.Calendar.Clock;
   --init;
   tmp_DC := 0;
   dj := 0;

   while (Number /= 0) loop
      testloop;
      Number := Number - 1;
   end loop;
   Ada.Text_IO.Put_Line(Duration'Image(Ada.Calendar.Clock - Start_Time));
end Main;




