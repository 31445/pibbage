package body converter is
   function boldify(S: String;found:Boolean:=False) return String is
   begin
      if S="" then
         return "";
      end if;
      for I in S'Range loop
         if S(I .. I+1)="**" then
            return S(S'First .. I-1) &
            (if found then "</b>" else "<b>") &
              boldify(S(I+2 .. S'Last),not found);
         end if;
      end loop;
      return S;
   end boldify;
   -- finds things wrapped in **-s and turns them into <b></b>


end converter;
