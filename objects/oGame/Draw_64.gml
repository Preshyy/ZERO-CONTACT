/// @description Draw Score text
// Consider removing (global.kills > 0) to display a default score of 0
if (room != rMenu) && (instance_exists(oPlayer)) && (global.kills > 0) {
	killtextscale = max(killtextscale * 0.95, 1); // Magnifies text and gradually reduces it
	
	// Calculating x-coordinate to align with the top-right corner
	// var score_x = display_get_width() + 10; // Subtracts a margin of 10 pixels
	// var score_y = 10; // Position near the top
	
	// Drawing shadow
	scr_DrawSetText(c_black, fMenu, fa_right, fa_top); // Draws Score text
	draw_text_transformed(x + 1280, 12, string(global.kills), killtextscale, killtextscale, 0); // shadow
	draw_set_color(c_white); // text colour
	draw_text_transformed(x + 1280, 10, string(global.kills), killtextscale, killtextscale, 0);
}
