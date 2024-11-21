// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function KillPlayer(){
		 /// @description Player Death
		 
	global.health--;
	
	with (oGun) instance_destroy(); // gets rid of gun upon player death
	instance_change(oPDead, true);

	// Direction change, fall direction
	direction = point_direction(other.x, other.y, x, y);
	hsp = lengthdir_x(6, direction);
	vsp = lengthdir_y(4, direction) - 2;

	if (sign(hsp) != 0) {
		// Makes sure the player is pointing in the right direction based on collision
		image_xscale = sign(hsp);	
	}
	
	if (global.health <= 0) {
        SlideTransition(TRANS_MODE.GOTO, rMenu); // If out of health, send player to the menu
        global.health = 3; // Reset health for new playthrough
        return; // Stop further execution
    }
	
	// Resets the score count to zero after each player death.
	global.kills -= global.killsthisroom;
}