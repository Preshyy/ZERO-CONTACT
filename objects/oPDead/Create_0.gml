// Variable declaration
hsp = 0; // Horizontal speed
vsp = 0; // Vertical speed
grv = 0.2; // Gravity
done = 0;
death_timer = 60;

image_speed = 0; 
image_index = 0;
ScreenShake(6, 60); // Adding screen shake (magnitude, frames)
audio_play_sound(snDeath, 10, false); // Adding death sound effect

// Creating a pseudo-slow-mo effect upon player's death
game_set_speed(30, gamespeed_fps); // sets game to 30 fps for the duration of the player death animation
with (oCamera) follow = other.id;