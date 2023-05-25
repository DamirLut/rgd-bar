

function GameServer(_port = 6789) : EventEmitter() constructor {

	network_create_server(network_socket_ws, _port, 100);
	
	_log($"Server start listening on {_port} port");
	
	_buffer = buffer_create(1024, buffer_grow, 1);
	
	_clients = ds_list_create();
	
	handle_network_event = function(){
		
		switch(async_load[? "type"]) {
			case network_type_connect: {
				var socket = async_load[? "socket"];
				ds_list_add(_clients,socket);
				_log("user connected");
				break;
			}
			
			case network_type_disconnect: {
				ds_list_delete(_clients, ds_list_find_index(_clients, async_load[? "socket"]));
				_log("user disconnected");
				break;
			}
			
			case network_type_data: {
				
				/// TODO handle message
				
				break;
			}
			
		}
		
	}
	
	static send = function(_socket){
		network_send_packet(_socket, _buffer, buffer_tell(_buffer));
	}
	
	static broadcast = function(){
		for(var i = 0; i < ds_list_size(_clients); i++){
			send(_clients[| i]);
		}
	}
	
	static _log = function(_value){
		show_debug_message($"[GameServer] "+_value);
	}

}