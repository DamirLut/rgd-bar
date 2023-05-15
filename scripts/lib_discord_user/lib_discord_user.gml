function DiscordUser(_user_id) constructor{
	
	self[$ "id"] = _user_id;
	
	username = "loading...";
	
	_fetch = function(){
		var promise = DiscordClient.instance._fetch($"/guilds/{RGD_ID}/members/{self.id}");
		
		promise.andThen(function(_data){
			self.username = _data[$ "nick"] ?? _data.user.username;
			struct_copy(self, _data);
		})
		
		return promise;
	}
	
}