package body Counter is
   protected body counter is
      procedure decr(z : out boolean) is
      begin
         c := c - 1;
         if c=0 then c := init; z := true;
         else
            z := false;
         end if;
      end decr;
      procedure decr(z : out integer) is
      begin
         c := c - 1;
	 Z := C;
         if c=0 then c := Init; end if;
      end decr;
   end counter;
end Counter;
