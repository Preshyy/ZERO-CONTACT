// Getting half the width of the box
var halfw = w * 0.5;

// Drawing the box
draw_set_color(c_black); // box colour
draw_set_alpha(0.5); // Transparency
draw_roundrect_ext(x-halfw-border,y-h-(border*2), x+halfw+border, y,15,15,false);
draw_sprite(sMarker,0,x,y);
draw_set_alpha(1);

// Drawing the text
scr_DrawSetText(c_white,fSign,fa_center,fa_top)
// draw_text(x-halfw,y-h-border, text_current);
draw_text(x, y-h-border, text_current)
