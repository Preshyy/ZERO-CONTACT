/// @description Event triggered whenever the right mouse key is pressed 
// Logic: If player is within 64 pixels and right clicks, text will be displayed

// Checks if player is within range
if (point_in_circle(oPlayer.x,oPlayer.y,x,y,64)) && (!instance_exists(oText)) {
	with (instance_create_layer(x,y-64,layer,oText)) {
		text = other.text; // Defines text in object
		length = string_length(text); // gets length of new string
	}
	
	// Setting camera focus
	with (oCamera) {
		follow = other.id;
	}
}
