
global.__http_get_cb_map = ds_map_create();

function https_handler(){
	var _status = async_load[?"status"];
	if (_status > 0) exit;
	var _id = async_load[?"id"];
	var _func = global.__http_get_cb_map[?_id];
	if (_func == undefined) exit;
	ds_map_delete(global.__http_get_cb_map, _id);
	_func(json_parse(json_encode(async_load)));
}

function fetch(_url, _config = {} ){
	with({_url: _url, _config: _config, _resolve: undefined}) 
	return new Promise(function(_resolve){
		
		self._resolve = _resolve;
		
		var _method = _config[$ "method"] ?? "GET";
		var _headers = _config[$ "headers"] ?? -1;
		var _body = _method != "GET" ? json_stringify(_config[$ "body"]) : -1;
		
		var _http_id = http_request(_url, _method, _headers, _body );
		global.__http_get_cb_map[? _http_id] = function(_data){
			_resolve( json_parse( _data.result ));
		};
	});
		
}
