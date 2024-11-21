/// @description Move to next room
with (oPlayer) {
	if (hascontrol) { // if player has control
 		hascontrol = false; // Relinquish control, and show transition animation for next level
 		SlideTransition(TRANS_MODE.GOTO, other.target);
	}
}
