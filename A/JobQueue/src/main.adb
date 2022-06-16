--JobQueue
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Ada.Calendar.Formatting; use Ada.Calendar.Formatting;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with System.Multiprocessors; use System.Multiprocessors;
procedure Main is
   Start_Time : Ada.Calendar.Time;
   K : constant := 10000;
   Number : Integer := 1000;
   Sa1, Sa2, Sa3, Sa4, Sb1, Sb2, Sb3, Sb4, Sc1, Sc2, Sc3, Sc4, S_A1, S_A2, S_A3, S_A4 : Float;
   vb, vc, fa9 : Float;
   fa1, fa2, fa3, fa4, fb1, fb2, fb3, fb4, fc1, fc2, fc3, fc4 : Float;
   b1, b2, b3, b4 : Boolean;
   ssa1, ssa2, ssb1, ssb2, ssc1, ssc2 : Float;
   ff_sa1, ff_sa2, ff_sb1, ff_sb2, ff_sc1, ff_sc2 : Float;
   ffa1, ffa2, ffa3, ffa4, fa5, fa6, fa7, fa8 : Float;

   type action is access procedure;
   type index is mod K;
   type todolist is array (index) of action;

   protected type counter(init: integer := 1) is
      procedure decr(z: out boolean);
   private
      c:integer := init;
   end counter;
   protected body counter is
      procedure decr(z : out boolean) is
      begin
         c := c - 1;
         if c=0 then c := init; z := true;
         else
            z := false;
         end if;
      end decr;
   end counter;

   protected type taskQueue is
      entry put(a:in action);
      entry get(a:out action);
      function size return  Integer;
   private
      todo : todolist := (others => null);
      head : index := 0;
      tail : index := 0;
      count : integer range 0..K := 0;
   end taskQueue;

   NBtask : Integer := 0;
   protected body taskQueue is
      entry put(a:in action) when count < K is
      begin
         todo(tail) := a;
         tail := tail+1;
         count := count+1;
      end put;

      entry get(a:out action) when count > 0 is
      begin
         a := todo(head);
         todo(head) := null;
         NBtask := NBtask + 1;
         head := head+1;
         count := count - 1;
      end get;

      function size return Integer is
      begin
         return count;
      end size;

   end taskQueue;
   tq: taskQueue;

   task type worker (K : CPU_Range) with CPU => K is
   end worker;

   task body worker is
      a:action;
   begin
      loop
         --while (tq.size = 0) loop delay 0.0001; end loop;
         tq.get(a);
         a.all;
         if (Number = 0) then exit; end if;
      end loop;
   end worker;
   worker1 : worker(1);
   worker2 : worker(2);
   worker3 : worker(3);
   worker4 : worker(4);
   worker5 : worker(5);
   worker6 : worker(6);
   worker7 : worker(7);
   worker8 : worker(8);

   c_small_step_34 : counter(4);
   c_small_step_35 : counter(4);
   c_small_step_36 : counter(4);
   c_small_step_49 : counter(2);
   c_small_step_50 : counter(2);
   c_small_step_51 : counter(2);
   c_small_step_52 : counter(2);
   c_small_step_53 : counter(2);
   c_small_step_54 : counter(2);
   c_small_step_19 : counter(2);
   c_small_step_20 : counter(2);
   c_small_step_63 : counter(4);
   c_small_step_68 : counter(2);
   c_small_step_time : counter(5);

   procedure small_step_01;
   procedure small_step_02;
   procedure small_step_03;
   procedure small_step_04;
   procedure small_step_05;
   procedure small_step_06;
   procedure small_step_07;
   procedure small_step_08;
   procedure small_step_09;
   procedure small_step_10;
   procedure small_step_11;
   procedure small_step_12;
   procedure small_step_13;
   procedure small_step_14;
   procedure small_step_15;
   procedure small_step_16;
   procedure small_step_17;
   procedure small_step_18;
   procedure small_step_19;
   procedure small_step_20;
   procedure small_step_21;
   procedure small_step_22;
   procedure small_step_23;
   procedure small_step_24;
   procedure small_step_25;
   procedure small_step_26;
   procedure small_step_27;
   procedure small_step_28;
   procedure small_step_29;
   procedure small_step_30;
   procedure small_step_31;
   procedure small_step_32;
   procedure small_step_33;
   procedure small_step_34;
   procedure small_step_35;
   procedure small_step_36;
   procedure small_step_37;
   procedure small_step_38;
   procedure small_step_39;
   procedure small_step_40;
   procedure small_step_41;
   procedure small_step_42;
   procedure small_step_43;
   procedure small_step_44;
   procedure small_step_45;
   procedure small_step_46;
   procedure small_step_47;
   procedure small_step_48;
   procedure small_step_49;
   procedure small_step_50;
   procedure small_step_51;
   procedure small_step_52;
   procedure small_step_53;
   procedure small_step_54;
   procedure small_step_59;
   procedure small_step_60;
   procedure small_step_61;
   procedure small_step_62;
   procedure small_step_63;
   procedure small_step_64;
   procedure small_step_65;
   procedure small_step_66;
   procedure small_step_67;
   procedure small_step_68;
   procedure small_step_time;
   procedure end_step;

   procedure small_step_01 is
      t_Sa1 : Float;
   begin

      t_Sa1 := 0.1;
      Sa1 := t_Sa1;
      tq.put(small_step_22'access);
   end small_step_01;

   procedure small_step_02 is
      t_Sa2 : Float;
   begin

      t_Sa2 := 0.2;
      Sa2 := t_Sa2;
      tq.put(small_step_23'access);
   end small_step_02;

   procedure small_step_03 is
      t_Sa3 : Float;
   begin
      t_Sa3 := 0.3;
      Sa3 := t_Sa3;
      tq.put(small_step_24'access);
   end small_step_03;

   procedure small_step_04 is
      t_Sa4 : Float;
   begin
      t_Sa4 := 0.4;
      Sa4 := t_Sa4;
      tq.put(small_step_25'access);
   end small_step_04;

   procedure small_step_05 is
      t_Sb1 : Float;
   begin
      t_Sb1 := 0.5;
      Sb1 := t_Sb1;
      tq.put(small_step_26'access);
   end small_step_05;

   procedure small_step_06 is
      t_Sb2 : Float;
   begin
      t_Sb2 := 0.6;
      Sb2 := t_Sb2;
      tq.put(small_step_27'access);
   end small_step_06;

   procedure small_step_07 is
      t_Sb3 : Float;
   begin
      t_Sb3 := 0.7;
      Sb3 := t_Sb3;
      tq.put(small_step_28'access);
   end small_step_07;

   procedure small_step_08 is
      t_Sb4 : Float;
   begin
      t_Sb4 := 0.8;
      Sb4 := t_Sb4;
      tq.put(small_step_29'access);
   end small_step_08;

   procedure small_step_09 is
      t_Sc1 : Float;
   begin
      t_Sc1 := 0.9;
      Sc1 := t_Sc1;
      tq.put(small_step_30'access);
   end small_step_09;

   procedure small_step_10 is
      t_Sc2 : Float;
   begin
      t_Sc2 := 1.0;
      Sc2 := t_Sc2;
      tq.put(small_step_31'access);
   end small_step_10;

   procedure small_step_11 is
      t_Sc3 : Float;
   begin
      t_Sc3 := 1.1;
      Sc3 := t_Sc3;
      tq.put(small_step_32'access);
   end small_step_11;

   procedure small_step_12 is
      t_Sc4 : Float;
   begin
      t_Sc4 := 1.2;
      Sc4 := t_Sc4;
      tq.put(small_step_33'access);
   end small_step_12;

   procedure small_step_13 is
      t_S_A1 : Float;
   begin
      t_S_A1 := 1.3;
      S_A1 := t_S_A1;
      tq.put(small_step_59'access);
   end small_step_13;

   procedure small_step_14 is
      t_S_A2 : Float;
   begin
      t_S_A2 := 1.4;
      S_A2 := t_S_A2;
      tq.put(small_step_60'access);
   end small_step_14;

   procedure small_step_15 is
      t_S_A3 : Float;
   begin
      t_S_A3 := 1.5;
      S_A3 := t_S_A3;
      tq.put(small_step_61'access);
   end small_step_15;

   procedure small_step_16 is
      t_S_A4 : Float;
   begin
      t_S_A4 := 1.6;
      S_A4 := t_S_A4;
      tq.put(small_step_62'access);
   end small_step_16;

   --Req1.1
   procedure small_step_22 is
      t_Sa1 : Float;
      t_fa1 : Float;
   begin
      t_Sa1 := Sa1;
      t_fa1 := 0.1 * t_Sa1;
      fa1 := t_fa1;
      tq.put(small_step_34'access);
   end small_step_22;

   procedure small_step_23 is
      t_Sa2 : Float;
      t_fa2 : Float;
   begin
      t_Sa2 := Sa2;
      t_fa2 := 0.1 * t_Sa2;
      fa2 := t_fa2;
      tq.put(small_step_34'access);
   end small_step_23;

   procedure small_step_24 is
      t_Sa3 : Float;
      t_fa3 : Float;
   begin
      t_Sa3 := Sa3;
      t_fa3 := 0.1 * t_Sa3;
      fa3 := t_fa3;
      tq.put(small_step_34'access);
   end small_step_24;

   procedure small_step_25 is
      t_Sa4 : Float;
      t_fa4 : Float;
   begin
      t_Sa4 := Sa4;
      t_fa4 := 0.1 * t_Sa4;
      fa4 := t_fa4;
      tq.put(small_step_34'access);
   end small_step_25;

   procedure small_step_26 is
      t_Sb1 : Float;
      t_fb1 : Float;
   begin
      t_Sb1 := Sb1;
      t_fb1 := 0.1 * t_Sb1;
      fb1 := t_fb1;
      tq.put(small_step_35'access);
   end small_step_26;

   procedure small_step_27 is
      t_Sb2 : Float;
      t_fb2 : Float;
   begin
      t_Sb2 := Sb2;
      t_fb2 := 0.1 * t_Sb2;
      fb2 := t_fb2;
      tq.put(small_step_35'access);
   end small_step_27;

   procedure small_step_28 is
      t_Sb3 : Float;
      t_fb3 : Float;
   begin
      t_Sb3 := Sb3;
      t_fb3 := 0.1 * t_Sb3;
      fb3 := t_fb3;
      tq.put(small_step_35'access);
   end small_step_28;

   procedure small_step_29 is
      t_Sb4 : Float;
      t_fb4 : Float;
   begin
      t_Sb4 := Sb4;
      t_fb4 := 0.1 * t_Sb4;
      fb4 := t_fb4;
      tq.put(small_step_35'access);
   end small_step_29;

   procedure small_step_30 is
      t_Sc1 : Float;
      t_fc1 : Float;
   begin
      t_Sc1 := Sc1;
      t_fc1 := 0.1 * t_Sc1;
      fc1 := t_fc1;
      tq.put(small_step_36'access);
   end small_step_30;

   procedure small_step_31 is
      t_Sc2 : Float;
      t_fc2 : Float;
   begin
      t_Sc2 := Sc2;
      t_fc2 := 0.1 * t_Sc2;
      fc2 := t_fc2;
      tq.put(small_step_36'access);
   end small_step_31;

   procedure small_step_32 is
      t_Sc3 : Float;
      t_fc3 : Float;
   begin
      t_Sc3 := Sc3;
      t_fc3 := 0.1 * t_Sc3;
      fc3 := t_fc3;
      tq.put(small_step_36'access);
   end small_step_32;

   procedure small_step_33 is
      t_Sc4 : Float;
      t_fc4 : Float;
   begin
      t_Sc4 := Sc4;
      t_fc4 := 0.1 * t_Sc4;
      fc4 := t_fc4;
      tq.put(small_step_36'access);
   end small_step_33;

   --Req1.2
   procedure small_step_34 is
      rdy : boolean;
      t_fa1 : Float;
      t_fa2 : Float;
      t_fa3 : Float;
      t_fa4 : Float;
      t_b1 : Boolean;
   begin
      c_small_step_34.decr(rdy);
      if (not rdy) then return; end if;
      t_fa1 := fa1;
      t_fa2 := fa2;
      t_fa3 := fa3;
      t_fa4 := fa4;
      t_b1 := (t_fa1+t_fa2+t_fa3+t_fa4) > 0.20;
      b1 := t_b1;
      tq.put(small_step_37'access);
      tq.put(small_step_38'access);
      tq.put(small_step_39'access);
      tq.put(small_step_40'access);
   end small_step_34;

   procedure small_step_35 is
      rdy : boolean;
      t_fb1 : Float;
      t_fb2 : Float;
      t_fb3 : Float;
      t_fb4 : Float;
      t_b2 : Boolean;
   begin
      c_small_step_35.decr(rdy);
      if (not rdy) then return; end if;
      t_fb1 := fb1;
      t_fb2 := fb2;
      t_fb3 := fb3;
      t_fb4 := fb4;
      t_b2 := (t_fb1+t_fb2+t_fb3+t_fb4) > 0.21;
      b2 := t_b2;
      tq.put(small_step_41'access);
      tq.put(small_step_42'access);
      tq.put(small_step_43'access);
      tq.put(small_step_44'access);
   end small_step_35;

   procedure small_step_36 is
      rdy : boolean;
      t_fc1 : Float;
      t_fc2 : Float;
      t_fc3 : Float;
      t_fc4 : Float;
      t_b3 : Boolean;
   begin
      c_small_step_36.decr(rdy);
      if (not rdy) then return; end if;
      t_fc1 := fc1;
      t_fc2 := fc2;
      t_fc3 := fc3;
      t_fc4 := fc4;
      t_b3 := (t_fc1+t_fc2+t_fc3+t_fc4) > 0.22;
      b3 := t_b3;
      tq.put(small_step_45'access);
      tq.put(small_step_46'access);
      tq.put(small_step_47'access);
      tq.put(small_step_48'access);
   end small_step_36;

   procedure small_step_37 is
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
      tq.put(small_step_49'access);
   end small_step_37;

   procedure small_step_38 is
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
      tq.put(small_step_50'access);
   end small_step_38;

   procedure small_step_39 is
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
      tq.put(small_step_49'access);
   end small_step_39;

   procedure small_step_40 is
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
      tq.put(small_step_50'access);
   end small_step_40;

   procedure small_step_41 is
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
      tq.put(small_step_51'access);
   end small_step_41;

   procedure small_step_42 is
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
      tq.put(small_step_52'access);
   end small_step_42;

   procedure small_step_43 is
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
      tq.put(small_step_51'access);
   end small_step_43;

   procedure small_step_44 is
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
      tq.put(small_step_52'access);
   end small_step_44;

   procedure small_step_45 is
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
      tq.put(small_step_53'access);
   end small_step_45;

   procedure small_step_46 is
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
      tq.put(small_step_54'access);
   end small_step_46;

   procedure small_step_47 is
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
      tq.put(small_step_53'access);
   end small_step_47;

   procedure small_step_48 is
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
      tq.put(small_step_54'access);
   end small_step_48;

   --Req1.3
   procedure small_step_49 is
      rdy : boolean;
      t_ssa1 : Float;
      t_ff_sa1 : Float;
   begin
      c_small_step_49.decr(rdy);
      if (not rdy) then return; end if;
      t_ssa1 := ssa1;
      t_ff_sa1 := t_ssa1 * 0.2;
      ff_sa1 := t_ff_sa1;
      tq.put(small_step_17'access);
   end small_step_49;

   procedure small_step_50 is
      rdy : boolean;
      t_ssa2 : Float;
      t_ff_sa2 : Float;
   begin
      c_small_step_50.decr(rdy);
      if (not rdy) then return; end if;
      t_ssa2 := ssa2;
      t_ff_sa2 := t_ssa2 * 0.2;
      ff_sa2 := t_ff_sa2;
      tq.put(small_step_18'access);
   end small_step_50;

   procedure small_step_51 is
      rdy : boolean;
      t_ssb1 : Float;
      t_ff_sb1 : Float;
   begin
      c_small_step_51.decr(rdy);
      if (not rdy) then return; end if;
      t_ssb1 := ssb1;
      t_ff_sb1 := t_ssb1 * 0.2;
      ff_sb1 := t_ff_sb1;
      tq.put(small_step_19'access);
   end small_step_51;

   procedure small_step_52 is
      rdy : boolean;
      t_ssb2 : Float;
      t_ff_sb2 : Float;
   begin
      c_small_step_52.decr(rdy);
      if (not rdy) then return; end if;
      t_ssb2 := ssb2;
      t_ff_sb2 := t_ssb2 * 0.2;
      ff_sb2 := t_ff_sb2;
      tq.put(small_step_19'access);
   end small_step_52;

   procedure small_step_53 is
      rdy : boolean;
      t_ssc1 : Float;
      t_ff_sc1 : Float;
   begin
      c_small_step_53.decr(rdy);
      if (not rdy) then return; end if;
      t_ssc1 := ssc1;
      t_ff_sc1 := t_ssc1 * 0.2;
      ff_sc1 := t_ff_sc1;
      tq.put(small_step_20'access);
   end small_step_53;

   procedure small_step_54 is
      rdy : boolean;
      t_ssc2 : Float;
      t_ff_sc2 : Float;
   begin
      c_small_step_54.decr(rdy);
      if (not rdy) then return; end if;
      t_ssc2 := ssc2;
      t_ff_sc2 := t_ssc2 * 0.2;
      ff_sc2 := t_ff_sc2;
      tq.put(small_step_20'access);
   end small_step_54;

   --Req2.1
   procedure small_step_59 is
      t_S_A1 : Float;
      t_ffa1 : Float;
   begin
      t_S_A1 := S_A1;
      t_ffa1  := 0.3 * t_S_A1;
      ffa1 := t_ffa1;
      tq.put(small_step_63'access);
   end small_step_59;

   procedure small_step_60 is
      t_S_A2 : Float;
      t_ffa2 : Float;
   begin
      t_S_A2 := S_A2;
      t_ffa2  := 0.3 * t_S_A2;
      ffa2 := t_ffa2;
      tq.put(small_step_63'access);
   end small_step_60;

   procedure small_step_61 is
      t_S_A3 : Float;
      t_ffa3 : Float;
   begin
      t_S_A3 := S_A3;
      t_ffa3  := 0.3 * t_S_A3;
      ffa3 := t_ffa3;
      tq.put(small_step_63'access);
   end small_step_61;

   procedure small_step_62 is
      t_S_A4 : Float;
      t_ffa4 : Float;
   begin
      t_S_A4 := S_A4;
      t_ffa4  := 0.3 * t_S_A4;
      ffa4 := t_ffa4;
      tq.put(small_step_63'access);
   end small_step_62;

   --Req2.2
   procedure small_step_63 is
      rdy : boolean;
      t_ffa1 : Float;
      t_ffa2 : Float;
      t_ffa3 : Float;
      t_ffa4 : Float;
      t_b4 : Boolean;
   begin
      c_small_step_63.decr(rdy);
      if (not rdy) then return; end if;
      t_ffa1 := ffa1;
      t_ffa2 := ffa2;
      t_ffa3 := ffa3;
      t_ffa4 := ffa4;
      t_b4 := (t_ffa1 + t_ffa2 + t_ffa3 + t_ffa4) > 0.34;
      b4 := t_b4;
      tq.put(small_step_64'access);
      tq.put(small_step_65'access);
   end small_step_63;

   procedure small_step_64 is
      t_ffa1 : Float;
      t_ffa2 : Float;
      t_ffa3 : Float;
      t_ffa4 : Float;
      t_b4 : Boolean;
      t_fa5 : Float;
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
      tq.put(small_step_66'access);
   end small_step_64;

   procedure small_step_65 is
      t_ffa1 : Float;
      t_ffa2 : Float;
      t_ffa3 : Float;
      t_ffa4 : Float;
      t_b4 : Boolean;
      t_fa6 : Float;
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
      tq.put(small_step_67'access);
   end small_step_65;

   procedure small_step_66 is
      t_fa5 : Float;
      t_fa7 : Float;
   begin
      t_fa5 := fa5;
      t_fa7 := t_fa5 * 0.25;
      fa7 := t_fa7;
      tq.put(small_step_68'access);
   end small_step_66;

   procedure small_step_67 is
      t_fa6 : Float;
      t_fa8 : Float;
   begin
      t_fa6 := fa6;
      t_fa8 := t_fa6 * 0.25;
      fa8 := t_fa8;
      tq.put(small_step_68'access);
   end small_step_67;

   procedure small_step_68 is
      t_fa9 : Float;
      rdy : boolean;
   begin
      c_small_step_68.decr(rdy);
      if (not rdy) then return; end if;
      t_fa9 := fa9;
      tq.put(small_step_21'access);
   end small_step_68;

   --output
   procedure small_step_17 is
      t_ff_sa1 : Float;
   begin
      t_ff_sa1 := ff_sa1;
      tq.put(small_step_time'access);
   end small_step_17;

   procedure small_step_18 is
      t_ff_sa2 : Float;
   begin
      t_ff_sa2 := ff_sa2;
      tq.put(small_step_time'access);
   end small_step_18;

   procedure small_step_19 is
      t_vb : Float;
      rdy : boolean;
   begin
      c_small_step_19.decr(rdy);
      if (not rdy) then return; end if;
      t_vb := vb;
      vb := t_vb + 0.1;
      tq.put(small_step_time'access);
   end small_step_19;

   procedure small_step_20 is
      rdy : boolean;
      t_vc : Float;
   begin
      c_small_step_20.decr(rdy);
      if (not rdy) then return; end if;
      t_vc := vc;
      vc := t_vc + 0.2;
      tq.put(small_step_time'access);
   end small_step_20;

   procedure small_step_21 is
      t_fa7 : Float;
      t_fa8 : Float;
      t_fa9 : Float;
   begin
      t_fa7 := fa7;
      t_fa8 := fa8;
      t_fa9 := t_fa7 + t_fa8;
      fa9 := t_fa9;
      tq.put(small_step_time'access);
   end small_step_21;

   procedure small_step_time is
      rdy : boolean;
   begin
      c_small_step_time.decr(rdy);
      if (not rdy) then return; end if;

      Number := Number -1;
      if Number = 0 then
         Ada.Text_IO.Put_Line(Duration'Image(Ada.Calendar.Clock - Start_Time));
         tq.put(end_step'access);
      else --Put_Line("End:" & Integer'Image(Number));
         tq.put(small_step_01'access);
         tq.put(small_step_02'access);
         tq.put(small_step_03'access);
         tq.put(small_step_04'access);
         tq.put(small_step_05'access);
         tq.put(small_step_06'access);
         tq.put(small_step_07'access);
         tq.put(small_step_08'access);
         tq.put(small_step_09'access);
         tq.put(small_step_10'access);
         tq.put(small_step_11'access);
         tq.put(small_step_12'access);
         tq.put(small_step_13'access);
         tq.put(small_step_14'access);
         tq.put(small_step_15'access);
         tq.put(small_step_16'access);
      end if;
   end small_step_time;

   procedure end_step is
   begin
      tq.put(end_step'Access);
   end end_step;
begin
   Start_Time := Ada.Calendar.Clock;
   vb := 0.0;
   vc := 0.0;
   tq.put(small_step_01'access);
   tq.put(small_step_02'access);
   tq.put(small_step_03'access);
   tq.put(small_step_04'access);
   tq.put(small_step_05'access);
   tq.put(small_step_06'access);
   tq.put(small_step_07'access);
   tq.put(small_step_08'access);
   tq.put(small_step_09'access);
   tq.put(small_step_10'access);
   tq.put(small_step_11'access);
   tq.put(small_step_12'access);
   tq.put(small_step_13'access);
   tq.put(small_step_14'access);
   tq.put(small_step_15'access);
   tq.put(small_step_16'access);

end Main;
