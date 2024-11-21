/// @description Bouncy marker above sign
// When Player is next to the sign, do this
if (instance_exists(oPlayer)) && (point_in_circle(oPlayer.x,oPlayer.y,x,y,64)) {
	// sets image transparency to 1 or increases by 0.05 every frame
	image_alpha = min(1, image_alpha+0.05)
}

// If image transparency is more than 0, this means oPlayer exists and oPlayer is not close to the sign
if (image_alpha > 0) && (instance_exists(oPlayer)) && (!point_in_circle(oPlayer.x,oPlayer.y,x,y,64)) {
	// reduces image transparency by 0.05 every frame
	image_alpha -= 0.05
}