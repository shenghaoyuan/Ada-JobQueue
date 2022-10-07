--SEQ PAR
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Ada.Calendar.Formatting; use Ada.Calendar.Formatting;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with System.Multiprocessors; use System.Multiprocessors;

procedure Main is
   Start_Time : Ada.Calendar.Time;
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

      Sa1, Sa2, Sa3, Sa4, Sb1, Sb2, Sb3, Sb4, Sc1, Sc2, Sc3, Sc4, S_A1, S_A2, S_A3, S_A4 : Float;
      vb, vc, fa9 : Float;
      fa1, fa2, fa3, fa4, fb1, fb2, fb3, fb4, fc1, fc2, fc3, fc4 : Float;
      b1, b2, b3, b4 : Boolean;
      ssa1, ssa2, ssb1, ssb2, ssc1, ssc2 : Float;
      ff_sa1, ff_sa2, ff_sb1, ff_sb2, ff_sc1, ff_sc2 : Float;
      ffa1, ffa2, ffa3, ffa4, fa5, fa6, fa7, fa8 : Float;


      procedure P1 is
         t_Sa1 : Float;
         t_fa1 : Float;
      begin

         t_Sa1 := 0.1;
         Sa1 := t_Sa1;

         t_Sa1 := Sa1;
         t_fa1 := 0.1 * t_Sa1;
         fa1 := t_fa1;
      end;
      procedure P2 is
         t_Sa2 : Float;
         t_fa2 : Float;
      begin

         t_Sa2 := 0.2;
         Sa2 := t_Sa2;

         t_Sa2 := Sa2;
         t_fa2 := 0.1 * t_Sa2;
         fa2 := t_fa2;
      end;
      procedure P3 is
         t_Sa3 : Float;
         t_fa3 : Float;
      begin
         t_Sa3 := 0.3;
         Sa3 := t_Sa3;

         t_Sa3 := Sa3;
         t_fa3 := 0.1 * t_Sa3;
         fa3 := t_fa3;
      end;
      procedure P4 is
         t_Sa4 : Float;
         t_fa4 : Float;
      begin
         t_Sa4 := 0.4;
         Sa4 := t_Sa4;

         t_Sa4 := Sa4;
         t_fa4 := 0.1 * t_Sa4;
         fa4 := t_fa4;
      end;
      procedure P5 is
         t_Sb1 : Float;
         t_fb1 : Float;
      begin
         t_Sb1 := 0.5;
         Sb1 := t_Sb1;

         t_Sb1 := Sb1;
         t_fb1 := 0.1 * t_Sb1;
         fb1 := t_fb1;
      end;
      procedure P6 is
         t_Sb2 : Float;
         t_fb2 : Float;
      begin
         t_Sb2 := 0.6;
         Sb2 := t_Sb2;

         t_Sb2 := Sb2;
         t_fb2 := 0.1 * t_Sb2;
         fb2 := t_fb2;
      end;
      procedure P7 is
         t_Sb3 : Float;
         t_fb3 : Float;
      begin
         t_Sb3 := 0.7;
         Sb3 := t_Sb3;

         t_Sb3 := Sb3;
         t_fb3 := 0.1 * t_Sb3;
         fb3 := t_fb3;
      end;
      procedure P8 is
         t_Sb4 : Float;
         t_fb4 : Float;
      begin
         t_Sb4 := 0.8;
         Sb4 := t_Sb4;

         t_Sb4 := Sb4;
         t_fb4 := 0.1 * t_Sb4;
         fb4 := t_fb4;
      end;
      procedure P9 is
         t_Sc1 : Float;
         t_fc1 : Float;
      begin
         t_Sc1 := 0.9;
         Sc1 := t_Sc1;

         t_Sc1 := Sc1;
         t_fc1 := 0.1 * t_Sc1;
         fc1 := t_fc1;
      end;
      procedure P10 is
         t_Sc2 : Float;
         t_fc2 : Float;
      begin
         t_Sc2 := 1.0;
         Sc2 := t_Sc2;

         t_Sc2 := Sc2;
         t_fc2 := 0.1 * t_Sc2;
         fc2 := t_fc2;
      end;
      procedure P11 is
         t_Sc3 : Float;
         t_fc3 : Float;
      begin
         t_Sc3 := 1.1;
         Sc3 := t_Sc3;

         t_Sc3 := Sc3;
         t_fc3 := 0.1 * t_Sc3;
         fc3 := t_fc3;
      end;
      procedure P12 is
         t_Sc4 : Float;
         t_fc4 : Float;
      begin
         t_Sc4 := 1.2;
         Sc4 := t_Sc4;

         t_Sc4 := Sc4;
         t_fc4 := 0.1 * t_Sc4;
         fc4 := t_fc4;
      end;
      procedure P13 is
         t_S_A1 : Float;
         t_ffa1 : Float;
      begin
         t_S_A1 := 1.3;
         S_A1 := t_S_A1;

         t_S_A1 := S_A1;
         t_ffa1  := 0.3 * t_S_A1;
         ffa1 := t_ffa1;
      end;
      procedure P14 is
         t_S_A2 : Float;
         t_ffa2 : Float;
      begin
         t_S_A2 := 1.4;
         S_A2 := t_S_A2;

         t_S_A2 := S_A2;
         t_ffa2  := 0.3 * t_S_A2;
         ffa2 := t_ffa2;
      end;
      procedure P15 is
         t_S_A3 : Float;
         t_ffa3 : Float;
      begin
         t_S_A3 := 1.5;
         S_A3 := t_S_A3;

         t_S_A3 := S_A3;
         t_ffa3  := 0.3 * t_S_A3;
         ffa3 := t_ffa3;
      end;
      procedure P16 is
         t_S_A4 : Float;
         t_ffa4 : Float;
      begin
         t_S_A4 := 1.6;
         S_A4 := t_S_A4;

         t_S_A4 := S_A4;
         t_ffa4  := 0.3 * t_S_A4;
         ffa4 := t_ffa4;
      end;

      procedure P34 is
         t_fa1 : Float;
         t_fa2 : Float;
         t_fa3 : Float;
         t_fa4 : Float;
         t_b1 : Boolean;
      begin
         t_fa1 := fa1;
         t_fa2 := fa2;
         t_fa3 := fa3;
         t_fa4 := fa4;
         t_b1 := (t_fa1+t_fa2+t_fa3+t_fa4) > 0.20;
         b1 := t_b1;
      end;
      procedure P35 is
         t_fb1 : Float;
         t_fb2 : Float;
         t_fb3 : Float;
         t_fb4 : Float;
         t_b2 : Boolean;
      begin
         t_fb1 := fb1;
         t_fb2 := fb2;
         t_fb3 := fb3;
         t_fb4 := fb4;
         t_b2 := (t_fb1+t_fb2+t_fb3+t_fb4) > 0.21;
         b2 := t_b2;
      end;
      procedure P36 is
         t_fc1 : Float;
         t_fc2 : Float;
         t_fc3 : Float;
         t_fc4 : Float;
         t_b3 : Boolean;
      begin
         t_fc1 := fc1;
         t_fc2 := fc2;
         t_fc3 := fc3;
         t_fc4 := fc4;
         t_b3 := (t_fc1+t_fc2+t_fc3+t_fc4) > 0.22;
         b3 := t_b3;
      end;
      procedure P37 is
         t_fa1 : Float;
         t_fa2 : Float;
         t_fa3 : Float;
         t_fa4 : Float;
         t_b1 : Boolean;
         t_ssa1 : Float;
      begin
         t_fa1 := fa1;
         t_fa2 := fa2;
         t_fa3 := fa3;
         t_fa4 := fa4;
         t_b1 := b1;
         if(not t_b1) then
            t_ssa1 := 0.0;
         end if;
         ssa1 := t_ssa1;
      end;
      procedure P38 is
         t_fa1 : Float;
         t_fa2 : Float;
         t_fa3 : Float;
         t_fa4 : Float;
         t_b1 : Boolean;
         t_ssa2 : Float;
      begin
         t_fa1 := fa1;
         t_fa2 := fa2;
         t_fa3 := fa3;
         t_fa4 := fa4;
         t_b1 := b1;
         if(not t_b1) then
            t_ssa2 := 0.0;
         end if;
         ssa2 := t_ssa2;
      end;
      procedure P39 is
         t_fa1 : Float;
         t_fa2 : Float;
         t_fa3 : Float;
         t_fa4 : Float;
         t_b1 : Boolean;
         t_ssa1 : Float;
      begin
         t_fa1 := fa1;
         t_fa2 := fa2;
         t_fa3 := fa3;
         t_fa4 := fa4;
         t_b1 := b1;
         if(b1) then
            t_ssa1 := (t_fa2+t_fa3-t_fa1-t_fa4) / (t_fa1+t_fa2+t_fa3+t_fa4);
         end if;
         ssa1 := t_ssa1;
      end;
      procedure P40 is
         t_fa1 : Float;
         t_fa2 : Float;
         t_fa3 : Float;
         t_fa4 : Float;
         t_b1 : Boolean;
         t_ssa2 : Float;
      begin
         t_fa1 := fa1;
         t_fa2 := fa2;
         t_fa3 := fa3;
         t_fa4 := fa4;
         t_b1 := b1;
         if(t_b1) then
            t_ssa2 := (t_fa3+t_fa4-t_fa1-t_fa2) / (t_fa1+t_fa2+t_fa3+t_fa4);
         end if;
         ssa2 := t_ssa2;
      end;
      procedure P41 is
         t_fb1 : Float;
         t_fb2 : Float;
         t_fb3 : Float;
         t_fb4 : Float;
         t_b2 : Boolean;
         t_ssb1 : Float;
      begin
         t_fb1 := fb1;
         t_fb2 := fb2;
         t_fb3 := fb3;
         t_fb4 := fb4;
         t_b2 := b2;
         if(not t_b2) then
            t_ssb1 := 0.0;
         end if;
         ssb1 := t_ssb1;
      end;
      procedure P42 is
         t_fb1 : Float;
         t_fb2 : Float;
         t_fb3 : Float;
         t_fb4 : Float;
         t_b2 : Boolean;
         t_ssb2 : Float;
      begin
         t_fb1 := fb1;
         t_fb2 := fb2;
         t_fb3 := fb3;
         t_fb4 := fb4;
         t_b2 := b2;
         if(not t_b2) then
            t_ssb2 := 0.0;
         end if;
         ssb2 := t_ssb2;
      end;
      procedure P43 is
         t_fb1 : Float;
         t_fb2 : Float;
         t_fb3 : Float;
         t_fb4 : Float;
         t_b2 : Boolean;
         t_ssb1 : Float;
      begin
         t_fb1 := fb1;
         t_fb2 := fb2;
         t_fb3 := fb3;
         t_fb4 := fb4;
         t_b2 := b2;
         if(t_b2) then
            t_ssb1 := (t_fb1+t_fb4-t_fb2-t_fb3) / (t_fb1+t_fb2+t_fb3+t_fb4);
         end if;
         ssb1 := t_ssb1;
      end;
      procedure P44 is
         t_fb1 : Float;
         t_fb2 : Float;
         t_fb3 : Float;
         t_fb4 : Float;
         t_b2 : Boolean;
         t_ssb2 : Float;
      begin
         t_fb1 := fb1;
         t_fb2 := fb2;
         t_fb3 := fb3;
         t_fb4 := fb4;
         t_b2 := b2;
         if(t_b2) then
            t_ssb2 := (t_fb3+t_fb4-t_fb1-t_fb2) / (t_fb1+t_fb2+t_fb3+t_fb4);
         end if;
         ssb2 := t_ssb2;
      end;
      procedure P45 is
         t_fc1 : Float;
         t_fc2 : Float;
         t_fc3 : Float;
         t_fc4 : Float;
         t_b3 : Boolean;
         t_ssc1 : Float;
      begin
         t_fc1 := fc1;
         t_fc2 := fc2;
         t_fc3 := fc3;
         t_fc4 := fc4;
         t_b3 := b3;
         if(not t_b3) then
            t_ssc1 := 0.0;
         end if;
         ssc1 := t_ssc1;
      end;
      procedure P46 is
         t_fc1 : Float;
         t_fc2 : Float;
         t_fc3 : Float;
         t_fc4 : Float;
         t_b3 : Boolean;
         t_ssc2 : Float;
      begin
         t_fc1 := fc1;
         t_fc2 := fc2;
         t_fc3 := fc3;
         t_fc4 := fc4;
         t_b3 := b3;
         if(not t_b3) then
            t_ssc2 := 0.0;
         end if;
         ssc2 := t_ssc2;
      end;
      procedure P47 is
         t_fc1 : Float;
         t_fc2 : Float;
         t_fc3 : Float;
         t_fc4 : Float;
         t_b3 : Boolean;
         t_ssc1 : Float;
      begin
         t_fc1 := fc1;
         t_fc2 := fc2;
         t_fc3 := fc3;
         t_fc4 := fc4;
         t_b3 := b3;
         if(t_b3) then
            t_ssc1 := (t_fc1+t_fc4-t_fc2-t_fc3) / (t_fc1+t_fc2+t_fc3+t_fc4);
         end if;
         ssc1 := t_ssc1;
      end;

      procedure P48 is
         t_fc1 : Float;
         t_fc2 : Float;
         t_fc3 : Float;
         t_fc4 : Float;
         t_b3 : Boolean;
         t_ssc2 : Float;
      begin
         t_fc1 := fc1;
         t_fc2 := fc2;
         t_fc3 := fc3;
         t_fc4 := fc4;
         t_b3 := b3;
         if(t_b3) then
            t_ssc2 := (t_fc3+t_fc4-t_fc1-t_fc2) / (t_fc1+t_fc2+t_fc3+t_fc4);
         end if;
         ssc2 := t_ssc2;
      end;

      procedure P49 is
         t_ssa1 : Float;
         t_ff_sa1 : Float;
      begin
         t_ssa1 := ssa1;
         t_ff_sa1 := t_ssa1 * 0.2;
         ff_sa1 := t_ff_sa1;
      end;
      procedure P50 is
         t_ssa2 : Float;
         t_ff_sa2 : Float;
      begin
         t_ssa2 := ssa2;
         t_ff_sa2 := t_ssa2 * 0.2;
         ff_sa2 := t_ff_sa2;
      end;
      procedure P51 is
         t_ssb1 : Float;
         t_ff_sb1 : Float;
      begin
         t_ssb1 := ssb1;
         t_ff_sb1 := t_ssb1 * 0.2;
         ff_sb1 := t_ff_sb1;
      end;
      procedure P52 is
         t_ssb2 : Float;
         t_ff_sb2 : Float;
      begin
         t_ssb2 := ssb2;
         t_ff_sb2 := t_ssb2 * 0.2;
         ff_sb2 := t_ff_sb2;
      end;
      procedure P53 is
         t_ssc1 : Float;
         t_ff_sc1 : Float;
      begin
         t_ssc1 := ssc1;
         t_ff_sc1 := t_ssc1 * 0.2;
         ff_sc1 := t_ff_sc1;
      end;
      procedure P54 is
         t_ssc2 : Float;
         t_ff_sc2 : Float;
      begin
         t_ssc2 := ssc2;
         t_ff_sc2 := t_ssc2 * 0.2;
         ff_sc2 := t_ff_sc2;
      end;
      procedure P55 is
         t_vb : Float;
      begin
         t_vb := vb;
         vb := t_vb + 0.1;
      end;
      procedure P57 is
         t_vc : Float;
      begin
         t_vc := vc;
         vc := t_vc + 0.2;
      end;

      procedure P63 is
         t_ffa1 : Float;
         t_ffa2 : Float;
         t_ffa3 : Float;
         t_ffa4 : Float;
         t_b4 : Boolean;
      begin
         t_ffa1 := ffa1;
         t_ffa2 := ffa2;
         t_ffa3 := ffa3;
         t_ffa4 := ffa4;
         t_b4 := (t_ffa1 + t_ffa2 + t_ffa3 + t_ffa4) > 0.34;
         b4 := t_b4;
      end;
      procedure P64 is
         t_ffa1 : Float;
         t_ffa2 : Float;
         t_ffa3 : Float;
         t_ffa4 : Float;
         t_b4 : Boolean;
         t_fa5 : Float;
         t_fa7 : Float;
      begin
         t_ffa1 := ffa1;
         t_ffa2 := ffa2;
         t_ffa3 := ffa3;
         t_ffa4 := ffa4;
         t_b4 := b4;

         if(t_b4) then
            t_fa5 := (t_ffa3+t_ffa4-t_ffa1-t_ffa2) / (t_ffa1+t_ffa2+t_ffa3+t_ffa4);
         end if;
         fa5 := t_fa5;

         t_fa7 := t_fa5 * 0.25;
         fa7 := t_fa7;
      end;
      procedure P65 is
         t_ffa1 : Float;
         t_ffa2 : Float;
         t_ffa3 : Float;
         t_ffa4 : Float;
         t_b4 : Boolean;
         t_fa6 : Float;
         t_fa8 : Float;
      begin
         t_ffa1 := ffa1;
         t_ffa2 := ffa2;
         t_ffa3 := ffa3;
         t_ffa4 := ffa4;
         t_b4 := b4;

         if(t_b4) then
            t_fa6 := (t_ffa1+t_ffa4-t_ffa2-t_ffa3) / (t_ffa1+t_ffa2+t_ffa3+t_ffa4);
         end if;
         fa6 := t_fa6;

         t_fa8 := t_fa6 * 0.25;
         fa8 := t_fa8;
      end;
      procedure P68 is
         t_fa7 : Float;
         t_fa8 : Float;
         t_fa9 : Float;
      begin
         t_fa7 := fa7;
         t_fa8 := fa8;
         t_fa9 := t_fa7 + t_fa8;
         fa9 := t_fa9;
      end;

      procedure T122 is
      begin
         declare
            package I_P38 is New PT(P38);
            package I_P40 is new PT(P40);
         begin null;
         end;
         P50;
      end;

      procedure T121 is
      begin
         declare
            package I_P37 is New PT(P37);
            package I_P39 is new PT(P39);
         begin null;
         end;
         P49;
      end;

      procedure T1 is
      begin
         --T1.1
         declare
            package I_P1 is New PT(P1);
            package I_P2 is New PT(P2);
            package I_P3 is New PT(P3);
            package I_P4 is New PT(P4);
         begin null;
         end;
         P34;
         --T1.2
         declare
            package I_T121 is New PT(T121);
            package I_T122 is New PT(T122);
         begin null;
         end;
      end;
      --T1--
      procedure T222 is
      begin
         declare
            package I_P42 is New PT(P42);
            package I_P44 is new PT(P44);
         begin null;
         end;
         P52;
      end;

      procedure T221 is
      begin
         declare
            package I_P41 is New PT(P41);
            package I_P43 is new PT(P43);
         begin null;
         end;
         P51;
      end;

      procedure T2 is
      begin
         --T2.1
         declare
            package I_P5 is New PT(P5);
            package I_P6 is New PT(P6);
            package I_P7 is New PT(P7);
            package I_P8 is New PT(P8);
         begin null;
         end;
         P35;
         --T2.2
         declare
            package I_T221 is New PT(T221);
            package I_T222 is New PT(T222);
         begin null;
         end;
         P55;
      end;
      --T2--

      procedure T322 is
      begin
         declare
            package I_P46 is New PT(P46);
            package I_P48 is new PT(P48);
         begin null;
         end;
         P54;
      end;

      procedure T321 is
      begin
         declare
            package I_P45 is New PT(P45);
            package I_P47 is new PT(P47);
         begin null;
         end;
         P53;
      end;

      procedure T3 is
      begin
         --T3.1
         declare
            package I_P9 is New PT(P9);
            package I_P10 is New PT(P10);
            package I_P11 is New PT(P11);
            package I_P12 is New PT(P12);
         begin null;
         end;
         P36;
         --T3.2
         declare
            package I_T321 is New PT(T321);
            package I_T322 is New PT(T322);
         begin null;
         end;
         P57;
      end;
      --T3--

      procedure T4 is
      begin
         --T4.1
         declare
            package I_P13 is New PT(P13);
            package I_P14 is New PT(P14);
            package I_P15 is New PT(P15);
            package I_P16 is New PT(P16);
         begin null;
         end;
         P63;
         --T4.2
         declare
            package I_P64 is New PT(P64);
            package I_P65 is New PT(P65);
         begin null;
         end;
         P68;
      end;
      --T4--

   begin
      declare
         package I_T1 is New PT(T1);
         package I_T2 is New PT(T2);
         package I_T3 is New PT(T3);
         package I_T4 is New PT(T4);
      begin null;
      end;
   end Sp;
begin
   Start_Time := Ada.Calendar.Clock;
   while (Number /= 0) loop
      Sp;
      Number := Number - 1;
   end loop;
   Ada.Text_IO.Put_Line(Duration'Image(Ada.Calendar.Clock - Start_Time));
end Main;
