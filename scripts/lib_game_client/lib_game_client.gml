#macro SERVER_IP "127.0.0.1"
#macro SERVER_PORT 6789
#macro RELEASE:SERVER_IP "wss://rgd.chat/bar/server"
#macro RELEASE:SERVER_PORT 443


function GameClient() : EventEmitter() constructor {
	_socket = network_create_socket(network_socket_ws);

	network_connect_async(_socket, SERVER_IP, SERVER_PORT);
	
	handle_network_event = function(){
	
		switch(async_load[? "type"]) {
		
			case network_type_non_blocking_connect: {
				
				if(async_load[? "succeeded"] == false){
					return show_message( $"Can't connect to {SERVER_IP}:{SERVER_PORT}" );
				}
				
				self.emit("ready");
				
				show_message_async("Connected!");
				
				break;
			}
			
			case network_type_data: {
				
				var buffer = async_load[? "buffer"];
				
				show_debug_message(buffer_read(buffer, buffer_text));
				
				break;
			}
		
		}
	
	}
}