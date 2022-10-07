with Text_Io;
--DistributedQueue
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Ada.Calendar.Formatting; use Ada.Calendar.Formatting;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with System.Multiprocessors; use System.Multiprocessors;

with WorkerThreads;
with StandardWstTaskExecutor;
with LockFreeCounter;
with GNAT.OS_Lib;
with System.Atomic_Primitives; use System.Atomic_Primitives;

procedure Main is
   Start_Time : Ada.Calendar.Time;
   Number : Integer := 10;

   Sa1, Sa2, Sa3, Sa4, Sb1, Sb2, Sb3, Sb4, Sc1, Sc2, Sc3, Sc4, S_A1, S_A2, S_A3, S_A4 : Float;
   vb, vc, fa9 : Float;
   fa1, fa2, fa3, fa4, fb1, fb2, fb3, fb4, fc1, fc2, fc3, fc4 : Float;
   b1, b2, b3, b4 : Boolean;
   ssa1, ssa2, ssb1, ssb2, ssc1, ssc2 : Float;
   ff_sa1, ff_sa2, ff_sb1, ff_sb2, ff_sc1, ff_sc2 : Float;
   ffa1, ffa2, ffa3, ffa4, fa5, fa6, fa7, fa8 : Float;

   type TID is new Integer range 1..4; -- 4 workers

   type action is access procedure (Id: TID);

   procedure Run(A: Action; Id: TID) is
   begin
      A.all(Id);
   end Run;

   package Workers is new StandardWstTaskExecutor(TID, Action, null, Run);

   c_small_step_34 : LockFreeCounter.counter(4);
   c_small_step_35 : LockFreeCounter.counter(4);
   c_small_step_36 : LockFreeCounter.counter(4);
   c_small_step_55 : LockFreeCounter.counter(2);
   c_small_step_57 : LockFreeCounter.counter(2);
   c_small_step_63 : LockFreeCounter.counter(4);
   c_small_step_68 : LockFreeCounter.counter(2);
   c_small_step_time : LockFreeCounter.counter(5);

   procedure small_step_01(Id: TID);
   procedure small_step_02(Id: TID);
   procedure small_step_03(Id: TID);
   procedure small_step_04(Id: TID);
   procedure small_step_05(Id: TID);
   procedure small_step_06(Id: TID);
   procedure small_step_07(Id: TID);
   procedure small_step_08(Id: TID);
   procedure small_step_09(Id: TID);
   procedure small_step_10(Id: TID);
   procedure small_step_11(Id: TID);
   procedure small_step_12(Id: TID);
   procedure small_step_13(Id: TID);
   procedure small_step_14(Id: TID);
   procedure small_step_15(Id: TID);
   procedure small_step_16(Id: TID);

   procedure small_step_34(Id: TID);
   procedure small_step_35(Id: TID);
   procedure small_step_36(Id: TID);

   procedure small_step_37(Id: TID);
   procedure small_step_38(Id: TID);

   procedure small_step_41(Id: TID);
   procedure small_step_42(Id: TID);

   procedure small_step_45(Id: TID);
   procedure small_step_46(Id: TID);

   procedure small_step_55(Id: TID);
   procedure small_step_57(Id: TID);

   procedure small_step_63(Id: TID);
   procedure small_step_64(Id: TID);
   procedure small_step_65(Id: TID);

   procedure small_step_68(Id: TID);
   procedure small_step_time(Id: TID);
   procedure start_step(Id: TID);

   procedure small_step_01(Id: TID) is
      t_Sa1 : Float;
      t_fa1 : Float;
   begin

      t_Sa1 := 0.1;
      Sa1 := t_Sa1;

      t_Sa1 := Sa1;
      t_fa1 := 0.1 * t_Sa1;
      fa1 := t_fa1;
      Workers.submit(small_step_34'access, id);
   end small_step_01;

   procedure small_step_02(Id: TID) is
      t_Sa2 : Float;
      t_fa2 : Float;
   begin

      t_Sa2 := 0.2;
      Sa2 := t_Sa2;

      t_Sa2 := Sa2;
      t_fa2 := 0.1 * t_Sa2;
      fa2 := t_fa2;
      Workers.submit(small_step_34'access, id);
   end small_step_02;

   procedure small_step_03(Id: TID) is
      t_Sa3 : Float;
      t_fa3 : Float;
   begin
      t_Sa3 := 0.3;
      Sa3 := t_Sa3;

      t_Sa3 := Sa3;
      t_fa3 := 0.1 * t_Sa3;
      fa3 := t_fa3;
      Workers.submit(small_step_34'access, id);
   end small_step_03;

   procedure small_step_04(Id: TID) is
      t_Sa4 : Float;
      t_fa4 : Float;
   begin
      t_Sa4 := 0.4;
      Sa4 := t_Sa4;

      t_Sa4 := Sa4;
      t_fa4 := 0.1 * t_Sa4;
      fa4 := t_fa4;
      Workers.submit(small_step_34'access, id);
   end small_step_04;

   procedure small_step_05(Id: TID) is
      t_Sb1 : Float;
      t_fb1 : Float;
   begin
      t_Sb1 := 0.5;
      Sb1 := t_Sb1;

      t_Sb1 := Sb1;
      t_fb1 := 0.1 * t_Sb1;
      fb1 := t_fb1;
      Workers.submit(small_step_35'access, id);
   end small_step_05;

   procedure small_step_06(Id: TID) is
      t_Sb2 : Float;
      t_fb2 : Float;
   begin
      t_Sb2 := 0.6;
      Sb2 := t_Sb2;

      t_Sb2 := Sb2;
      t_fb2 := 0.1 * t_Sb2;
      fb2 := t_fb2;
      Workers.submit(small_step_35'access, id);
   end small_step_06;

   procedure small_step_07(Id: TID) is
      t_Sb3 : Float;
      t_fb3 : Float;
   begin
      t_Sb3 := 0.7;
      Sb3 := t_Sb3;

      t_Sb3 := Sb3;
      t_fb3 := 0.1 * t_Sb3;
      fb3 := t_fb3;
      Workers.submit(small_step_35'access, id);
   end small_step_07;

   procedure small_step_08(Id: TID) is
      t_Sb4 : Float;
      t_fb4 : Float;
   begin
      t_Sb4 := 0.8;
      Sb4 := t_Sb4;

      t_Sb4 := Sb4;
      t_fb4 := 0.1 * t_Sb4;
      fb4 := t_fb4;
      Workers.submit(small_step_35'access, id);
   end small_step_08;

   procedure small_step_09(Id: TID) is
      t_Sc1 : Float;
      t_fc1 : Float;
   begin
      t_Sc1 := 0.9;
      Sc1 := t_Sc1;

      t_Sc1 := Sc1;
      t_fc1 := 0.1 * t_Sc1;
      fc1 := t_fc1;
      Workers.submit(small_step_36'access, id);
   end small_step_09;

   procedure small_step_10(Id: TID) is
      t_Sc2 : Float;
      t_fc2 : Float;
   begin
      t_Sc2 := 1.0;
      Sc2 := t_Sc2;

      t_Sc2 := Sc2;
      t_fc2 := 0.1 * t_Sc2;
      fc2 := t_fc2;
      Workers.submit(small_step_36'access, id);
   end small_step_10;

   procedure small_step_11(Id: TID) is
      t_Sc3 : Float;
      t_fc3 : Float;
   begin
      t_Sc3 := 1.1;
      Sc3 := t_Sc3;

      t_Sc3 := Sc3;
      t_fc3 := 0.1 * t_Sc3;
      fc3 := t_fc3;
      Workers.submit(small_step_36'access, id);
   end small_step_11;

   procedure small_step_12(Id: TID) is
      t_Sc4 : Float;
      t_fc4 : Float;
   begin
      t_Sc4 := 1.2;
      Sc4 := t_Sc4;

      t_Sc4 := Sc4;
      t_fc4 := 0.1 * t_Sc4;
      fc4 := t_fc4;
      Workers.submit(small_step_36'access, id);
   end small_step_12;

   procedure small_step_13(Id: TID) is
      t_S_A1 : Float;
      t_ffa1 : Float;
   begin
      t_S_A1 := 1.3;
      S_A1 := t_S_A1;

      t_S_A1 := S_A1;
      t_ffa1  := 0.3 * t_S_A1;
      ffa1 := t_ffa1;
      Workers.submit(small_step_63'access, id);
   end small_step_13;

   procedure small_step_14(Id: TID) is
      t_S_A2 : Float;
      t_ffa2 : Float;
   begin
      t_S_A2 := 1.4;
      S_A2 := t_S_A2;

      t_S_A2 := S_A2;
      t_ffa2  := 0.3 * t_S_A2;
      ffa2 := t_ffa2;
      Workers.submit(small_step_63'access, id);
   end small_step_14;

   procedure small_step_15(Id: TID) is
      t_S_A3 : Float;
      t_ffa3 : Float;
   begin
      t_S_A3 := 1.5;
      S_A3 := t_S_A3;

      t_S_A3 := S_A3;
      t_ffa3  := 0.3 * t_S_A3;
      ffa3 := t_ffa3;
      Workers.submit(small_step_63'access, id);
   end small_step_15;

   procedure small_step_16(Id: TID) is
      t_S_A4 : Float;
      t_ffa4 : Float;
   begin
      t_S_A4 := 1.6;
      S_A4 := t_S_A4;

      t_S_A4 := S_A4;
      t_ffa4  := 0.3 * t_S_A4;
      ffa4 := t_ffa4;
      Workers.submit(small_step_63'access, id);
   end small_step_16;

   --Req1.2
   procedure small_step_34(Id: TID) is
      cpt : uint32;
      t_fa1 : Float;
      t_fa2 : Float;
      t_fa3 : Float;
      t_fa4 : Float;
      t_b1 : Boolean;
   begin
      c_small_step_34.decr(cpt);
      if (cpt > 0) then return; end if;
      t_fa1 := fa1;
      t_fa2 := fa2;
      t_fa3 := fa3;
      t_fa4 := fa4;
      t_b1 := (t_fa1+t_fa2+t_fa3+t_fa4) > 0.20;
      b1 := t_b1;
      Workers.submit(small_step_37'access, id);
      Workers.submit(small_step_38'access, id);
   end small_step_34;

   procedure small_step_35(Id: TID) is
      cpt : uint32;
      t_fb1 : Float;
      t_fb2 : Float;
      t_fb3 : Float;
      t_fb4 : Float;
      t_b2 : Boolean;
   begin
      c_small_step_35.decr(cpt);
      if (cpt > 0) then return; end if;
      t_fb1 := fb1;
      t_fb2 := fb2;
      t_fb3 := fb3;
      t_fb4 := fb4;
      t_b2 := (t_fb1+t_fb2+t_fb3+t_fb4) > 0.21;
      b2 := t_b2;
      Workers.submit(small_step_41'access, id);
      Workers.submit(small_step_42'access, id);
   end small_step_35;

   procedure small_step_36(Id: TID) is
      cpt : uint32;
      t_fc1 : Float;
      t_fc2 : Float;
      t_fc3 : Float;
      t_fc4 : Float;
      t_b3 : Boolean;
   begin
      c_small_step_36.decr(cpt);
      if (cpt > 0) then return; end if;
      t_fc1 := fc1;
      t_fc2 := fc2;
      t_fc3 := fc3;
      t_fc4 := fc4;
      t_b3 := (t_fc1+t_fc2+t_fc3+t_fc4) > 0.22;
      b3 := t_b3;
      Workers.submit(small_step_45'access, id);
      Workers.submit(small_step_46'access, id);
   end small_step_36;

   procedure small_step_37(Id: TID) is
      t_fa1 : Float;
      t_fa2 : Float;
      t_fa3 : Float;
      t_fa4 : Float;
      t_b1 : Boolean;
      t_ssa1 : Float;
      t_ff_sa1 : Float;
   begin
      t_fa1 := fa1;
      t_fa2 := fa2;
      t_fa3 := fa3;
      t_fa4 := fa4;
      t_b1 := b1;
      if(t_b1) then
         t_ssa1 := (t_fa2+t_fa3-t_fa1-t_fa4) / (t_fa1+t_fa2+t_fa3+t_fa4);
      elsif(not t_b1) then
         t_ssa1 := 0.0;
      end if;
      ssa1 := t_ssa1;

      t_ssa1 := ssa1;
      t_ff_sa1 := t_ssa1 * 0.2;
      ff_sa1 := t_ff_sa1;

      t_ff_sa1 := ff_sa1;
      Workers.submit(small_step_time'access, id);
   end small_step_37;

   procedure small_step_38(Id: TID) is
      t_fa1 : Float;
      t_fa2 : Float;
      t_fa3 : Float;
      t_fa4 : Float;
      t_b1 : Boolean;
      t_ssa2 : Float;
      t_ff_sa2 : Float;
   begin
      t_fa1 := fa1;
      t_fa2 := fa2;
      t_fa3 := fa3;
      t_fa4 := fa4;
      t_b1 := b1;
      if(t_b1) then
         t_ssa2 := (t_fa3+t_fa4-t_fa1-t_fa2) / (t_fa1+t_fa2+t_fa3+t_fa4);
      elsif(not t_b1) then
         t_ssa2 := 0.0;
      end if;
      ssa2 := t_ssa2;

      t_ssa2 := ssa2;
      t_ff_sa2 := t_ssa2 * 0.2;
      ff_sa2 := t_ff_sa2;

      t_ff_sa2 := ff_sa2;
      Workers.submit(small_step_time'access, id);
   end small_step_38;

   procedure small_step_41(Id: TID) is
      t_fb1 : Float;
      t_fb2 : Float;
      t_fb3 : Float;
      t_fb4 : Float;
      t_b2 : Boolean;
      t_ssb1 : Float;
      t_ff_sb1 : Float;
   begin
      t_fb1 := fb1;
      t_fb2 := fb2;
      t_fb3 := fb3;
      t_fb4 := fb4;
      t_b2 := b2;
      if(t_b2) then
         t_ssb1 := (t_fb1+t_fb4-t_fb2-t_fb3) / (t_fb1+t_fb2+t_fb3+t_fb4);
      elsif(not t_b2) then
         t_ssb1 := 0.0;
      end if;
      ssb1 := t_ssb1;

      t_ssb1 := ssb1;
      t_ff_sb1 := t_ssb1 * 0.2;
      ff_sb1 := t_ff_sb1;
      Workers.submit(small_step_55'access, id);
   end small_step_41;

   procedure small_step_42(Id: TID) is
      t_fb1 : Float;
      t_fb2 : Float;
      t_fb3 : Float;
      t_fb4 : Float;
      t_b2 : Boolean;
      t_ssb2 : Float;
      t_ff_sb2 : Float;
   begin
      t_fb1 := fb1;
      t_fb2 := fb2;
      t_fb3 := fb3;
      t_fb4 := fb4;
      t_b2 := b2;
      if(t_b2) then
         t_ssb2 := (t_fb3+t_fb4-t_fb1-t_fb2) / (t_fb1+t_fb2+t_fb3+t_fb4);
      elsif(not t_b2) then
         t_ssb2 := 0.0;
      end if;
      ssb2 := t_ssb2;

      t_ssb2 := ssb2;
      t_ff_sb2 := t_ssb2 * 0.2;
      ff_sb2 := t_ff_sb2;
      Workers.submit(small_step_55'access, id);
   end small_step_42;

   procedure small_step_45(Id: TID) is
      t_fc1 : Float;
      t_fc2 : Float;
      t_fc3 : Float;
      t_fc4 : Float;
      t_b3 : Boolean;
      t_ssc1 : Float;
      t_ff_sc1 : Float;
   begin
      t_fc1 := fc1;
      t_fc2 := fc2;
      t_fc3 := fc3;
      t_fc4 := fc4;
      t_b3 := b3;
      if(t_b3) then
         t_ssc1 := (t_fc1+t_fc4-t_fc2-t_fc3) / (t_fc1+t_fc2+t_fc3+t_fc4);
      elsif(not t_b3) then
         t_ssc1 := 0.0;
      end if;
      ssc1 := t_ssc1;

      t_ssc1 := ssc1;
      t_ff_sc1 := t_ssc1 * 0.2;
      ff_sc1 := t_ff_sc1;

      Workers.submit(small_step_57'access, id);

   end small_step_45;

   procedure small_step_46(Id: TID) is
      t_fc1 : Float;
      t_fc2 : Float;
      t_fc3 : Float;
      t_fc4 : Float;
      t_b3 : Boolean;
      t_ssc2 : Float;
      t_ff_sc2 : Float;
   begin
      t_fc1 := fc1;
      t_fc2 := fc2;
      t_fc3 := fc3;
      t_fc4 := fc4;
      t_b3 := b3;
      if(t_b3) then
         t_ssc2 := (t_fc3+t_fc4-t_fc1-t_fc2) / (t_fc1+t_fc2+t_fc3+t_fc4);
      elsif(not t_b3) then
         t_ssc2 := 0.0;
      end if;
      ssc2 := t_ssc2;


      t_ssc2 := ssc2;
      t_ff_sc2 := t_ssc2 * 0.2;
      ff_sc2 := t_ff_sc2;
      Workers.submit(small_step_57'access, id);
   end small_step_46;

   --Req2.2
   procedure small_step_63(Id: TID) is
      cpt : uint32;
      t_ffa1 : Float;
      t_ffa2 : Float;
      t_ffa3 : Float;
      t_ffa4 : Float;
      t_b4 : Boolean;
   begin
      c_small_step_63.decr(cpt);
      if (cpt > 0) then return; end if;
      t_ffa1 := ffa1;
      t_ffa2 := ffa2;
      t_ffa3 := ffa3;
      t_ffa4 := ffa4;
      t_b4 := (t_ffa1 + t_ffa2 + t_ffa3 + t_ffa4) > 0.34;
      b4 := t_b4;
      Workers.submit(small_step_64'access, id);
      Workers.submit(small_step_65'access, id);
   end small_step_63;

   procedure small_step_64(Id: TID) is
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

      t_fa5 := fa5;
      t_fa7 := t_fa5 * 0.25;
      fa7 := t_fa7;
      Workers.submit(small_step_68'access, id);
   end small_step_64;

   procedure small_step_65(Id: TID) is
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

      t_fa6 := fa6;
      t_fa8 := t_fa6 * 0.25;
      fa8 := t_fa8;
      Workers.submit(small_step_68'access, id);
   end small_step_65;

   procedure small_step_68(Id: TID) is
      t_fa7 : Float;
      t_fa8 : Float;
      t_fa9 : Float;
      cpt : uint32;
   begin
      c_small_step_68.decr(cpt);
      if (cpt > 0) then return; end if;
      t_fa9 := fa9;

      t_fa7 := fa7;
      t_fa8 := fa8;
      t_fa9 := t_fa7 + t_fa8;
      fa9 := t_fa9;
      Workers.submit(small_step_time'access, id);
   end small_step_68;

   procedure small_step_55(Id: TID) is
      t_vb : Float;
      cpt : uint32;
   begin
      c_small_step_55.decr(cpt);
      if (cpt > 0) then return; end if;
      t_vb := vb;
      vb := t_vb + 0.1;
      Workers.submit(small_step_time'access, id);
   end small_step_55;

   procedure small_step_57(Id: TID) is
      cpt : uint32;
      t_vc : Float;
   begin
      c_small_step_57.decr(cpt);
      if (cpt > 0) then return; end if;
      t_vc := vc;
      vc := t_vc + 0.2;
      Workers.submit(small_step_time'access, id);
   end small_step_57;

   procedure small_step_time(Id: TID) is
      cpt : uint32;
   begin
      c_small_step_time.decr(cpt);
      if (cpt > 0) then return; end if;

      Number := Number -1;
      --Put_Line(Integer'Image(Number));
      if Number = 0 then
         Ada.Text_IO.Put_Line(Duration'Image(Ada.Calendar.Clock - Start_Time));
         --raise PROGRAM_ERROR with "END";
         GNAT.OS_Lib.OS_Exit (0);
      else
         Workers.submit(start_step'Access, id);
      end if;
   end small_step_time;

   procedure start_step(Id: TID) is
   begin
      Workers.submit(small_step_01'access, id);
      Workers.submit(small_step_02'access, id);
      Workers.submit(small_step_03'access, id);
      Workers.submit(small_step_04'access, id);
      Workers.submit(small_step_05'access, id);
      Workers.submit(small_step_06'access, id);
      Workers.submit(small_step_07'access, id);
      Workers.submit(small_step_08'access, id);
      Workers.submit(small_step_09'access, id);
      Workers.submit(small_step_10'access, id);
      Workers.submit(small_step_11'access, id);
      Workers.submit(small_step_12'access, id);
      Workers.submit(small_step_13'access, id);
      Workers.submit(small_step_14'access, id);
      Workers.submit(small_step_15'access, id);
      Workers.submit(small_step_16'access, id);
   end start_step;
begin
   Start_Time := Ada.Calendar.Clock;
   Workers.submit(Start_Step'Access);--JP
end Main;
