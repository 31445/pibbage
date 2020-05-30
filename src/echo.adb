with Ada.Text_IO; use Ada.Text_IO;

function echo return Integer is
   S : String := Get_Line;
begin
   Put_Line("'" & S & "'");
   if S = "stop" or S = "stop " then
      return 1;
   else
      return 0;
   end if;
end echo;
