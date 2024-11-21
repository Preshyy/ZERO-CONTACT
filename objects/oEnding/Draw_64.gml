/// @description Draw black rectangles for text
draw_set_color(c_black);
draw_rectangle(0, 0, RES_W, 128, false); // top
draw_rectangle(0, 700, RES_W, 1150, false); // bottom
// draw_rectangle(0, 700, RES_W, 1000, false); // Alternative fix

// Draw Text
scr_DrawSetText(c_black, fSign, fa_center, fa_top);
draw_text(RES_W * 0.5 + 2, RES_W * 0.3 + 2, text);
draw_set_color(c_white);
draw_text(RES_W * 0.5, RES_W * 0.3, text);