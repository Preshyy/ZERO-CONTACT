// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function RestartLevel(){
	// room_goto(room); // sends player to current room
	
	/// @description Restarts the current room cleanly
	global.health -= 1;

    // Deactivate and clean up
    instance_deactivate_all(true); // Deactivate all except persistent objects

    // Destroy specific objects to prevent lag
    with (oBullet) instance_destroy(); // Remove all bullets
    with (oEnemy) instance_destroy(); // Remove all enemies

    // Restart the room
    room_goto(room);

    // Reactivate instances
    instance_activate_all();
}