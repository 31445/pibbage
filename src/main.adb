with Ada.Text_IO;
use Ada.Text_IO;

with GNAT.Sockets;
use GNAT.Sockets;

--with echo;
with converter;

procedure Main is
	function request return String is
		Address : Sock_addr_type;
		server:  Socket_type;
		socket : Socket_type;
		Channel: Stream_access;
	begin
		Address.Addr := Addresses (Get_Host_By_Name (Host_Name), 1);
		Address.Port := 54320;
		Create_socket(server);
		Set_socket_option(server,socket_level,(reuse_address,true));
		bind_socket(server,Address);
		listen_socket(server);
		Accept_Socket (Server, Socket, Address);
		Channel := Stream (Socket);
		delay 0.2;
		declare
			Message : string :=String'input(channel);
		begin
			string'output(channel,converter.linkify(converter.italicise(converter.boldify(Message))));
			return converter.linkify(converter.italicise(converter.boldify(Message)));
		end;
	end request;
begin

	declare
		S : String := request;
	begin
		Put_Line(converter.linkify(converter.italicise(converter.boldify(S))));
	end;
end Main;
