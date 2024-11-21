// Firing Delay variable
firingdelay = 0;
recoil = 0;

// Adding variable for controller aiming
controllerangle = 0; // aiming angle for controller use
if (global.hasgun == false) instance_destroy(); // If player did not pick up the gun, destroy gun