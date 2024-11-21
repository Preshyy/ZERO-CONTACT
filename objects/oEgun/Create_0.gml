 /// @description Variable definitions
countdownrate = 40; // 40 fps in between every bullet shot
countdown = countdownrate;
if (global.hasgun == false) instance_destroy(); // Removes enemy gun if player does not have a gun
