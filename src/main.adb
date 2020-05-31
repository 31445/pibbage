with Ada.Text_IO;
use Ada.Text_IO;

--with echo;
with converter;

procedure Main is
begin
	begin
		loop
			declare
				S :String := Get_Line;
			begin
				Put_Line(converter.headerify(converter.linkify(converter.italicise(converter.boldify(S)))));
			end;
		end loop;
	exception
		when others =>
			return;
	end;
end Main;
