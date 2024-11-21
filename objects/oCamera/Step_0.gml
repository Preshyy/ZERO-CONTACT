 /// @description Update camera
// Updating destination
// Checking if the instance ID of the follow variable exists
if (instance_exists(follow)) {
	// Reassignes the xTo and yTo variables to new coordinates
	xTo = follow.x;
	yTo = follow.y;
	
	// Determines if the object being followed by the camera is oPDead
	// For this to be true, the player must be dead
	if ((follow).object_index == oPDead) {
		// fixes centre of camera on oPDead
		x = xTo;
		y = yTo;
	}
}

// Updating object position
// (Future position - current position) / 25 = Difference between future vs current position
x += (xTo - x) / 25;
y += (yTo - y) / 25;

// Keeps the camera view on the room in the x-y direction
x = clamp(x, view_w_half+buff, room_width - view_w_half-buff); // x-direction: updated with buffer for screen shake
y = clamp(y, view_h_half+buff, room_height - view_h_half-buff); // y-direction: updated with buffer for screen shake

// Screen shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
// Decreasing shake remainder
shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));


// Updating the camera view
// Sets the player in the center view of the camera 
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

// Background movement
if (room != rMenu) && (room != rEnding) {
	if (layer_exists("Mountains")) {
		layer_x("Mountains", x / 2); // x: further back in the distance, x/2 or closer to zero: simulates slower movements
	}
	if (layer_exists("Trees")) {
		layer_x("Trees", x / 4); // x: further back in the distance, x/4 or closer to zero: simulates slower movements
	}
}
