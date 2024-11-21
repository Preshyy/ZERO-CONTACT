// Beginning event
if (hp <= 0) {
	// Setting the fall direction with respect to bullet collision
	with (instance_create_layer(x, y, layer, oDead)) {
		direction = other.hitfrom;
		hsp = lengthdir_x(3, direction);
		vsp = lengthdir_y(3, direction) - 2;
		
		if (sign(hsp) != 0) {
			image_xscale = sign(hsp) * other.size;
			image_yscale = other.size;
		}
	}
	
	with (mygun) instance_destroy();
	
	// If player is alive, increase kill count by 1
	if (instance_exists(oPlayer)) {
		global.kills++;	
		global.killsthisroom++;
		with (oGame) killtextscale = 2;
	}
	instance_destroy(); 
}