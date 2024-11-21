/// @description Check if Ctrl + F is pressed
if (keyboard_check(vk_control)) {
	window_set_fullscreen(!window_get_fullscreen()); // returns true/false, swap to the opposite, apply it to window_set_fullscreen
}
