if(to_exit) {
	
	target = {
		x: xstart,
		y: ystart
	}
	
	exit;
};

target = {
	x: 16 + random(room_width - 16),
	y: 16 + random(room_height - 16),
}


alarm[0] = room_speed * random_range(5,10);