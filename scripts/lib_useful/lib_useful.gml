function struct_copy(_dest, _source){
	var names = struct_get_names(_source);
	
	for(var i = 0; i < array_length(names); i++){
		var key = names[i];
		
		_dest[$ key] = _source[$ key];
		
	}
	
}