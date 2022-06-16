--SequentialCode
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Ada.Calendar.Formatting; use Ada.Calendar.Formatting;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with System.Multiprocessors; use System.Multiprocessors;

procedure Main is
   Start_Time : Ada.Calendar.Time;
   Number : Integer := 1000;
   procedure testloop is
      Sa1, Sa2, Sa3, Sa4, Sb1, Sb2, Sb3, Sb4, Sc1, Sc2, Sc3, Sc4, S_A1, S_A2, S_A3, S_A4 : Float;
      f_sa1, f_sa2, vb, vc, fa9 : Float;
      fa1, fa2, fa3, fa4, fb1, fb2, fb3, fb4, fc1, fc2, fc3, fc4 : Float;
      b1, b2, b3, b4 : Boolean;
      ssa1, ssa2, ssb1, ssb2, ssc1, ssc2 : Float;
      ff_sa1, ff_sa2, ff_sb1, ff_sb2, ff_sc1, ff_sc2 : Float;
      ffa1, ffa2, ffa3, ffa4, fa5, fa6, fa7, fa8 : Float;
      t_fa9 : Float;
      t_ff_sa1, t_ff_sa2, t_vb, t_vc : Float;
   begin
      --init
      Sa1 := 0.1;
Sa2 := 0.2;
Sa3 := 0.3;
Sa4 := 0.4;
Sb1 := 0.5;
Sb2 := 0.6;
Sb3 := 0.7;
Sb4 := 0.8;
Sc1 := 0.9;
Sc2 := 1.0;
Sc3 := 1.1;
Sc4 := 1.2;
S_A1 := 1.3;
S_A2 := 1.4;
S_A3 := 1.5;
S_A4 := 1.6;

fa1 := 0.1 * Sa1;
fa2 := 0.1 * Sa2;
fa3 := 0.1 * Sa3;
fa4 := 0.1 * Sa4;
fb1 := 0.1 * Sb1;
fb2 := 0.1 * Sb2;
fb3 := 0.1 * Sb3;
fb4 := 0.1 * Sb4;
fc1 := 0.1 * Sc1;
fc2 := 0.1 * Sc2;
fc3 := 0.1 * Sc3;
fc4 := 0.1 * Sc4;

b1 := (fa1+fa2+fa3+fa4) > 0.20;
b2 := (fb1+fb2+fb3+fb4) > 0.21;
b3 := (fc1+fc2+fc3+fc4) > 0.22;

if(b1) then
         ssa1 := (fa2+fa3-fa1-fa4) / (fa1+fa2+fa3+fa4);
      elsif(not b1) then
         ssa1 := 0.0;
      end if;

	  if(b1) then
         ssa2 := (fa3+fa4-fa1-fa2) / (fa1+fa2+fa3+fa4);
      elsif(not b1) then
         ssa2 := 0.0;
      end if;

	  if(b2) then
         ssb1 := (fb1+fb4-fb2-fb3) / (fb1+fb2+fb3+fb4);
      elsif(not b2) then
         ssb1 := 0.0;
      end if;

	  if(b2) then
         ssb2 := (fb3+fb4-fb1-fb2) / (fb1+fb2+fb3+fb4);
      elsif(not b2) then
         ssb2 := 0.0;
      end if;

	  if(b3) then
         ssc1 := (fc1+fc4-fc2-fc3) / (fc1+fc2+fc3+fc4);
      elsif(not b3) then
         ssc1 := 0.0;
      end if;

	  if(b3) then
         ssc2 := (fc3+fc4-fc1-fc2) / (fc1+fc2+fc3+fc4);
      elsif(not b3) then
         ssc2 := 0.0;
      end if;

	  b4 := (ffa1 + ffa2 + ffa3 + ffa4) > 0.34;

	  if(b4) then
         fa5 := (ffa3+ffa4-ffa1-ffa2) / (ffa1+ffa2+ffa3+ffa4);
      end if;

	  if(b4) then
         fa6 := (ffa1+ffa4-ffa2-ffa3) / (ffa1+ffa2+ffa3+ffa4);
      end if;

	  fa7 := fa5 * 0.25;
	  fa8 := fa6 * 0.25;

	  t_fa9 := fa9;
	  t_ff_sa1 := ff_sa1;
	  t_ff_sa2 := ff_sa2;
	  t_vb := vb;
      vb := t_vb + 0.1;
	  t_vc := vc;
      vc := t_vc + 0.2;
	  fa9 := fa7 + fa8;

   end testloop;
begin
   Start_Time := Ada.Calendar.Clock;
   while (Number /= 0) loop
      testloop;
      Number := Number - 1; --Put_Line ("Number:" & Integer'Image(Number));
      --StartInput := not StartInput;
   end loop;
   Ada.Text_IO.Put_Line(Duration'Image(Ada.Calendar.Clock - Start_Time));
end Main;
