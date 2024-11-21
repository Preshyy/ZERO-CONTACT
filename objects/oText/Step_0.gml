/// @description Progress text
// Adding the word speed to every letter
letters += spd;
text_current = string_copy(text, 1, floor(letters)); // floor rounds the integer up to the nearest whole

// Setting font and drawing it
draw_set_font(fSign);
// if (h == 0) {}

h = string_height(text_current);
w = string_width(text_current);

// Erase when done
if (letters >= length) && (keyboard_check_pressed(vk_anykey)){
	instance_destroy();
	with (oCamera) follow = oPlayer;
}
