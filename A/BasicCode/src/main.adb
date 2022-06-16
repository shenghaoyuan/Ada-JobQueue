--BasicCode
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Ada.Calendar.Formatting; use Ada.Calendar.Formatting;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with System.Multiprocessors; use System.Multiprocessors;

procedure Main is
   Start_Time : Ada.Calendar.Time;
   Number : Integer := 1000;
   --  C: array (1..8) of CPU_Range := (1, 1, 1, 1, 1, 1, 1, 1);
   --  C: array (1..8) of CPU_Range := (1, 2, 1, 2, 1, 2, 1, 2);
   C: array (1..8) of CPU_Range := (1, 2, 3, 4, 1, 2, 3, 4);
   --C: array (1..8) of CPU_Range := (1, 2, 3, 4, 5, 6, 7, 8);
   procedure testloop is
      Sa1, Sa2, Sa3, Sa4, Sb1, Sb2, Sb3, Sb4, Sc1, Sc2, Sc3, Sc4, S_A1, S_A2, S_A3, S_A4 : Float;
      vb, vc, fa9 : Float;
      fa1, fa2, fa3, fa4, fb1, fb2, fb3, fb4, fc1, fc2, fc3, fc4 : Float;
      b1, b2, b3, b4 : Boolean;
      ssa1, ssa2, ssb1, ssb2, ssc1, ssc2 : Float;
      ff_sa1, ff_sa2, ff_sb1, ff_sb2, ff_sc1, ff_sc2 : Float;
      ffa1, ffa2, ffa3, ffa4, fa5, fa6, fa7, fa8 : Float;

      task type Task1 with CPU => C(1) is
         entry Start;
      end Task1;
      t01: Task1;
      task type Task2 with CPU => C(2) is
         entry Start;
      end Task2;
      t02: Task2;
      task type Task3 with CPU => C(3) is
         entry Start;
      end Task3;
      t03: Task3;
      task type Task4 with CPU => C(4) is
         entry Start;
      end Task4;
      t04: Task4;
      task type Task5 with CPU => C(5) is
         entry Start;
      end Task5;
      t05: Task5;
      task type Task6 with CPU => C(6) is
         entry Start;
      end Task6;
      t06: Task6;
      task type Task7 with CPU => C(7) is
         entry Start;
      end Task7;
      t07: Task7;
      task type Task8 with CPU => C(8) is
         entry Start;
      end Task8;
      t08: Task8;
      task type Task9 with CPU => C(1) is
         entry Start;
      end Task9;
      t09: Task9;
      task type Task10 with CPU => C(2) is
         entry Start;
      end Task10;
      t10: Task10;
      task type Task11 with CPU => C(3) is
         entry Start;
      end Task11;
      t11: Task11;
      task type Task12 with CPU => C(4) is
         entry Start;
      end Task12;
      t12: Task12;
      task type Task13 with CPU => C(5) is
         entry Start;
      end Task13;
      t13: Task13;
      task type Task14 with CPU => C(6) is
         entry Start;
      end Task14;
      t14: Task14;
      task type Task15 with CPU => C(7) is
         entry Start;
      end Task15;
      t15: Task15;
      task type Task16 with CPU => C(8) is
         entry Start;
      end Task16;
      t16: Task16;

      task type Task22 with CPU => C(1) is
         entry s01;
      end Task22;
      t22: Task22;
      task type Task23 with CPU => C(2) is
         entry s02;
      end Task23;
      t23: Task23;
      task type Task24 with CPU => C(3) is
         entry s03;
      end Task24;
      t24: Task24;
      task type Task25 with CPU => C(4) is
         entry s04;
      end Task25;
      t25: Task25;
      task type Task26 with CPU => C(5) is
         entry s05;
      end Task26;
      t26: Task26;
      task type Task27 with CPU => C(6) is
         entry s06;
      end Task27;
      t27: Task27;
      task type Task28 with CPU => C(7) is
         entry s07;
      end Task28;
      t28: Task28;
      task type Task29 with CPU => C(8) is
         entry s08;
      end Task29;
      t29: Task29;
      task type Task30 with CPU => C(1) is
         entry s09;
      end Task30;
      t30: Task30;
      task type Task31 with CPU => C(2) is
         entry s10;
      end Task31;
      t31: Task31;
      task type Task32 with CPU => C(3) is
         entry s11;
      end Task32;
      t32: Task32;
      task type Task33 with CPU => C(4) is
         entry s12;
      end Task33;
      t33: Task33;
      task type Task34 with CPU => C(5) is
         entry s22; entry s23; entry s24; entry s25;
      end Task34;
      t34: Task34;
      task type Task35 with CPU => C(6) is
         entry s26; entry s27; entry s28; entry s29;
      end Task35;
      t35: Task35;
      task type Task36 with CPU => C(7) is
         entry s30; entry s31; entry s32; entry s33;
      end Task36;
      t36: Task36;
      task type Task37 with CPU => C(8) is
         entry s34;
      end Task37;
      t37: Task37;
      task type Task38 with CPU => C(1) is
         entry s34;
      end Task38;
      t38: Task38;
      task type Task39 with CPU => C(2) is
         entry s34;
      end Task39;
      t39: Task39;
      task type Task40 with CPU => C(3) is
         entry s34;
      end Task40;
      t40: Task40;
      task type Task41 with CPU => C(4) is
         entry s35;
      end Task41;
      t41: Task41;
      task type Task42 with CPU => C(5) is
         entry s35;
      end Task42;
      t42: Task42;
      task type Task43 with CPU => C(6) is
         entry s35;
      end Task43;
      t43: Task43;
      task type Task44 with CPU => C(7) is
         entry s35;
      end Task44;
      t44: Task44;
      task type Task45 with CPU => C(8) is
         entry s36;
      end Task45;
      t45: Task45;
      task type Task46 with CPU => C(1) is
         entry s36;
      end Task46;
      t46: Task46;
      task type Task47 with CPU => C(2) is
         entry s36;
      end Task47;
      t47: Task47;
      task type Task48 with CPU => C(3) is
         entry s36;
      end Task48;
      t48: Task48;
      task type Task49 with CPU => C(4) is
         entry s37; entry s39;
      end Task49;
      t49: Task49;
      task type Task50 with CPU => C(5) is
         entry s38; entry s40;
      end Task50;
      t50: Task50;
      task type Task51 with CPU => C(6) is
         entry s41; entry s43;
      end Task51;
      t51: Task51;
      task type Task52 with CPU => C(7) is
         entry s42; entry s44;
      end Task52;
      t52: Task52;
      task type Task53 with CPU => C(8) is
         entry s45; entry s47;
      end Task53;
      t53: Task53;
      task type Task54 with CPU => C(1) is
         entry s46; entry s48;
      end Task54;
      t54: Task54;
      task type Task59 with CPU => C(4) is
         entry s13;
      end Task59;
      t59: Task59;
      task type Task60 with CPU => C(5) is
         entry s14;
      end Task60;
      t60: Task60;
      task type Task61 with CPU => C(6) is
         entry s15;
      end Task61;
      t61: Task61;
      task type Task62 with CPU => C(7) is
         entry s16;
      end Task62;
      t62: Task62;
      task type Task63 with CPU => C(8) is
         entry s59; entry s60; entry s61; entry s62;
      end Task63;
      t63: Task63;
      task type Task64 with CPU => C(1) is
         entry s63;
      end Task64;
      t64: Task64;
      task type Task65 with CPU => C(2) is
         entry s63;
      end Task65;
      t65: Task65;
      task type Task66 with CPU => C(3) is
         entry s64;
      end Task66;
      t66: Task66;
      task type Task67 with CPU => C(4) is
         entry s65;
      end Task67;
      t67: Task67;
      task type Task68 with CPU => C(5) is
         entry s66; entry s67;
      end Task68;
      t68: Task68;
      task type Task17 with CPU => C(6) is
         entry s49;
      end Task17;
      t17: Task17;
      task type Task18 with CPU => C(7) is
         entry s50;
      end Task18;
      t18: Task18;
      task type Task19 with CPU => C(8) is
         entry s51; entry s52;
      end Task19;
      t19: Task19;
      task type Task20 with CPU => C(1) is
         entry s53; entry s54;
      end Task20;
      t20: Task20;
      task type Task21 with CPU => C(2) is
         entry s68;
      end Task21;
      t21: Task21;

      task body Task1 is
         t_Sa1 : Float;
      begin
         accept Start;

         t_Sa1 := 0.1;
         Sa1 := t_Sa1;

         t22.s01;
      end Task1;
      task body Task2 is
         t_Sa2 : Float;
      begin
         accept Start;

         t_Sa2 := 0.2;
         Sa2 := t_Sa2;

         t23.s02;
      end Task2;
      task body Task3 is
         t_Sa3 : Float;
      begin
         accept Start;

         t_Sa3 := 0.3;
         Sa3 := t_Sa3;

         t24.s03;
      end Task3;
      task body Task4 is
         t_Sa4 : Float;
      begin
         accept Start;

         t_Sa4 := 0.4;
         Sa4 := t_Sa4;

         t25.s04;
      end Task4;
      task body Task5 is
         t_Sb1 : Float;
      begin
         accept Start;

         t_Sb1 := 0.5;
         Sb1 := t_Sb1;

         t26.s05;
      end Task5;
      task body Task6 is
         t_Sb2 : Float;
      begin
         accept Start;

         t_Sb2 := 0.6;
         Sb2 := t_Sb2;

         t27.s06;
      end Task6;
      task body Task7 is
         t_Sb3 : Float;
      begin
         accept Start;

         t_Sb3 := 0.7;
         Sb3 := t_Sb3;

         t28.s07;
      end Task7;
      task body Task8 is
         t_Sb4 : Float;
      begin
         accept Start;

         t_Sb4 := 0.8;
         Sb4 := t_Sb4;

         t29.s08;
      end Task8;
      task body Task9 is
         t_Sc1 : Float;
      begin
         accept Start;

         t_Sc1 := 0.9;
         Sc1 := t_Sc1;

         t30.s09;
      end Task9;
      task body Task10 is
         t_Sc2 : Float;
      begin
         accept Start;

         t_Sc2 := 1.0;
         Sc2 := t_Sc2;

         t31.s10;
      end Task10;
      task body Task11 is
         t_Sc3 : Float;
      begin
         accept Start;

         t_Sc3 := 1.1;
         Sc3 := t_Sc3;

         t32.s11;
      end Task11;
      task body Task12 is
         t_Sc4 : Float;
      begin
         accept Start;

         t_Sc4 := 1.2;
         Sc4 := t_Sc4;

         t33.s12;
      end Task12;
      task body Task13 is
         t_S_A1 : Float;
      begin
         accept Start;

         t_S_A1 := 1.3;
         S_A1 := t_S_A1;

         t59.s13;
      end Task13;
      task body Task14 is
         t_S_A2 : Float;
      begin
         accept Start;

         t_S_A2 := 1.4;
         S_A2 := t_S_A2;

         t60.s14;
      end Task14;
      task body Task15 is
         t_S_A3 : Float;
      begin
         accept Start;

         t_S_A3 := 1.5;
         S_A3 := t_S_A3;

         t61.s15;
      end Task15;
      task body Task16 is
         t_S_A4 : Float;
      begin
         accept Start;
         t_S_A4 := 1.6;
         S_A4 := t_S_A4;

         t62.s16;
      end Task16;

      --Req1.1
      task body Task22 is
         t_Sa1 : Float;
         t_fa1 : Float;
      begin
         accept s01;

         t_Sa1 := Sa1;
         t_fa1 := 0.1 * t_Sa1;
         fa1 := t_fa1;

         t34.s22;
      end Task22;
      task body Task23 is
         t_Sa2 : Float;
         t_fa2 : Float;
      begin
         accept s02;

         t_Sa2 := Sa2;
         t_fa2 := 0.1 * t_Sa2;
         fa2 := t_fa2;

         t34.s23;
      end Task23;
      task body Task24 is
         t_Sa3 : Float;
         t_fa3 : Float;
      begin
         accept s03;

         t_Sa3 := Sa3;
         t_fa3 := 0.1 * t_Sa3;
         fa3 := t_fa3;

         t34.s24;
      end Task24;
      task body Task25 is
         t_Sa4 : Float;
         t_fa4 : Float;
      begin
         accept s04;

         t_Sa4 := Sa4;
         t_fa4 := 0.1 * t_Sa4;
         fa4 := t_fa4;

         t34.s25;
      end Task25;

      task body Task26 is
         t_Sb1 : Float;
         t_fb1 : Float;
      begin
         accept s05;

         t_Sb1 := Sb1;
         t_fb1 := 0.1 * t_Sb1;
         fb1 := t_fb1;

         t35.s26;
      end Task26;
      task body Task27 is
         t_Sb2 : Float;
         t_fb2 : Float;
      begin
         accept s06;

         t_Sb2 := Sb2;
         t_fb2 := 0.1 * t_Sb2;
         fb2 := t_fb2;

         t35.s27;
      end Task27;
      task body Task28 is
         t_Sb3 : Float;
         t_fb3 : Float;
      begin
         accept s07;

         t_Sb3 := Sb3;
         t_fb3 := 0.1 * t_Sb3;
         fb3 := t_fb3;

         t35.s28;
      end Task28;
      task body Task29 is
         t_Sb4 : Float;
         t_fb4 : Float;
      begin
         accept s08;

         t_Sb4 := Sb4;
         t_fb4 := 0.1 * t_Sb4;
         fb4 := t_fb4;

         t35.s29;
      end Task29;
      task body Task30 is
         t_Sc1 : Float;
         t_fc1 : Float;
      begin
         accept s09;

         t_Sc1 := Sc1;
         t_fc1 := 0.1 * t_Sc1;
         fc1 := t_fc1;

         t36.s30;
      end Task30;
      task body Task31 is
         t_Sc2 : Float;
         t_fc2 : Float;
      begin
         accept s10;

         t_Sc2 := Sc2;
         t_fc2 := 0.1 * t_Sc2;
         fc2 := t_fc2;

         t36.s31;
      end Task31;
      task body Task32 is
         t_Sc3 : Float;
         t_fc3 : Float;
      begin
         accept s11;

         t_Sc3 := Sc3;
         t_fc3 := 0.1 * t_Sc3;
         fc3 := t_fc3;

         t36.s32;
      end Task32;
      task body Task33 is
         t_Sc4 : Float;
         t_fc4 : Float;
      begin
         accept s12;

         t_Sc4 := Sc4;
         t_fc4 := 0.1 * t_Sc4;
         fc4 := t_fc4;

         t36.s33;
      end Task33;

      --Req1.2
      task body Task34 is
         t_fa1 : Float;
         t_fa2 : Float;
         t_fa3 : Float;
         t_fa4 : Float;
         t_b1 : Boolean;
      begin
         accept s22; accept s23; accept s24; accept s25;

         t_fa1 := fa1;
         t_fa2 := fa2;
         t_fa3 := fa3;
         t_fa4 := fa4;
         t_b1 := (t_fa1+t_fa2+t_fa3+t_fa4) > 0.20;
         b1 := t_b1;

         t37.s34; t38.s34; t39.s34; t40.s34;
      end Task34;
      task body Task35 is
         t_fb1 : Float;
         t_fb2 : Float;
         t_fb3 : Float;
         t_fb4 : Float;
         t_b2 : Boolean;
      begin
         accept s26; accept s27; accept s28; accept s29;

         t_fb1 := fb1;
         t_fb2 := fb2;
         t_fb3 := fb3;
         t_fb4 := fb4;
         t_b2 := (t_fb1+t_fb2+t_fb3+t_fb4) > 0.21;
         b2 := t_b2;

         t41.s35; t42.s35; t43.s35; t44.s35;
      end Task35;
      task body Task36 is
         t_fc1 : Float;
         t_fc2 : Float;
         t_fc3 : Float;
         t_fc4 : Float;
         t_b3 : Boolean;
      begin
         accept s30; accept s31; accept s32; accept s33;

         t_fc1 := fc1;
         t_fc2 := fc2;
         t_fc3 := fc3;
         t_fc4 := fc4;
         t_b3 := (t_fc1+t_fc2+t_fc3+t_fc4) > 0.22;
         b3 := t_b3;

         t45.s36; t46.s36; t47.s36; t48.s36;
      end Task36;
      task body Task37 is
         t_fa1 : Float;
         t_fa2 : Float;
         t_fa3 : Float;
         t_fa4 : Float;
         t_b1 : Boolean;
         t_ssa1 : Float;
      begin
         accept s34;

         t_fa1 := fa1;
         t_fa2 := fa2;
         t_fa3 := fa3;
         t_fa4 := fa4;
         t_b1 := b1;
         if(not t_b1) then
            t_ssa1 := 0.0;
         end if;
         ssa1 := t_ssa1;
         t49.s37;
      end Task37;
      task body Task38 is
         t_fa1 : Float;
         t_fa2 : Float;
         t_fa3 : Float;
         t_fa4 : Float;
         t_b1 : Boolean;
         t_ssa2 : Float;
      begin
         accept s34;

         t_fa1 := fa1;
         t_fa2 := fa2;
         t_fa3 := fa3;
         t_fa4 := fa4;
         t_b1 := b1;
         if(not t_b1) then
            t_ssa2 := 0.0;
         end if;
         ssa2 := t_ssa2;

         t50.s38;
      end Task38;
      task body Task39 is
         t_fa1 : Float;
         t_fa2 : Float;
         t_fa3 : Float;
         t_fa4 : Float;
         t_b1 : Boolean;
         t_ssa1 : Float;
      begin
         accept s34;

         t_fa1 := fa1;
         t_fa2 := fa2;
         t_fa3 := fa3;
         t_fa4 := fa4;
         t_b1 := b1;
         if(b1) then
            t_ssa1 := (t_fa2+t_fa3-t_fa1-t_fa4) / (t_fa1+t_fa2+t_fa3+t_fa4);
         end if;
         ssa1 := t_ssa1;

         t49.s39;
      end Task39;
      task body Task40 is
         t_fa1 : Float;
         t_fa2 : Float;
         t_fa3 : Float;
         t_fa4 : Float;
         t_b1 : Boolean;
         t_ssa2 : Float;
      begin
         accept s34;

         t_fa1 := fa1;
         t_fa2 := fa2;
         t_fa3 := fa3;
         t_fa4 := fa4;
         t_b1 := b1;
         if(t_b1) then
            t_ssa2 := (t_fa3+t_fa4-t_fa1-t_fa2) / (t_fa1+t_fa2+t_fa3+t_fa4);
         end if;
         ssa2 := t_ssa2;

         t50.s40;
      end Task40; ---
      task body Task41 is
         t_fb1 : Float;
         t_fb2 : Float;
         t_fb3 : Float;
         t_fb4 : Float;
         t_b2 : Boolean;
         t_ssb1 : Float;
      begin
         accept s35;

         t_fb1 := fb1;
         t_fb2 := fb2;
         t_fb3 := fb3;
         t_fb4 := fb4;
         t_b2 := b2;
         if(not t_b2) then
            t_ssb1 := 0.0;
         end if;
         ssb1 := t_ssb1;

         t51.s41;
      end Task41;
      task body Task42 is
         t_fb1 : Float;
         t_fb2 : Float;
         t_fb3 : Float;
         t_fb4 : Float;
         t_b2 : Boolean;
         t_ssb2 : Float;
      begin
         accept s35;

         t_fb1 := fb1;
         t_fb2 := fb2;
         t_fb3 := fb3;
         t_fb4 := fb4;
         t_b2 := b2;
         if(not t_b2) then
            t_ssb2 := 0.0;
         end if;
         ssb2 := t_ssb2;
         t52.s42;
      end Task42;
      task body Task43 is
         t_fb1 : Float;
         t_fb2 : Float;
         t_fb3 : Float;
         t_fb4 : Float;
         t_b2 : Boolean;
         t_ssb1 : Float;
      begin
         accept s35;

         t_fb1 := fb1;
         t_fb2 := fb2;
         t_fb3 := fb3;
         t_fb4 := fb4;
         t_b2 := b2;
         if(t_b2) then
            t_ssb1 := (t_fb1+t_fb4-t_fb2-t_fb3) / (t_fb1+t_fb2+t_fb3+t_fb4);
         end if;
         ssb1 := t_ssb1;
         t51.s43;
      end Task43;
      task body Task44 is
         t_fb1 : Float;
         t_fb2 : Float;
         t_fb3 : Float;
         t_fb4 : Float;
         t_b2 : Boolean;
         t_ssb2 : Float;
      begin
         accept s35;
         t_fb1 := fb1;
         t_fb2 := fb2;
         t_fb3 := fb3;
         t_fb4 := fb4;
         t_b2 := b2;
         if(t_b2) then
            t_ssb2 := (t_fb3+t_fb4-t_fb1-t_fb2) / (t_fb1+t_fb2+t_fb3+t_fb4);
         end if;
         ssb2 := t_ssb2;

         t52.s44;
      end Task44;---
      task body Task45 is
         t_fc1 : Float;
         t_fc2 : Float;
         t_fc3 : Float;
         t_fc4 : Float;
         t_b3 : Boolean;
         t_ssc1 : Float;
      begin
         accept s36;

         t_fc1 := fc1;
         t_fc2 := fc2;
         t_fc3 := fc3;
         t_fc4 := fc4;
         t_b3 := b3;
         if(not t_b3) then
            t_ssc1 := 0.0;
         end if;
         ssc1 := t_ssc1;
         t53.s45;
      end Task45;
      task body Task46 is
         t_fc1 : Float;
         t_fc2 : Float;
         t_fc3 : Float;
         t_fc4 : Float;
         t_b3 : Boolean;
         t_ssc2 : Float;
      begin
         accept s36;

         t_fc1 := fc1;
         t_fc2 := fc2;
         t_fc3 := fc3;
         t_fc4 := fc4;
         t_b3 := b3;
         if(not t_b3) then
            t_ssc2 := 0.0;
         end if;
         ssc2 := t_ssc2;
         t54.s46;
      end Task46;
      task body Task47 is
         t_fc1 : Float;
         t_fc2 : Float;
         t_fc3 : Float;
         t_fc4 : Float;
         t_b3 : Boolean;
         t_ssc1 : Float;
      begin
         accept s36;

         t_fc1 := fc1;
         t_fc2 := fc2;
         t_fc3 := fc3;
         t_fc4 := fc4;
         t_b3 := b3;
         if(t_b3) then
            t_ssc1 := (t_fc1+t_fc4-t_fc2-t_fc3) / (t_fc1+t_fc2+t_fc3+t_fc4);
         end if;
         ssc1 := t_ssc1;
         t53.s47;
      end Task47;
      task body Task48 is
         t_fc1 : Float;
         t_fc2 : Float;
         t_fc3 : Float;
         t_fc4 : Float;
         t_b3 : Boolean;
         t_ssc2 : Float;
      begin
         accept s36;

         t_fc1 := fc1;
         t_fc2 := fc2;
         t_fc3 := fc3;
         t_fc4 := fc4;
         t_b3 := b3;
         if(t_b3) then
            t_ssc2 := (t_fc3+t_fc4-t_fc1-t_fc2) / (t_fc1+t_fc2+t_fc3+t_fc4);
         end if;
         ssc2 := t_ssc2;
         t54.s48;
      end Task48;

      --Req1.3
      task body Task49 is
         t_ssa1 : Float;
         t_ff_sa1 : Float;
      begin
         accept s37; accept s39;
         t_ssa1 := ssa1;
         t_ff_sa1 := t_ssa1 * 0.2;
         ff_sa1 := t_ff_sa1;

         t17.s49;
      end Task49;
      task body Task50 is
         t_ssa2 : Float;
         t_ff_sa2 : Float;
      begin
         accept s38; accept s40;
         t_ssa2 := ssa2;
         t_ff_sa2 := t_ssa2 * 0.2;
         ff_sa2 := t_ff_sa2;

         t18.s50;
      end Task50; ---
      task body Task51 is
         t_ssb1 : Float;
         t_ff_sb1 : Float;
      begin
         accept s41; accept s43;

         t_ssb1 := ssb1;
         t_ff_sb1 := t_ssb1 * 0.2;
         ff_sb1 := t_ff_sb1;

         t19.s51;
      end Task51;
      task body Task52 is
         t_ssb2 : Float;
         t_ff_sb2 : Float;
      begin
         accept s42; accept s44;

         t_ssb2 := ssb2;
         t_ff_sb2 := t_ssb2 * 0.2;
         ff_sb2 := t_ff_sb2;

         t19.s52;
      end Task52; ---
      task body Task53 is
         t_ssc1 : Float;
         t_ff_sc1 : Float;
      begin
         accept s45; accept s47;

         t_ssc1 := ssc1;
         t_ff_sc1 := t_ssc1 * 0.2;
         ff_sc1 := t_ff_sc1;

         t20.s53;
      end Task53;
      task body Task54 is
         t_ssc2 : Float;
         t_ff_sc2 : Float;
      begin
         accept s46; accept s48;

         t_ssc2 := ssc2;
         t_ff_sc2 := t_ssc2 * 0.2;
         ff_sc2 := t_ff_sc2;

         t20.s54;
      end Task54; ---

      --Req2.1
      task body Task59 is
         t_S_A1 : Float;
         t_ffa1 : Float;
      begin
         accept s13;

         t_S_A1 := S_A1;
         t_ffa1  := 0.3 * t_S_A1;
         ffa1 := t_ffa1;

         t63.s59;
      end Task59;
      task body Task60 is
         t_S_A2 : Float;
         t_ffa2 : Float;
      begin
         accept s14;

         t_S_A2 := S_A2;
         t_ffa2  := 0.3 * t_S_A2;
         ffa2 := t_ffa2;

         t63.s60;
      end Task60;
      task body Task61 is
         t_S_A3 : Float;
         t_ffa3 : Float;
      begin
         accept s15;

         t_S_A3 := S_A3;
         t_ffa3  := 0.3 * t_S_A3;
         ffa3 := t_ffa3;
         t63.s61;
      end Task61;
      task body Task62 is
         t_S_A4 : Float;
         t_ffa4 : Float;
      begin
         accept s16;

         t_S_A4 := S_A4;
         t_ffa4  := 0.3 * t_S_A4;
         ffa4 := t_ffa4;

         t63.s62;
      end Task62;

      --Req2.2
      task body Task63 is
         t_ffa1 : Float;
         t_ffa2 : Float;
         t_ffa3 : Float;
         t_ffa4 : Float;
         t_b4 : Boolean;
      begin
         accept s59; accept s60; accept s61; accept s62;

         t_ffa1 := ffa1;
         t_ffa2 := ffa2;
         t_ffa3 := ffa3;
         t_ffa4 := ffa4;
         t_b4 := (t_ffa1 + t_ffa2 + t_ffa3 + t_ffa4) > 0.34;
         b4 := t_b4;

         t64.s63; t65.s63;
      end Task63;
      task body Task64 is
         t_ffa1 : Float;
         t_ffa2 : Float;
         t_ffa3 : Float;
         t_ffa4 : Float;
         t_b4 : Boolean;
         t_fa5 : Float;
      begin
         accept s63;

         t_ffa1 := ffa1;
         t_ffa2 := ffa2;
         t_ffa3 := ffa3;
         t_ffa4 := ffa4;
         t_b4 := b4;

         if(t_b4) then
            t_fa5 := (t_ffa3+t_ffa4-t_ffa1-t_ffa2) / (t_ffa1+t_ffa2+t_ffa3+t_ffa4);
         end if;
         fa5 := t_fa5;

         t66.s64;
      end Task64;
      task body Task65 is
         t_ffa1 : Float;
         t_ffa2 : Float;
         t_ffa3 : Float;
         t_ffa4 : Float;
         t_b4 : Boolean;
         t_fa6 : Float;
      begin
         accept s63;

         t_ffa1 := ffa1;
         t_ffa2 := ffa2;
         t_ffa3 := ffa3;
         t_ffa4 := ffa4;
         t_b4 := b4;

         if(t_b4) then
            t_fa6 := (t_ffa1+t_ffa4-t_ffa2-t_ffa3) / (t_ffa1+t_ffa2+t_ffa3+t_ffa4);
         end if;
         fa6 := t_fa6;

         t67.s65;
      end Task65;
      task body Task66 is
         t_fa5 : Float;
         t_fa7 : Float;
      begin
         accept s64;

         t_fa5 := fa5;
         t_fa7 := t_fa5 * 0.25;
         fa7 := t_fa7;
         t68.s66;
      end Task66;
      task body Task67 is
         t_fa6 : Float;
         t_fa8 : Float;
      begin
         accept s65;

         t_fa6 := fa6;
         t_fa8 := t_fa6 * 0.25;
         fa8 := t_fa8;

         t68.s67;
      end Task67;
      task body Task68 is
         t_fa9 : Float;
      begin
         accept s66; accept s67;
         t_fa9 := fa9;
         t21.s68;
      end Task68;

      --output
      task body Task17 is
         t_ff_sa1 : Float;
      begin
         accept s49;
         t_ff_sa1 := ff_sa1;
      end Task17;
      task body Task18 is
        t_ff_sa2 : Float;
      begin
         accept s50;
         t_ff_sa2 := ff_sa2;
      end Task18;
      task body Task19 is
         t_vb : Float;
      begin
         accept s51; accept s52;
         t_vb := vb;
         vb := t_vb + 0.1;
      end Task19;
      task body Task20 is
         t_vc : Float;
      begin
         accept s53; accept s54;
         t_vc := vc;
         vc := t_vc + 0.2;
      end Task20;
      task body Task21 is
         t_fa7 : Float;
         t_fa8 : Float;
         t_fa9 : Float;
      begin
         accept s68;

         t_fa7 := fa7;
         t_fa8 := fa8;
         t_fa9 := t_fa7 + t_fa8;
         fa9 := t_fa9;
      end Task21;
      --next
   begin
      --init
      vb := 0.0;
      vc := 0.0;
      t01.Start; t02.Start; t03.Start; t04.Start;
      t05.Start; t06.Start; t07.Start; t08.Start;
      t09.Start; t10.Start; t11.Start; t12.Start;
      t13.Start; t14.Start; t15.Start; t16.Start;
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
