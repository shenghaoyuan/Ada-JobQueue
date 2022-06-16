--Basic Code
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
   --  C: array (1..8) of CPU_Range := (1, 1, 1, 1, 1, 1, 1, 1);
   --  C: array (1..8) of CPU_Range := (1, 2, 1, 2, 1, 2, 1, 2);
   C: array (1..8) of CPU_Range := (1, 2, 3, 4, 1, 2, 3, 4);
   --C: array (1..8) of CPU_Range := (1, 2, 3, 4, 5, 6, 7, 8);

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

      task type Task1 with CPU => C(1) is --read t;
         entry S;
      end Task1;
      t01 : Task1;

      task type Task2 with CPU => C(2) is -- time :=
         entry St;
      end Task2;
      t02 : Task2;

      task type Task3 with CPU => C(3) is -- M_I
         entry Stime;
      end Task3;
      t03 : Task3;

      task type Task4 with CPU => C(4) is -- M_Lambda
         entry Stime;
      end Task4;
      t04 : Task4;

      task type Task5 with CPU => C(5) is -- M_A
         entry Stime;
      end Task5;
      t05 : Task5;

      task type Task6 with CPU => C(6) is -- M_Eta
         entry Stime;
      end Task6;
      t06 : Task6;

      task type Task7 with CPU => C(7) is -- M_Xi
         entry Stime;
      end Task7;
      t07 : Task7;

      task type Task8 with CPU => C(8) is -- M_Omega
         entry Stime;
      end Task8;
      t08 : Task8;

      task type Task9 with CPU => C(1) is -- N_A
         entry Smlambda; entry Sma;
      end Task9;
      t09 : Task9;

      task type Task10 with CPU => C(2) is -- N_Eta
         entry Smlambda; entry Sma; entry Smeta; entry Smxi;
      end Task10;
      t10 : Task10;

      task type Task11 with CPU => C(3) is -- N_Xi
         entry Smlambda; entry Sma; entry Smeta; entry Smxi;
      end Task11;
      t11 : Task11;

      task type Task12 with CPU => C(4) is -- N_I
         entry Smlambda; entry Sma; entry Smeta; entry Smxi; entry Smomega;
      end Task12;
      t12 : Task12;

      task type Task13 with CPU => C(5) is -- N_Lambda
         entry Smlambda; entry Sma; entry Smeta; entry Smxi; entry Smomega;
      end Task13;
      t13 : Task13;

      task type Task14 with CPU => C(6) is -- N_Omega
         entry Sma; entry Smeta; entry Smxi; entry Smomega;
      end Task14;
      t14 : Task14;

      task type Task15 with CPU => C(7) is -- A
         entry Sna;
      end Task15;
      t15 : Task15;

      task type Task16 with CPU => C(8) is -- Eta
         entry Sneta;
      end Task16;
      t16 : Task16;

      task type Task17 with CPU => C(1) is -- Xi
         entry Snxi;
      end Task17;
      t17 : Task17;

      task type Task18 with CPU => C(2) is -- I
         entry Smi; entry Sni;
      end Task18;
      t18 : Task18;

      task type Task19 with CPU => C(3) is -- Lambda
         entry Snlambda;
      end Task19;
      t19 : Task19;

      task type Task20 with CPU => C(4) is -- Omega
         entry Snomega;
      end Task20;
      t20 : Task20;

      task type Task21 with CPU => C(5) is -- write A
         entry Sa;
      end Task21;
      t21 : Task21;

      task type Task22 with CPU => C(6) is -- write Eta
         entry Seta;
      end Task22;
      t22 : Task22;

      task type Task23 with CPU => C(7) is -- write Xi
         entry Sxi;
      end Task23;
      t23 : Task23;

      task type Task24 with CPU => C(8) is -- write I
         entry Si;
      end Task24;
      t24 : Task24;

      task type Task25 with CPU => C(1) is -- write Lambda
         entry Slambda;
      end Task25;
      t25 : Task25;

      task type Task26 with CPU => C(2) is -- write Omega
         entry Somega;
      end Task26;
      t26 : Task26;

      task body Task1 is
         t_t : Integer;
      begin
         accept S;
         t_t := 10;
         t := t_t;
         t02.St;
      end Task1;

      task body Task2 is
         t_time : Float;
         t_t : Integer;
      begin
         accept St;
         t_t := t;

         t_time := Float (t_t - current_time);

         time := t_time;
         t03.Stime; t04.Stime; t05.Stime; t06.Stime; t07.Stime; t08.Stime;
      end Task2;

      task body Task3 is
         t_time : Float;
         t_M_I : Float;
      begin
         accept Stime;
         t_time := time;

         t_M_I := c2 * t_time;

         M_I := t_M_I;
         t18.Smi;
      end Task3;

      task body Task4 is
         t_time : Float;
         t_M_Lambda : Float;
      begin
         accept Stime;
         t_time := time;

         t_M_Lambda := c6 * t_time;

         M_Lambda := M_Lambda;
         t09.Smlambda; t10.Smlambda; t11.Smlambda; t12.Smlambda; t13.Smlambda;
      end Task4;

      task body Task5 is
         t_time : Float;
         t_M_A : Float;
      begin
         accept Stime;
         t_time := time;
         t_M_A := c1 * t_time;

         M_A := t_M_A;
         t09.Sma; t10.Sma; t11.Sma; t12.Sma; t13.Sma; t14.Sma;
      end Task5;

      task body Task6 is
         t_time : Float;
         t_M_Eta : Float;
      begin
         accept Stime;
         t_time := time;
         t_M_Eta := c5 * t_time;

         M_Eta := t_M_Eta;
         t10.Smeta; t11.Smeta; t12.Smeta; t13.Smeta; t14.Smeta;
      end Task6;

      task body Task7 is
         t_time : Float;
         t_M_Xi : Float;
      begin
         accept Stime;
         t_time := time;
         t_M_Xi:= c4 * t_time;

         M_Xi := t_M_Xi;
         t10.Smxi; t11.Smxi; t12.Smxi; t13.Smxi; t14.Smxi;
      end Task7;

      task body Task8 is
         t_time : Float;
         t_M_Omega : Float;
      begin
         accept Stime;
         t_time := time;
         t_M_Omega := c3 * t_time;

         M_Omega := t_M_Omega;
         t12.Smomega; t13.Smomega; t14.Smomega;
      end Task8;

      task body Task9 is
         t_M_A : Float;
         t_M_Lambda : Float;
         t_N_A : Float;
      begin
         accept Sma; accept Smlambda;
         t_M_A := M_A;
         t_M_Lambda := M_Lambda;
		 
         t_N_A := c7 * t_M_A * (Cos (t_M_Lambda));

         N_A := t_N_A;
         t15.Sna;
      end Task9;
      
      task body Task10 is
         t_M_A : Float;
         t_M_Xi : Float;
         t_M_Eta : Float;
         t_M_Lambda : Float;
         t_N_Eta : Float;
      begin
         accept Sma; accept Smlambda; accept Smxi; accept Smeta; 
         t_M_A := M_A;
         t_M_Xi := M_Xi;
         t_M_Eta := M_Eta;
         t_M_Lambda := M_Lambda;
		 
         t_N_Eta := (t_M_A * t_M_Xi * Sin (t_M_Eta)) / (Sin (t_M_Lambda) * c11);
		 
         N_Eta := t_N_Eta;
         t16.Sneta;
      end Task10;

      task body Task11 is
         t_M_A : Float;
         t_M_Xi : Float;
         t_M_Eta : Float;
         t_M_Lambda : Float;
         t_N_Xi : Float;

      begin
         accept Smlambda; accept Sma; accept Smeta; accept Smxi;
         t_M_A := M_A;
         t_M_Xi := M_Xi;
         t_M_Eta := M_Eta;
         t_M_Lambda := M_Lambda;
		 
         t_N_Xi := (t_M_A * t_M_Xi * Cos (t_M_Eta)) / (Cos (t_M_Lambda) * c10);
		 
         N_Xi := t_N_Xi;
         t17.Snxi;
      end Task11;

      task body Task12 is
         t_M_A : Float;
         t_M_Xi : Float;
         t_M_Eta : Float;
         t_M_Omega : Float;
         t_M_Lambda : Float;
         t_time : Float;
         t_N_I : Float;

      begin
         accept Smlambda; accept Sma; accept Smeta; accept Smxi; accept Smomega;
         t_M_A := M_A;
         t_M_Xi := M_Xi;
         t_M_Eta := M_Eta;
         t_M_Omega := M_Omega;
         t_M_Lambda := M_Lambda;
         t_time := time;
		 
         t_N_I := (t_M_A * t_M_Xi * Sin (t_M_Eta)) / (Cos (t_M_Lambda) * c8 * t_M_Omega * t_time);
		 
         N_I := t_N_I;
         t18.Sni;
      end Task12;

      task body Task13 is
         t_M_A : Float;
         t_M_Xi : Float;
         t_M_Eta : Float;
         t_M_Lambda : Float;
         t_M_Omega : Float;
         t_time : Float;
         t_N_Lambda : Float;

      begin
         accept Smlambda; accept Sma; accept Smeta; accept Smxi; accept Smomega;
         t_M_A := M_A;
         t_M_Xi := M_Xi;
         t_M_Eta := M_Eta;
         t_M_Omega := M_Omega;
         t_M_Lambda := M_Lambda;
         t_time := time;

         t_N_Lambda := (t_M_A * t_M_Xi * Sin (t_M_Eta)) / (Sin (t_M_Lambda) * c12 * t_M_Omega * t_time);
		 
         N_Lambda := t_N_Lambda;
         t19.Snlambda;

      end Task13;

      task body Task14 is
         t_M_A : Float;
         t_M_Xi : Float;
         t_M_Eta : Float;
         t_M_Omega : Float;
         t_time : Float;
         t_N_Omega : Float;

      begin
         accept Sma; accept Smeta; accept Smxi; accept Smomega;
         t_M_A := M_A;
         t_M_Xi := M_Xi;
         t_M_Eta := M_Eta;
         t_M_Omega := M_Lambda;
         t_time := time;
		 
         t_N_Omega := (t_M_A * t_M_Xi * Cos (t_M_Eta)) / (Sin (t_M_Omega) * c9 * t_time);
		 
         N_Omega := t_N_Omega;
         t20.Snomega;
      end Task14;
	  
 
      task body Task15 is
         t_M_A : Float;
         t_N_A : Float;
         t_A : Float;
      begin
         accept Sna;
         t_M_A := M_A;
         t_N_A := N_A;
		 
         t_A := t_M_A + t_N_A;
		 
         A := t_A;
         t21.Sa;

      end Task15;

      task body Task16 is
         t_M_Eta : Float;
         t_N_Eta : Float;
         t_Eta : Float;
      begin
         accept Sneta;
         t_M_Eta := M_Eta;
         t_N_Eta := N_Eta;
		 
         t_Eta := t_M_Eta + t_N_Eta;
		 
         Eta := t_Eta;
         t22.Seta;
      end Task16;

      task body Task17 is
         t_M_Xi : Float;
         t_N_Xi : Float;
         t_Xi : Float;
      begin
         accept Snxi;
         t_M_Xi := M_Xi;
         t_N_Xi := N_Xi;		 
		 
         t_Xi := t_M_Xi + t_N_Xi;
		 
         Xi := t_Xi;
         t23.Sxi;
	  

      end Task17;

      task body Task18 is
         t_M_I : Float;
         t_N_I : Float;
         t_I : Float;
      begin
         
         accept Sni; accept Smi;
         t_M_I := M_I;
         t_N_I := N_I;
		 
         t_I := t_M_I + t_N_I;
		 
         I := t_I;
         t24.Si;

      end Task18;

      task body Task19 is
         t_M_Lambda : Float;
         t_N_Lambda : Float;
         t_Lambda : Float;

      begin
         accept Snlambda;
         t_M_Lambda := M_Lambda;
         t_N_Lambda := N_Lambda;
		 
         t_Lambda := t_M_Lambda + t_N_Lambda;
		 
         Lambda := t_Lambda;
         t25.Slambda;

      end Task19;

      task body Task20 is
         t_M_Omega : Float;
         t_N_Omega : Float;
         t_Omega : Float;

      begin
         
         accept Snomega;
         t_M_Omega := M_Omega;
         t_N_Omega := N_Omega;
		 
		 
         t_Omega := t_M_Omega + t_N_Omega;
		 
		 
         Omega := t_Omega;
         t26.Somega;

      end Task20;

      task body Task21 is
         t_A : Float;
      begin
         accept Sa;
         t_A := A;
      end Task21;

      task body Task22 is
         t_Eta : Float;
      begin
         accept Seta;
		 
         t_Eta := Eta;

      end Task22;

      task body Task23 is

         t_Xi : Float;
      begin
         accept Sxi;
		 
         t_Xi := Xi;

      end Task23;

      task body Task24 is
	  
         t_I : Float;

      begin
         accept Si;
		 
         t_I := I;

      end Task24;

      task body Task25 is
	  
         t_Lambda : Float;

      begin
         accept Slambda;
		 
         t_Lambda := Lambda;

      end Task25;

      task body Task26 is
	  
         t_Omega : Float;

      begin
         accept Somega;
		 
         t_Omega := Omega;

      end Task26;

   begin
      t01.S;
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




