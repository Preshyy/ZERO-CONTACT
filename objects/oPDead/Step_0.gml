// Do collision stuff until body hits ground
if (done == 0) {
	vsp = vsp + grv; // vertical

	// Defining horizontal collision logic
	// sign: returns positive or negative one depending on received variable
	if (place_meeting(x + hsp,y,oWall)) { // If collision, run code in curly brackets
		while (!place_meeting(x + sign(hsp),y,oWall)){ // while no collision...
			x = x + sign(hsp); // increase x coordinate by 1, keeps movement working
		}
		hsp = 0;
	}

	// Using built-in property: x, for x-coordinate
	x = x + hsp;

	// Defining vertical collision logic
	// sign: returns positive or negative one depending on received variable
	if (place_meeting(x,y + vsp,oWall)) { // If collision, run code in curly brackets
		if (vsp > 0) {
			done = 1; // if collision detected, done = 1
			image_index = 0;
			alarm[0] = 60; // game resets 60 frames from player-to-floor impact
		}
		while (!place_meeting(x,y + sign(vsp),oWall)){ // while no collision...
			y = y + sign(vsp); // increase x coordinate by 1, keeps movement working
		}
		vsp = 0;
	}

	// Using built-in property: x, for x-coordinate
	y = y + vsp;
} 