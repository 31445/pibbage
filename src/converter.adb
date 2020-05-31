with Ada.Text_IO;
use Ada.Text_IO;

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
               (if found then "</strong>" else "<strong>") &
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
            (if found then "</em>" else "<em>") &
              italicise(S(I+1 .. S'Last),not found);
         end if;
      end loop;
      return S;
   end italicise;
   -- finds things wrapped in *-s and turns them into <i></i>
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
			-- Put_Line(link_start'Image & ' ' & link_end'Image);
		end if;
		if link_start /= -1 and S(I) = ']' then
			link_end:=I;
			-- Put_Line(link_start'Image & ' ' & link_end'Image);
		end if;
		if link_end /= -1 and link_end = I-1 and S(I) = '(' then
			href_start:=I;
			-- Put_Line(href_start'Image & ' ' & href_end'Image);
		end if;
		if href_start /= -1 and S(I) = ')' then
			href_end:=I;
			-- Put_Line(href_start'Image & ' ' & href_end'Image);
		end if;
	end loop;
	if href_end /= -1 then
		return S( S'First .. link_start-1) &
			"<a href='" & S(href_start+1 .. href_end-1) & "' >" &
			S(link_start+1 ..link_end-1) & "</a>"&
			linkify(S( href_end+1 .. S'Last));
	end if;
	return S;
   end linkify;

-- The following function will search for text enclosed by 2 "+" and turn them into a h1 header
	function headerify (S: String; found:Boolean:=False) return String is
		
	   -- Search for the start of the header ("+")
	begin
	if S="" then
		return "";
	end if;
	for I in S'Range loop
		if S(I) = '+' then
			declare
				num : Integer :=1;
			begin
				if I /= S'last then
					while S(I+num) = '+' loop
						num := num+1;
						exit when I+num-1 = S'Last;
					end loop;
				end if;
				return S(S'First .. I-1) &
					(if found then "</h" else "<h")&
					num'Image(2..num'Image'Last) & ">" &
					headerify(S(I+num .. S'Last),not found);
			end;
		end if;
	end loop;
	return S;

	end headerify;

end converter;
