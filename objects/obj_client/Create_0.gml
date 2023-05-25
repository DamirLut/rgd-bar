show_debug_message("[Client] prepare to launch game");
window_set_caption("Client");

game_client = new GameClient();

game_client.on("ready", function(){
	global.GameEvent.emit("connected");
});


var w = browser_width;
var h = browser_height;

// find screen pixel dimensions:
var rz = browser_get_device_pixel_ratio();
var rw = w * rz;
var rh = h * rz;

// update room/view size:
view_wport[0] = rw;
view_hport[0] = rh;

// resize application_surface, if needed

surface_resize(application_surface, rw, rh);


// set window size to screen pixel size:
window_set_size(rw, rh);

// set canvas size to page pixel size:
browser_stretch_canvas(w, h);