
function GameServer(_port = 6789) constructor {

	network_create_server(network_socket_ws, _port, 100);
	
	_log($"Server start listening on {_port} port");
	
	_buffer = buffer_create(1024, buffer_grow, 1);
	
	handle_network_event = function(){
		
		switch(async_load[? "type"]) {
			case network_type_connect: {
				
				show_debug_message("new connection");
				
				break;
			}
			
			case network_type_disconnect: {
				
				show_debug_message("disconnect");
				
				break;
			}
			
			case network_type_data: {
				
				/// TODO handle message
				
				break;
			}
			
		}
		
	}
	
	static _log = function(_value){
		show_debug_message($"[GameServer] "+_value);
	}

}