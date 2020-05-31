with Ada.Text_IO;
use Ada.Text_IO;

--with echo;
with converter;

procedure Main is
	function grab_file return string is
		c : character;
		b : boolean;
	begin
		begin
			Get_Immediate(c,b);
			declare
				S:String := (c) & grab_file;
			begin
				return S;
			end;
		exception
			when others =>
				return "";
		end;
	end grab_file;
	S: string := grab_file;
begin
	Put_Line(converter.headerify(converter.linkify(converter.italicise(converter.boldify(S)))));
end Main;
