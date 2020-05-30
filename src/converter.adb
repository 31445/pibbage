package converter is
   function boldify(S: String) return String is
      I:integer;
   begin
      if S="" then
         return S;
      end if;
      for I in S'Range loop
         if S(I)='*' then
            --TODO
            null;
         end if;
      end loop;

   end boldify;
   -- finds things wrapped in *-s and turns them into <b></b>


end converter;
