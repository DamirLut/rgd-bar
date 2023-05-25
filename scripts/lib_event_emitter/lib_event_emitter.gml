function EventEmitter() constructor {
	
	__event_emitter_events = ds_map_create();
	
	static on = function(_event, _callback){
		
		if(!ds_map_exists(__event_emitter_events, _event)){
			ds_map_add(__event_emitter_events,_event,[]);
		}
		
		array_push( __event_emitter_events[? _event], _callback );
		
	}
	
	static emit = function(_event){
		if(!ds_map_exists(__event_emitter_events, _event)) return show_debug_message($"Event {_event} not found");
		
		var args = [];
		for(var i = 1; i < argument_count; i++){
			array_push(args, argument[i]);
		}
		
		var callbacks = __event_emitter_events[? _event];
		for(var i = 0; i < array_length(callbacks); i++){
			script_execute_ext(method_get_index(callbacks[i]), args);
		}
	}
	
}