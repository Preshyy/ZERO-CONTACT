   // Step Event: Describes this special event that happens at every single frame
vsp = vsp + grv; // vertical speed

// Preventing walking off edges
if (grounded) && (scaredOfHeights) && (!place_meeting(x + hsp, y + 1, oWall)) { // About to walk off ledge
	hsp = -hsp; // Flips walking direction
}


// Defining horizontal collision logic
// sign: returns positive or negative one depending on received variable
if (place_meeting(x + hsp,y,oWall)) { // If collision, run code in curly brackets
	while (!place_meeting(x + sign(hsp),y,oWall)){ // while no collision...
		x = x + sign(hsp); // increase x coordinate by 1, keeps movement working
	}
	hsp = -hsp; // Flips walking direction
}

// Using built-in property: x, for x-coordinate
x = x + hsp;

// Defining vertical collision logic
// sign: returns positive or negative one depending on received variable
if (place_meeting(x,y + vsp,oWall)) { // If collision, run code in curly brackets
	while (!place_meeting(x,y + sign(vsp),oWall)){ // while no collision...
		y = y + sign(vsp); // increase x coordinate by 1, keeps movement working
	}
	vsp = 0;
}

// Using built-in property: x, for x-coordinate
y = y + vsp;

// Animation //
if (!place_meeting(x,y + 1,oWall)) { // if not on the floor...
	grounded = false;
	sprite_index = sEnemyA; // Use sprite index A: Mid-Air sprite
	image_speed = 0;
	
	// Check if sign(vsp) > 0 to determine if moving up (negative y) or down (positive y)
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
		 // if moving down, set frame to be frame index 1
	 // else, moving up, set frame to be frame index 0
}
else {
	grounded = true;
	image_speed = 1;
	if (hsp == 0) { // if on the floor, not moving
		sprite_index = sEnemy; // set sprite index to default
	} else {
		sprite_index = sEnemyR; // if not zero, meaning if player is moving, set sprite to running
	}
}

// Flipping the display image for when the character runs/moves left
// image_xscale: built-in variable that adjusts the scale of the character in the x direction
// Positive number for width, negative number for axis
if (hsp != 0) { 
	image_xscale = sign(hsp) * size;
	image_yscale = size;
}