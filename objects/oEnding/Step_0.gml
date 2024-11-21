/// @description Move player towards center
layer_x("TitleAssets", min(layer_get_x("TitleAssets") + 1, RES_W * 0.5 - 32));
//var target_x = display_get_width() * 0.5 - 32;
// var current_x = layer_get_x("TitleAssets");
// layer_x("TitleAssets", lerp(current_x, target_x, 0.1));

// Progress text
letters += spd;
text = string_copy(endtext[currentline], 1, floor(letters));

// Next line progression
if (letters >= length) && (keyboard_check_pressed(vk_anykey)) {
	if (currentline + 1 == array_length_1d(endtext)) {
		SlideTransition(TRANS_MODE.RESTART);	
	} else {
		currentline++;
		letters = 0;
		length = string_length(endtext[currentline]);
	}
}
