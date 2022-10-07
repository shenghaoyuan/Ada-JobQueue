--SEQ PAR
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Ada.Calendar.Formatting; use Ada.Calendar.Formatting;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with System.Multiprocessors; use System.Multiprocessors;

with Ada.Numerics.Generic_Elementary_Functions;

procedure Main is

   package newEF is new Ada.Numerics.Generic_Elementary_Functions (Float_Type => Float);
   use newEF;
   Start_Time : Ada.Calendar.Time;

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
         t_t : Integer;
      begin
         t_t := 10;
         t := t_t;
      end;

      procedure P2 is
         t_time : Float;
         t_t : Integer;
      begin
         t_t := t;

         t_time := Float (t_t - current_time);

         time := t_time;
      end;

      procedure P3 is
         t_time : Float;
         t_M_I : Float;
      begin
         t_time := time;

         t_M_I := c2 * t_time;

         M_I := t_M_I;
      end P3;

      procedure P4 is
         t_time : Float;
         t_M_Lambda : Float;
      begin
         t_time := time;

         t_M_Lambda := c6 * t_time;

         M_Lambda := M_Lambda;
      end P4;

      procedure P5 is
         t_time : Float;
         t_M_A : Float;
      begin
         t_time := time;
         t_M_A := c1 * t_time;

         M_A := t_M_A;
      end;

      procedure P6 is
         t_time : Float;
         t_M_Eta : Float;
      begin
         t_time := time;
         t_M_Eta := c5 * t_time;

         M_Eta := t_M_Eta;
      end;

      procedure P7 is
         t_time : Float;
         t_M_Xi : Float;
      begin
         t_time := time;
         t_M_Xi:= c4 * t_time;

         M_Xi := t_M_Xi;
      end;

      procedure P8 is
         t_time : Float;
         t_M_Omega : Float;
      begin
         t_time := time;
         t_M_Omega := c3 * t_time;

         M_Omega := t_M_Omega;
      end;

      procedure P9 is
         t_M_A : Float;
         t_M_Lambda : Float;
         t_N_A : Float;
         t_A : Float;
         tt_A : Float;
      begin
         t_M_A := M_A;
         t_M_Lambda := M_Lambda;

         t_N_A := c7 * t_M_A * (Cos (t_M_Lambda));

         N_A := t_N_A;

         t_A := t_M_A + t_N_A;

         A := t_A;

         tt_A := A;
      end;

      procedure P10 is
         t_M_A : Float;
         t_M_Xi : Float;
         t_M_Eta : Float;
         t_M_Lambda : Float;
         t_N_Eta : Float;
         t_Eta : Float;
         tt_Eta : Float;
      begin
         t_M_A := M_A;
         t_M_Xi := M_Xi;
         t_M_Eta := M_Eta;
         t_M_Lambda := M_Lambda;

         t_N_Eta := (t_M_A * t_M_Xi * Sin (t_M_Eta)) / (Sin (t_M_Lambda) * c11);

         N_Eta := t_N_Eta;

         t_Eta := t_M_Eta + t_N_Eta;

         Eta := t_Eta;

         tt_Eta := Eta;
      end;

      procedure P11 is
         t_M_A : Float;
         t_M_Xi : Float;
         t_M_Eta : Float;
         t_M_Lambda : Float;
         t_N_Xi : Float;
         t_Xi : Float;
         tt_Xi : Float;
      begin
         t_M_A := M_A;
         t_M_Xi := M_Xi;
         t_M_Eta := M_Eta;
         t_M_Lambda := M_Lambda;

         t_N_Xi := (t_M_A * t_M_Xi * Cos (t_M_Eta)) / (Cos (t_M_Lambda) * c10);

         N_Xi := t_N_Xi;

         t_Xi := t_M_Xi + t_N_Xi;

         Xi := t_Xi;

         tt_Xi := Xi;
      end;

      procedure P12 is
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
      end;

      procedure P13 is
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
      end;

      procedure P14 is
         t_M_A : Float;
         t_M_Xi : Float;
         t_M_Eta : Float;
         t_M_Omega : Float;
         t_time : Float;
         t_N_Omega : Float;
         t_Omega : Float;
         tt_Omega : Float;
      begin
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
      end;

      procedure T1 is
      begin
         declare
            package I1 is New PT(P3);
            package I2 is New PT(P4);
            package I3 is New PT(P5);
            package I4 is New PT(P6);
            package I5 is New PT(P7);
            package I6 is New PT(P8);
         begin null;
         end;
      end;
      procedure T2 is
      begin
         declare
            package I7 is New PT(P9);
            package I8 is New PT(P10);
            package I9 is New PT(P11);
            package I10 is New PT(P12);
            package I11 is New PT(P13);
            package I12 is New PT(P14);
         begin null;
         end;
      end;

   begin
      P1;
      P2;
      T1;
      T2;
   end Sp;
begin
   Start_Time := Ada.Calendar.Clock;
   --init;

   while (Number /= 0) loop
      Sp;
      Number := Number - 1;
   end loop;
   Ada.Text_IO.Put_Line(Duration'Image(Ada.Calendar.Clock - Start_Time));
end Main;
