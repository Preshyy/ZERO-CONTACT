/// @description Draw Menu
draw_set_font(fMenu); // Draws menu font
draw_set_halign(fa_right); // Sets a horizontal alignment of used text, right aligned
draw_set_valign(fa_bottom); // Sets a vertical alignment of used text, bottom aligned

// Drawing the menu
for (var i = 0; i < menu_items; i++) {
	var offset = 2;
	var txt = menu[i];
	// Creating a visual effect when an option is selected
	if (menu_cursor == i) { // if menu option currently drawn is selected
		txt = string_insert("-> ", txt, 0); // Draw a selection cursor on the selected option
		var col = c_white; // Colour of option becomes a highlighted white
	} else { // When option is not selected
		var col = c_gray; // Option colour = gray
	}
	// Mechanism to draw each menu item one at a time from the bottom up
	var xx = menu_x; // x-coordinate
	var yy = menu_y - (menu_itemheight * (i * 1.5)); // y-coordinate
	
	// Drawing the menu
	draw_set_color(c_black); // Text outline
	draw_text(xx - offset, yy, txt);
	draw_text(xx +  offset, yy, txt);
	draw_text(xx, yy + offset, txt);
	draw_text(xx, yy - offset, txt);
	draw_set_color(col); // References the colour change with respect to option selection from lines 13 and 15
	draw_text(xx, yy, txt); // Draws the text string
	
}

