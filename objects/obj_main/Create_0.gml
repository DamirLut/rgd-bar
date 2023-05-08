#macro RGD_ID "504617984594018325"

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
	
	bot._fetch($"guilds/{RGD_ID}/channels").andThen(function(data){
		for(var i = 0; i < array_length(data); i++){
			if(data[i].type == DiscordChannelType.GuildVoice){
				array_push(channels, data[i]);
			}
		}
		
		show_debug_message(channels)
	});
	
});