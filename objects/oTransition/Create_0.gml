/// @description Size variables and mode set up

w = display_get_gui_width(); // Getting the width (w) of the GUI - Graphics User Interface
h = display_get_gui_height(); // Getting the height (h) of the GUI - Graphics User Interface
h_half = h * 0.5; // Getting middle point 

// Defining transition mode
// enum: Turns a set of ordered numbers into English-readable words. Effective with constants
enum TRANS_MODE {
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}
mode = TRANS_MODE.INTRO; // Setting transition mode variable
percent = 1; // Animation status
percenttarget = 1.1; // 110% as the closing distance of the black rectangles
target = room; // Room target to transition to