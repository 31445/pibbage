package body converter is
   function boldify(S: String;found:Boolean:=False) return String is
      I:integer;
   begin
      if S="" then
         return S;
      end if;
      for I in S'Range loop
         if S(I)='*' then
            --TODO
            return S(S'First .. I-1) &
            (if found then "</b>" else "<b>") &
              boldify(S(I+1 .. S'Last),not found);
         end if;
      end loop;

   end boldify;
   -- finds things wrapped in *-s and turns them into <b></b>


end converter;
