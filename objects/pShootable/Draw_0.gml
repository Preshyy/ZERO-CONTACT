// Changing how the enemy character is drawn
draw_self();

if (flash > 0) {
	flash--; // Returns flash to 0
	
	// Setting up a shader
	shader_set(shWhite);
	draw_self(); // Draw the sprite
	shader_reset(); // resetting the shader
}