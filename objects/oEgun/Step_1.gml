 /// @description 
// Following the player
x = owner.x;
y = owner.y + 10;

// Adjusting gun sizing with respect to the enemy
image_xscale = abs(owner.image_xscale);
image_yscale = abs(owner.image_yscale);

// Check to see if the player exists
if (instance_exists(oPlayer)) {
	if (oPlayer.x < x) {	// player is to the left, if false player is to the right
		image_yscale = -image_yscale; // flips the gun
	}
	if (point_distance(oPlayer.x,oPlayer.y,x,y) < 600) {
		// Aim at player and begin countdown to shoot (see create event)
		image_angle = point_direction(x,y,oPlayer.x,oPlayer.y);
		countdown--; // subtracts by 1
		if (countdown <= 0) {
			countdown = countdownrate;
			if (!collision_line(x,y,oPlayer.x,oPlayer.y,oWall,false,false)) { // Prevents enemy from shooting the wall
				audio_sound_pitch(snShot, choose(1.2, 0.8, 1.5)); // Adjusting pitch
				audio_play_sound(snShot, 5, false); // Adding shooting sound effect
	
				with (instance_create_layer(x, y, "Bullets", oEbullet)) { // creating a new instance
					spd = 10; // 10 pixels per frame
					// direction = other.image_angle; // referring back to the gun object
					direction = other.image_angle + random_range(-3,3) // Bullet spray mechanic: randomizes the direction to simulate rigorous gun movement
					image_angle = direction;
				}
			}
		}
	}
}