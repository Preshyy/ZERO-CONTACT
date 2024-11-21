 // Bullet-Enemy collision
// Other: returns the instance ID of things collided with
// Resetting the speed variables - applies speed before the collision check
x += lengthdir_x(spd, direction); // moves x by an amount in a given direction
y += lengthdir_y(spd, direction); // moves y by an amount in a given direction

if (place_meeting(x, y, pShootable)) {
	with (instance_place(x, y, pShootable)) {
	hp--; // hp - 1
	flash = 3;
	hitfrom = other.direction; // returns ID of the instance of the with statement
	}
	// Erasing bullet after collision
	instance_destroy();
}

if (position_meeting(x, y, oWall)) && (image_index !=0) { 
	// Once a bullet-to-wall collision is found, retrace till back at the edge of the wall
	while (position_meeting(x, y, oWall)) {
		// Move backwards
		x -= lengthdir_x(1, direction); // moves x by an amount in a given direction
		y -= lengthdir_y(1, direction); // moves y by an amount in a given dire
	}
	spd = 0; // Resetting variables
	// Changes oBullet to oHitSpark when a bullet collision is detected
	instance_change(oHitSpark, true);
	layer_add_instance("Tiles", id);
	depth += 1;
}
