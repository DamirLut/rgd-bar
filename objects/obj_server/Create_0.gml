#macro RGD_ID "504617984594018325"
show_debug_message("[Server] prepare to launch game");
window_set_caption("Server");

game_server = new GameServer();

if(os_type == os_linux){
	//draw_enable_drawevent(false);
}

bot = new DiscordClient({
	token: global.config.token,
	intents: [
		DiscordIntents.Guilds,
		DiscordIntents.GuildMembers,
		DiscordIntents.GuildMessages,
		DiscordIntents.MessageContent,
		DiscordIntents.GuildVoiceStates
	]
});

channels = [];

bot.on("READY", function(){
	show_debug_message("READY!");
});

function spawn_user(_user_id){
	var user = new DiscordUser(_user_id);
	with({user: user}){
		return user._fetch().andThen(function(_data){
			self.instance = instance_create_depth(global.spawn_x, global.spawn_y, 1, obj_chel, {
				user: self.user,
				is_server: true,
				discord_id: _data.user.id
			});
			
			return self;
		});
	}
}

bot.on("GUILD_CREATE", function(_data){
	if(_data.id == RGD_ID){
		for(var i = 0; i < array_length(_data); i++){
			if(_data[i].type == DiscordChannelType.GuildVoice){
				array_push(channels, _data[i]);
			}
		}
		
		for(var i = 0; i < array_length(_data.voice_states); i++){
			var state = _data.voice_states[i];
			with({state: state }){
				other.spawn_user( state.user_id).andThen(function(_data){
					_data.instance.voice_channel = state.channel_id;
				});
			}
		}
		
	}
});

bot.on("MESSAGE_CREATE", function(_data){
	show_debug_message(json_stringify(_data, true));
});

bot.on("VOICE_STATE_UPDATE", function(_state){
	
	var user_id = _state.user_id;
	var channel_id = _state.channel_id;
	
	var pchel = undefined;
	
	with (obj_chel) {
		if(discord_id == user_id){
			pchel = self;
		}
	}
	
	if(!pchel){
		with({state: _state }){
			other.spawn_user( state.user_id).andThen(function(_data){
				_data.instance.voice_channel = state.channel_id;
				show_debug_message("User joined to voice");
			});
		}
		return;
	}

	
	if(!channel_id){
		show_debug_message("User left voice");
		pchel.voice_channel = undefined;
		pchel.to_exit = true;
		pchel.alarm[0] = 1;
		return;
	}
	
	if(channel_id != pchel.voice_channel){
		pchel.voice_channel = channel_id;
		show_debug_message("User change voice channel");
	}
	
	//show_debug_message(json_stringify(_data,true));
});