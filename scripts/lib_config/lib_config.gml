
if(os_browser == browser_not_a_browser){
	if(!file_exists("settings.json")){
		show_error("Settings not found!", true);
	}
	var _file = file_text_open_read("settings.json");
	
	var _string = "";
	
	while(!file_text_eoln(_file)){
		_string += file_text_readln(_file);
	}
	
	file_text_close(_file);
	
	global.config = json_parse(_string);
	
}