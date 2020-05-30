with Ada.Text_IO;
use Ada.Text_IO;

--with echo;
with converter;

procedure Main is
   S :String := Get_Line;
begin
   --  Insert code here.
   -- while echo = 0 loop
   --  null;
   -- end loop;
   Put_Line(converter.boldify(S));
   for I in S'First .. S'Last loop
      Put_Line(S(I)'Image);
   end loop;
end Main;
