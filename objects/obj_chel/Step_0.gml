
if(to_exit){
	if(point_distance(x,y,target.x,target.y) < 1){
		instance_destroy();
	}
}

mp_potential_step_object(target.x,target.y, .75, obj_collision);