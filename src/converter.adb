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
	   plusArray = [];  -- Initiating array in which we will store the indices of the 2 "+" signs 
	   plusArrayIndex = 1;
	   indexPlusSign = 1;  -- Initiating index counter
	   for i = 1:Length(S)
	     if S(i) != "+"
	       indexPlusSign = indexPlusSign +1;
	     else
	       plusArray(plusArrayIndex) = indexPlusSign;
	       plusArray = plusArray +1;
	       indexPlusSign = indexPlusSign +1;
	   end 
	end

	  -- Retrieving the characters between the 2 "+" signs
	begin
	   headerArray = [];
	   headerArrayIndex = 1;
	   plusIndex1 = plusArray(1);
	   plusIndex2 = plusArray(2);
	   for i = plusIndex1:plusIndex2
	     headerArray(headerArrayIndex) = S(i);
	     headerArrayIndex = headerArrayIndex +1;
	   end
	end

	  -- Concatenating header's caracters into a string
	begin
	   concatHeader = "";
	   for i = 1:Length(headerArray)
	     concatHeader = concatHeader + headerArray(i);
	   end
	end

	  -- Transforming header's text into h1
	begin
	   return <h1>concatheader</h1>
	end
	
	end headerify

end converter;
