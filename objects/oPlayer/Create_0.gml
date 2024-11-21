/// @description Basic Player variables
// Declaring variables
hsp = 0; // Horizontal speed
vsp = 0; // Vertical speed
grv = 0.3; // Gravity
walksp = 4; // Walkspeed

// Defining variable for controller input
controller = 0;
hascontrol = true;
canjump = 0;
jump_count = 0; // Counts the number of jumps

gunkickx = 0;
gunkicky = 0;

audio_sound_pitch(snShot, 0.8);