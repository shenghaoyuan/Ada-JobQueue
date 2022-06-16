package Counter is
   protected type counter(init: integer := 1) is
      procedure decr(z: out boolean);
      procedure decr(z : out integer);
   private
      c:integer := init;
   end counter;
end Counter;
