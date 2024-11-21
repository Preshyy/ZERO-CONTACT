/// @description Transition progress
// Checking to see if mode is on/off
if (mode != TRANS_MODE.OFF) {
	if (mode == TRANS_MODE.INTRO) { // If in intro
		percent = max(0, percent - max((percent / 10), 0.005));
	} else {
		percent = min(percenttarget, percent + max(((percenttarget - percent) / 10), 0.005)); // 1.1 = 110% of closing distance for the black rectangles
	}
	if (percent == percenttarget) || (percent == 0) {
		// Switch statement to perform actions with respect to the different modes
		switch (mode) {
			case TRANS_MODE.INTRO: {
				mode = TRANS_MODE.OFF;
				break;
			} case TRANS_MODE.NEXT: { // next room to go to
				mode = TRANS_MODE.INTRO; // shows intro transition animation
				room_goto_next(); // goes to the next room in order
				break;
			} case TRANS_MODE.GOTO: {
				mode = TRANS_MODE.INTRO
				room_goto(target); // goes to target room
				break;
			} case TRANS_MODE.RESTART: {
				game_restart();
				break;
			} 
		}
	}
}
