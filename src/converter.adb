package body converter is
   function boldify(S: String;found:Boolean:=False) return String is
   begin
      if S="" then
         return "";
      end if;
      for I in S'Range loop
         if I /= S'Last and S(I) = '*' then
            if S(I+1) = '*' then
               return S(S'First .. I-1) &
               (if found then "</b>" else "<b>") &
                 boldify(S(I+2 .. S'Last),not found);
            end if;
         end if;
      end loop;
      return S;
   end boldify;
   -- finds things wrapped in **-s and turns them into <b></b>
   function italicise(S: String;found:Boolean:=False) return String is
   begin
      if S="" then
         return "";
      end if;
      for I in S'Range loop
         if S(I) = '*' then
            return S(S'First .. I-1) &
            (if found then "</i>" else "<i>") &
              italicise(S(I+1 .. S'Last),not found);
         end if;
      end loop;
      return S;
   end italicise;
   -- finds things wrapped in **-s and turns them into <b></b>
   function linkify(S: String) return string is
	   link_start: Integer :=-1;
	   link_end: Integer :=-1;
	   href_start: Integer :=-1;
	   href_end: Integer := -1;
   begin
	if S = "" then
		return "";
	end if;
	for I in S'Range loop
		if href_end /= -1 then
			return S( S'First .. link_start-1) &
				"<a href='" & S(href_start+1 .. href_end-1) & "' >" &
				S(link_start+1 ..link_end-1) & "</a>"&
				linkify(S( href_end+1 .. S'Last));
		end if;
		if S(I) = '[' then
			link_start:=I;
		end if;
		if link_start /= -1 and S(I) = ']' then
			link_end:=I;
		end if;
		if link_end /= -1 and link_end = I-1 and S(I) = '(' then
			href_start:=I;
		end if;
		if href_start /= -1 and S(I) = ')' then
			href_end:=I;
		end if;
	end loop;
   end linkify;

end converter;
