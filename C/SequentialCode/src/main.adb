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

   tmp_DC : Integer;
   dj : Integer;

   procedure testloop is
      x, y : Float;
      jet_sign : Boolean;
      count_DC, jet_DC : Integer;
      C1_DC, C2_DC, C3_DC, C4_DC, C5_DC, C6_DC : Integer;
      add_DC : Integer;
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
   begin
      --01
      c_x := True;
      x := 1.0;
      --02
      c_y := True;
      y := 2.0;
      --21
      if (not (dj = 0)) then
         c_jsT := True;
         jsT := True;
      else
         c_jsT := False;
      end if;
      --22
      if (not (dj = 0)) then
         c_jsF := True;
         jsF := False;
      else
         c_jsF := False;
      end if;
      --06
      if (c_x and c_y) then
         c_f := True;
         f := y + 0.05 * x;
      else
         c_f := False;
      end if;
      --23
      c_jet_sign := True;
      if c_jsT then
         jet_sign :=  jsT;
      else
         jet_sign :=  jsF;
      end if;
      --05
      --delay 0.00005;
      --07
      if (c_x and c_f and c_y) then
         c_C1 := True;
         C1 := (x < -0.5) and (f < -0.25) and (y < 0.15);

      else
         c_C1 := False;
      end if;
      --08
      if (c_x and c_f and c_y) then
         c_C2 := True;
         C2 := (x < -1.0) and (-0.25 <= f) and (f < -0.15) and (y > 1.0);

      else
         c_C2 := False;
      end if;
      --09
      if (c_x and c_f and c_y and c_jet_sign) then
         c_C3 := True;
         C3 := ((x < -1.0) and (-0.15 <= f) and (f < -0.1) and (y < 1.0)) or ((x < -2.0) and (-0.1 <= f) and (f < -0.05) and (y < 0.15)) or ((-2.0 <= x)and (x < -1.0) and (-0.1 <= f) and (f < -0.05) and (jet_sign = False));
      else
         c_C3 := False;
      end if;
      --10
      if (c_x and c_f and c_y and c_jet_sign) then
         c_C4 := True;
         C4 := ( (1.0 < x) and (x <= 2.0) and (0.05 < f) and (f <= 0.1) and (jet_sign = False) ) or ( (x > 1.0) and (0.05 < f) and (f <= 0.1) and (y > -0.15) ) or ( (x > 2.0) and (0.1 < f) and (f <= 0.15) and (y > -0.15) );
      else
         c_C4 := False;
      end if;
      --11
      if (c_x and c_f and c_y) then
         c_C5 := True;
         C5 := (x > 1.0) and (0.15 < f) and (f <= 0.25) and (y > -1.0);
      else
         c_C5 := False;
      end if;
      --12
      if (c_x and c_f and c_y) then
         c_C6 := True;
         C6 := (x > 0.5) and (f > 0.25) and (y > -1.0);

      else
         c_C6 := False;
      end if;
      --13
      if (c_C1 and c_C2 and c_C3 and c_C4 and c_C5 and c_C6) then
         c_C1to6 := True;
         C1to6 := C1 or C2 or C3 or C4 or C5 or C6;
      else
         c_C1to6 := False;
      end if;
      if (c_C1to6 and C1to6) then
         c_add_DC := True;
         add_DC := tmp_DC + 1;
      else
         c_add_DC := False;
      end if;


      if c_add_DC then
         count_DC := add_DC;
      else
         count_DC := tmp_DC;
      end if;
      --14
      if (c_C1 and C1) then
         c_C1_DC := True;
         C1_DC := 500;
      else
         c_C1_DC := False;
      end if;
      --15
      if (c_C2 and C2) then
         c_C2_DC := True;
         C2_DC := 100;
      else
         c_C2_DC := False;
      end if;
      --16
      if (c_C3 and C3) then
         c_C3_DC := True;
         C3_DC := 10;
      else
         c_C3_DC := False;
      end if;
      --17
      if (c_C4 and C4) then
         c_C4_DC := True;
         C4_DC := -10;
      else
         c_C4_DC := False;
      end if;
      --18
      if (c_C5 and C5) then
         c_C5_DC := True;
         C5_DC := -100;
      else
         c_C5_DC := False;
      end if;
      --19
      if (c_C6 and C6) then
         c_C6_DC := True;
         C6_DC := -500;
      else
         c_C6_DC := False;
      end if;
      --20
      c_jet_DC := True;
      if c_C1_DC then
         jet_DC := C1_DC;
      elsif c_C2_DC then
         jet_DC := C2_DC;
      elsif c_C3_DC then
         jet_DC := C3_DC;
      elsif c_C4_DC then
         jet_DC := C4_DC;
      elsif c_C5_DC then
         jet_DC := C5_DC;
      elsif c_C6_DC then
         jet_DC := C6_DC;
      else
         jet_DC := 0;
      end if;
      --03
      --delay 0.00005;
      --24
      --delay 0.00021;
      --25
      --delay 0.00021;
      --04
      --delay 0.00005;
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



