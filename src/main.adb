with Ada.Text_IO;
use Ada.Text_IO;

--with echo;
with converter;

procedure Main is
   S :String := Get_Line;
begin
   Put_Line(converter.boldify(S));
end Main;
