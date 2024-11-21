 // Step Event: Describes this special event that happens at every single frame
// Defining step logic according to player input //
// keyboard_check = function. Checks to see if the specified key is pressed
// Use format: variable = function_name(parameters);
// Note: Green words = built-in variables, yellow words = functions, blue words = programmer defined variables
if (hascontrol) {
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	// key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
	// key_down = keyboard_check(vk_down) || keyboard_check(ord("S")); 
	key_jump = keyboard_check_pressed(vk_space); // Checks on the specific frame the key is pressed

	// Accounting for controller input by checking if keyboard is being used
	if (key_left) || (key_right) || (key_jump) {
		controller = 0;	
	}

	// Setting up logic to detect controller action for movement (left and right)
	// gp_axislh: detects left analog stick, horizontal axis
	// 0.2: dead zone value to ignore invalid controller input
	// If statement detects if analog stick is beyond the dead zone, then allows input
	if (abs(gamepad_axis_value(0, gp_axislh)) > 0.2) {
		key_left = abs(min(gamepad_axis_value(0, gp_axislh), 0));
		key_right = max(gamepad_axis_value(0, gp_axislh), 0);
		controller = 1;
	}

	// Setting up logic to detect controller action for jumping
	// gp_face1: represents the X button on PS4-like controllers || the A button on Stadia-like controllers
	if (gamepad_button_check_pressed(0, gp_face1)) {
		keyjump = 1;
		controller = 1;
	}
} else {
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}

// Defining movement logic //
// var: establishes a variable by creating a temporary version to last for one frame
// if move = 1 - 0 || move = 0 - 1, move = 1, character moves
// if move = 1 - 1, move = 0, character does not move
var move = key_right - key_left;

// Defining movement speed logic
// Walkspeed is measured in pixels per movement
hsp = (move * walksp) + gunkickx // horizontal movement with gunkick back
gunkickx = 0;
vsp = (vsp + grv) + gunkicky // vertical movement with gunkick back
gunkicky = 0;

// Defining jumping mechanic
// canjump -= 1; // Reduces it by 1 on every single frame
// if (canjump > 0) && (key_jump) { // if on the floor and jump key is pressed...
	//vsp = -7; // jump 7 pixels high
	//canjump = 0;
// }

// Jumping mechanic with double-jump
if (key_jump && jump_count < 2) {
	vsp = -7 // Jump 7 pixels high
	jump_count += 1; // Increases jump count by 1 for each jump
}

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
	while (!place_meeting(x,y + sign(vsp),oWall)){ // while no collision...
		y = y + sign(vsp); // increase x coordinate by 1, keeps movement working
	}
	vsp = 0;
	
	// Resets the jump count when player lands to reset double jump
	jump_count = 0; // Resets jump count on landing
	canjump = 10;
}

// Using built-in property: x, for x-coordinate
y = y + vsp;

// Animation //
if (!place_meeting(x,y + 1,oWall)) { // if not on the floor...
	sprite_index = sPlayerA; // Use sprite index A: Mid-Air sprite
	image_speed = 0;
	
	// Check if sign(vsp) > 0 to determine if moving up (negative y) or down (positive y)
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
		 // if moving down, set frame to be frame index 1
	 // else, moving up, set frame to be frame index 0
}
else {
	// When on the floor
	canjump = 10;
	if (sprite_index == sPlayerA) { // if just touched the ground
		audio_sound_pitch(snLanding, choose(0.8, 1.0, 1.2)); // Adjusting pitch
		audio_play_sound(snLanding, 4, false) // play landing sound effect
		
		// Create dust effect
		repeat(5) {
			with (instance_create_layer(x,bbox_bottom,"Bullets",oDust)) {
				vsp = 0;
			}
		}
	}
	
	image_speed = 1;
	if (hsp == 0) { // if on the floor, not moving
		sprite_index = sPlayer; // set sprite index to default
	} else {
		sprite_index = sPlayerR; // if not zero, meaning if player is moving, set sprite to running
	}
}

// Flipping the display image for when the character runs/moves left
// image_xscale: built-in variable that adjusts the scale of the character in the x direction
// Positive number for width, negative number for axis
if (hsp != 0) { 
	image_xscale = sign(hsp);	
}