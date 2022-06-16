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

   procedure testloop is
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
   begin
      t := 10;
      time := Float (t - current_time);
      M_A := c1 * time;
      M_I := c2 * time;
      M_Omega := c3 * time;
      M_Xi := c4 * time;
      M_Eta := c5 * time;
      M_Lambda := c6 * time;

      N_A := c7 * M_A * (Cos (M_Lambda));
      N_I := (M_A * M_Xi * Sin (M_Eta)) / (Cos (M_Lambda) * c8 * M_Omega * time);
      N_Omega := (M_A * M_Xi * Cos (M_Eta)) / (Sin (M_Omega) * c9 * time);
      N_Xi := (M_A * M_Xi * Cos (M_Eta)) / (Cos (M_Lambda) * c10);
      N_Eta := (M_A * M_Xi * Sin (M_Eta)) / (Sin (M_Lambda) * c11);
      N_Lambda := (M_A * M_Xi * Sin (M_Eta)) / (Sin (M_Lambda) * c12 * M_Omega * time);

      A := M_A + N_A;
      I := M_I + N_I;
      Omega := M_Omega + N_Omega;
      Xi := M_Xi + N_Xi;
      Eta := M_Eta + N_Eta;
      Lambda := M_Lambda + N_Lambda;
   end testloop;

begin
   Start_Time := Ada.Calendar.Clock;
   --init;

   while (Number /= 0) loop
      testloop;
      Number := Number - 1;
      t := t + 1;
   end loop;
   Ada.Text_IO.Put_Line(Duration'Image(Ada.Calendar.Clock - Start_Time));
end Main;



