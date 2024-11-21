/// Begin step: Happens before any step happens

// Setting the x and y coordinates of the gun to match where the player is/moves to
// Added numbers to move the gun placement up and down over the player character as preferred
x = oPlayer.x + 5; // x coordinate match
y = oPlayer.y + 10; // y coordinate match

// Implementing controller aim.
// If statement to maintain keyboard controls if a controller is not detected || controller == 0
if (oPlayer.controller == 0) {
	// Cursor-Gun coordination
	// This makes the gun move relative to wherever the mouse/cursor is pointing by converting the
	// x-y coordinate of the gun and the x-y coordinate of the mouse to an image angle to be processed.
	image_angle = point_direction(x, y, mouse_x, mouse_y);
} else { // if controller is detected || controller == 1
	// Getting access value of right analog stick in horizontal and vertical direction
	var controllerh = gamepad_axis_value(0, gp_axisrh); // gp_axisrh: gamepad axis, right analog stick, horizontal angle
	var controllerv = gamepad_axis_value(0, gp_axisrv); // gp_axisrh: gamepad axis, right analog stick, vertical angle
	
	// Anticipating dead zone in horizontal and vertical direction
	if (abs(controllerh) > 0.2) || (abs(controllerv) > 0.2) {
		// When dead zone is passed, allow controller aim
		controllerangle = point_direction(0, 0, controllerh, controllerv);
	}
	image_angle = controllerangle; // Retains aim direction with last received from analog stick
}


// Gun firing mechanic
firingdelay = firingdelay - 1;

// Checking to see if left mouse button is pressed || if right shoulder button (R2) is pressed
if ((mouse_check_button(mb_left)) || gamepad_button_check(0, gp_shoulderrb)) && (firingdelay < 0) {
	recoil = 4; // setting gun recoil speed - Gun recoil mechanic
	firingdelay = 5; 
	ScreenShake(2, 10) // Adding screen shake (magnitude, frames)
	audio_sound_pitch(snShot, choose(0.8, 1.0, 1.2)); // Adjusting pitch
	audio_play_sound(snShot, 5, false); // Adding shooting sound effect
	
	with (instance_create_layer(x, y, "Bullets", oBullet)) { // creating a new instance
		spd = 25; // 25 pixels per frame
		// direction = other.image_angle; // referring back to the gun object
		direction = other.image_angle + random_range(-3,3) // Bullet spray mechanic: randomizes the direction to simulate rigorous gun movement
		image_angle = direction;
	}
	// Defining gun kickback
	with (oPlayer) {
		gunkickx = lengthdir_x(1.5, other.image_angle-180); // 1.5 pixels in the oppoite direction of the gun
		gunkicky = lengthdir_y(1, other.image_angle-180); // 1 pixel in the oppositie direction of the gun
	}
	
}

recoil = max(0, recoil - 1); // Gun recoil mechanic
// Gun recoil mechanic - application
x = x - lengthdir_x(recoil, image_angle); // Determines the movement in pixels towards the x-direction 
y = y - lengthdir_y(recoil, image_angle); // Determines the movement in pixels towards the y-direction 

// Fixing the gun display orientation when turned to the left
if (image_angle > 90) && (image_angle < 270) {
	image_yscale = -1;
} else {
	image_yscale = 1;
}