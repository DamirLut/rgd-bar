draw_set_font(fnt_monogram);
var obj = os_browser == browser_not_a_browser ? obj_server : obj_client;
instance_create_depth(0,0,0,obj);

drag_x = 0;
drag_y = 0;