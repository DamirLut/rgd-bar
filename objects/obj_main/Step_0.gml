
if (mouse_check_button_pressed(mb_left)) {
    drag_x = mouse_x
    drag_y = mouse_y
}

if (mouse_check_button(mb_left)) {
	
	var _camera = view_camera[0];
    
	var _x = camera_get_view_x(_camera);
	var _y = camera_get_view_y(_camera);
	
    _x = drag_x - (mouse_x - _x);
    _y = drag_y - (mouse_y - _y);
    
    _x = max(0, min(_x, room_width - camera_get_view_width(_camera)));
    _y = max(0, min(_y, room_height - camera_get_view_height(_camera)));
	
	camera_set_view_pos(_camera,_x,_y);
}