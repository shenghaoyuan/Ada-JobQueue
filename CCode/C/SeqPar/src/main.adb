--SEQ PAR
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Ada.Calendar.Formatting; use Ada.Calendar.Formatting;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with System.Multiprocessors; use System.Multiprocessors;

procedure Main is
   Start_Time : Ada.Calendar.Time;

   tmp_DC : Integer;
   dj : Integer;
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

   Number : Integer := 1000;
   procedure Sp is
      generic
         with procedure P;
      package PT is
      end PT;
      package body PT is
         task T;
         task body T is
         begin
            P;
         end T;
      end PT;

      procedure P1 is
         t_c_x: Boolean;
         t_x: Float;
      begin
         t_c_x := True;
         t_x := 1.0;

         c_x := t_c_x;
         x := t_x;
      end;

      procedure P2 is
         t_c_y:Boolean;
         t_y:Float;
      begin
         t_c_y := True;
         t_y := 2.0;

         c_y := t_c_y;
         y := t_y;
      end;

      procedure P5 is
         t_c_jet_sign : Boolean;
         t_jet_sign : Boolean;
      begin
         t_c_jet_sign := c_jet_sign;
         if c_jet_sign then
            t_jet_sign := jet_sign;
         end if;
      end;

      procedure P6 is
      t_c_x : Boolean;
      t_c_y : Boolean;
      t_c_f : Boolean;
      t_x : Float;
      t_y : Float;
      t_f : Float;
   begin
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
      end;

      procedure P7 is
      t_c_x : Boolean;
      t_c_y : Boolean;
      t_c_f : Boolean;
      t_c_C1 : Boolean;
      t_x : Float;
      t_y : Float;
      t_f : Float;
      t_C1 : Boolean;
      t_c_C1_DC : Boolean;
      t_C1_DC : Integer;
   begin
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
         --P14
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
      end;

      procedure P8 is
      t_c_x : Boolean;
      t_c_y : Boolean;
      t_c_f : Boolean;
      t_c_C2 : Boolean;
      t_x : Float;
      t_y : Float;
      t_f : Float;
      t_C2 : Boolean;
      t_c_C2_DC : Boolean;
      t_C2_DC : Integer;
   begin

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

         --P15
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
      end;

      procedure P9 is
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
      t_c_C3_DC : Boolean;
      t_C3_DC : Integer;
   begin

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
      end;

      procedure P10 is
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
      t_c_C4_DC : Boolean;
      t_C4_DC : Integer;
   begin
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
      end;

      procedure P11 is
      t_c_x : Boolean;
      t_c_y : Boolean;
      t_c_f : Boolean;
      t_c_C5 : Boolean;
      t_x : Float;
      t_y : Float;
      t_f : Float;
      t_C5 : Boolean;
      t_c_C5_DC : Boolean;
      t_C5_DC : Integer;
   begin
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
      end;

      procedure P12 is
      t_c_x : Boolean;
      t_c_f : Boolean;
      t_c_y : Boolean;
      t_c_C6 : Boolean;
      t_C6 : Boolean;
      t_x : Float;
      t_y : Float;
      t_f : Float;
      t_c_C6_DC : Boolean;
      t_C6_DC : Integer;
   begin
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
      end;

      procedure P13 is
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
      t_c_add_DC : Boolean;
      t_add_DC : Integer;
      t_tmp_DC : Integer;
      t_count_DC : Integer;
   begin
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

         --P24

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
      end;

      procedure P20 is
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
      end;

      procedure P21 is
      t_dj : Integer;
      t_c_jsT : Boolean;
      t_jsT : Boolean;
   begin

      t_dj := dj;

      if (not (t_dj = 0)) then
         t_c_jsT := True;
         t_jsT := True;
      else
         t_c_jsT := False;
      end if;

      c_jsT := t_c_jsT;
         jsT := t_jsT;
      end;
      procedure P22 is
      t_dj : Integer;
      t_c_jsF : Boolean;
      t_jsF : Boolean;
   begin
      t_dj := dj;

      if (not (t_dj = 0)) then
         t_c_jsF := True;
         t_jsF := False;
      else
         t_c_jsF := False;
      end if;

      c_jsF := t_c_jsF;
         jsF := t_jsF;
      end;
      procedure P23 is
      t_c_jet_sign : Boolean;
      t_c_jsT : Boolean;
      t_jet_sign : Boolean;
      t_jsT : Boolean;
      t_jsF : Boolean;
   begin
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
      end;

      procedure T1_1 is
      begin
         declare
            package I_P1 is New PT(P1);
            package I_P2 is New PT(P2);
         begin null;
         end;
         P6;
      end;

      procedure T1_2 is
      begin
         declare
            package I_P21 is New PT(P21);
            package I_P22 is New PT(P22);
         begin null;
         end;
         P23;
      end;

      procedure T1 is
      begin
         declare
            package I_T1_1 is New PT(T1_1);
            package I_T1_2 is New PT(T1_2);
         begin null;
         end;
      end;

      procedure T2_1_1 is
      begin
         declare
            package I_P7 is New PT(P7);
            package I_P8 is New PT(P8);
            package I_P9 is New PT(P9);
            package I_P10 is New PT(P10);
            package I_P11 is New PT(P11);
            package I_P12 is New PT(P12);
         begin null;
         end;
      end;

      procedure T2_1_2 is
      begin
         declare
            package I_P13 is New PT(P13);
            package I_P20 is New PT(P20);
         begin null;
         end;
      end;

      procedure T2_1 is
      begin
         T2_1_1;
         T2_1_2;
      end;

      procedure T2 is
      begin
         declare
            package I_P5 is New PT(P5);
            package I_T2_1 is New PT(T2_1);
         begin null;
         end;
      end;

   begin
      T1;
      T2;
   end Sp;
begin
   Start_Time := Ada.Calendar.Clock;
   --init;
   tmp_DC := 0;
   dj := 0;

   while (Number /= 0) loop
      Sp;
      Number := Number - 1;
   end loop;
   Ada.Text_IO.Put_Line(Duration'Image(Ada.Calendar.Clock - Start_Time));
end Main;
