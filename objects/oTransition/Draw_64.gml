 /// @description Drawing Black bars

if (mode != TRANS_MODE.OFF) {
	draw_set_color(c_black); // draw: draws on the screen without having to account for the camera
	draw_rectangle(0, 0, w, percent * h_half, false); // black rectangle drawn from top to center of the screen
	draw_rectangle(0, h, w, h - (percent * h_half), false); // black rectangle drawn from bottom to center of the screen
}

// draw_set_color(c_white);
// draw_text(50, 50, string(percent));