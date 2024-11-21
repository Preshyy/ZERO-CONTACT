/// @description Resolution and Score tracking
#macro RES_W 1420
#macro RES_H 1120
// display_set_gui_size(RES_W, RES_H);

// Score tracking - Global variables
// Can access anywhere
global.hasgun = false; // New game mode
global.kills = 0; // Zero as game starts
global.killsthisroom = 0;
killtextscale = 1; // Text effect
global.health = 3; // Initialises player hp to 3 at the start of the game