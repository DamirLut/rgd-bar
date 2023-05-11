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

bot.on("GUILD_CREATE", function(_data){
	if(_data.id == RGD_ID){
		for(var i = 0; i < array_length(_data); i++){
			if(_data[i].type == DiscordChannelType.GuildVoice){
				array_push(channels, _data[i]);
			}
		}
		
		for(var i = 0; i < array_length(_data.voice_states); i++){
			var state = _data.voice_states[i];
			var user = state.user_id;
			var channel = state.channel_id;
			show_debug_message(state);
		}
		
	}
});

bot.on("MESSAGE_CREATE", function(_data){
	show_debug_message(json_stringify(_data, true));
});

bot.on("VOICE_STATE_UPDATE", function(_data){
	show_debug_message(json_stringify(_data,true));
});