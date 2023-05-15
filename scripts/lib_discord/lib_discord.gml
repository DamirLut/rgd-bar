enum DiscordIntents {
	Guilds						= 1,
	GuildMembers				= 2,
	GuildModeration				= 4,
	GuildEmojiAndStickers		= 8,
	GuildIntegrations			= 16,
	GuildWebhooks				= 32,
	GuildInvites				= 64,
	GuildVoiceStates			= 128,
	GuildPresences				= 256,
	GuildMessages				= 512,
	GuildMessageReactions		= 1024,
	GuildMessageTyping			= 2048,
	DirectMessage				= 4096,
	DirectMessageReactions		= 8192,
	DirectMessageTyping			= 16384,
	MessageContent				= 32768,
}

enum DiscordChannelType {
	Text = 0,
	Dm = 1,
	GuildVoice = 2,
}

enum DiscordOpCode {
	Dispatch			= 0,
	Heartbeat			= 1,
	Identify			= 2,
	VoiceStateUpdate	= 4,
	Resume				= 6,
	Reconnect			= 7,
	Hello				= 10,
	HeartbeatACK		= 11,
}

function DiscordClient(_config) constructor {
	
	self._config = _config;
	_socket = network_create_socket(network_socket_ws);
	_buffer = buffer_create(1024,buffer_grow, 1);
	
	_discord_api_host = "https://discord.com/api/v9/";
	
	_events = {};
	
	_log("Try connect to gateway...");
	network_connect_raw_async(_socket,  "127.0.0.1" , 9000 );
	
	handle_network_event = function(){
		
		switch( async_load[? "type"] ){
		
			case network_type_non_blocking_connect: {
				
				if(async_load[? "succeeded"] == false){
					
					_log(json_encode(async_load, true));
					
					throw ("Can't connect to discord gateway");
					
				}
				
				_log("Connected to gateway");
				var _intents = 0;
				
				for(var i = 0; i < array_length(_config.intents); i++){
					_intents |= _config.intents[i];
				}
				
				_send({
					op: DiscordOpCode.Identify,
					d: {
						token: _config.token,
						intents: int64(_intents),
						properties: {
							os: "linux",
							browser: "game-maker",
							device: "game-maker"
						}
					}
				});
				
				break;
			}
			
			case network_type_data: {
				
				var buffer = async_load[? "buffer"];
				var json = buffer_read(buffer, buffer_text);
				var data;
				try {
					data = json_parse(json);
				} catch(_error){
					_log($"[Error] can't parse data, {_error.message}");
					exit;
				}
				
				_handle_data(data);
				
				break;
			}
			
		}
		
	}
	
	on = function(_event, _handler){
	
		if(!struct_exists(_events, _event)){
			struct_set(_events, _event, []);
		}
		array_push(_events[$ _event], _handler);
	}
	
	_ping = function(){
		_log("PING");
		_send({
			op: DiscordOpCode.Heartbeat,
			d: undefined
		});
	}
	
	_handle_data = function(_json){
		
		switch(_json.op){
			case DiscordOpCode.Hello: {				
				
				var _interval = _json.d.heartbeat_interval / 1_000;
				
				var _timesource = time_source_create(time_source_global, _interval, time_source_units_seconds, _ping );
				time_source_start(_timesource);
				
				break;
			}
			
			case DiscordOpCode.HeartbeatACK: {
				
				_log("PONG");
				
				break;
			}
			
			case DiscordOpCode.Dispatch: {
				var _event = _json.t;
				var _data = _json.d;
				
				if(struct_exists(_events, _event)){
				
					var _handlers = _events[$ _event];
					
					for(var i = 0; i < array_length(_handlers);i++){
						_handlers[i](_data);
					}
				
				}else{
					_log($"Unhandled event {_event}");
				}
				
				break;
			}
			
			default: {
				
				_log("[RECEIVE] "+json_stringify(_json, true));
				_log($"Unhandled op code {_json.op}");
			}
			
		}
		
		
	}
	
	_fetch = function(_url, _config = {}){
		var _header = ds_map_create();
		_header[? "Authorization"] = "Bot "+self._config.token;
		_header[? "Content-Type"] = "application/json";
		_config[$ "headers"] = _header;
		
		return fetch(_discord_api_host + _url, _config);
		
	}
	
	_send = function(_struct){
		var _json = json_stringify(_struct, false);
		buffer_seek(_buffer, buffer_seek_start, 0);
		buffer_write(_buffer, buffer_text, _json );
		network_send_raw(_socket, _buffer, buffer_tell(_buffer), network_send_text);
	}
	
	static _log = function(_value){
		show_debug_message($"[Discord] "+_value);
	}
}