 /// @description Control Menu
// Menu option ease in
menu_x += (menu_x_target - menu_x) / menu_speed; // menu_x += (target location - current location) / menu speed
// key_up = keyboard_check(vk_up) || keyboard_check(ord("W")); // Adding alternative up keyboard button
// key_down = keyboard_check(vk_down) || keyboard_check(ord("S")); // Adding alternative down keyboard button

// KeyBoard interaction with menu
if (menu_control) {
	if (keyboard_check_pressed(vk_up)) { // If the up button is pressed
		menu_cursor++; // Moves cursor up by adding 1
		if (menu_cursor >= menu_items) { // If the menu cursor goes above the number of options
			menu_cursor = 0 // Loops around
		}
	}
	if (keyboard_check_pressed(vk_down)) { // If the down button is pressed
		menu_cursor--; // Moves cursor down by subtracting 1
		if (menu_cursor < 0) { // If the menu cursor goes below the number of options
			menu_cursor = menu_items - 1; // Loops around
		}
	}
	if (keyboard_check_pressed(vk_enter)) { // If an option is selected by pressing enter
		menu_x_target = gui_width + 200; // Takes menu back towards the far right of the screen
		menu_committed = menu_cursor; // Identifies picked option
		ScreenShake(4, 30); // (magnitude, pixels per shake)
		menu_control = false;
		audio_play_sound(snDeath, 10, false) // Adding the death sound effect in the menu
	}
	
	// Mouse interaction with the menu (overrides the keyboard interaaction as necessary)
	var mouse_y_gui = device_mouse_y_to_gui(0);
	// if mouse is above the botoom of the menu but below the top
	if (mouse_y_gui < menu_y) && (mouse_y_gui > menu_top) {
		menu_cursor = (menu_y - mouse_y_gui) // Subtracts current y-coordinate from coordinate of the bottom of the menu
		div (menu_itemheight * 1.5);
		
		// Setting up the clicks on the menu
		if (mouse_check_button_pressed(mb_left)) {
			menu_x_target = gui_width + 200; // Takes menu back towards the far right of the screen
			menu_committed = menu_cursor; // Identifies picked option
			ScreenShake(4, 30); // (magnitude, pixels per shake)
			menu_control = false;
			audio_play_sound(snDeath, 10, false) // Adding the death sound effect in the menu
		}
	}
}

// Menu option "continue" is selected
// Loading save file function
if (menu_x > gui_width + 150) && (menu_committed != -1) {
	switch (menu_committed) {
		case 2: SlideTransition(TRANS_MODE.NEXT); break; // New Game case
		case 1: {
			if (!file_exists(SAVEFILE)) {
				SlideTransition(TRANS_MODE.NEXT); // Restarts game when save file does not exist
			} else {
				var file = file_text_open_read(SAVEFILE);
				var target = file_text_read_real(file); // Reads target room/level
				global.kills = file_text_read_real(file); // Reads number of kills
				global.hasgun = file_text_read_real(file); // Checks if player has gun to continue with that state
				file_text_close(file);
				SlideTransition(TRANS_MODE.GOTO, target);
			}
		}
		break;
		case 0: game_end(); break; // End game case
	}
}