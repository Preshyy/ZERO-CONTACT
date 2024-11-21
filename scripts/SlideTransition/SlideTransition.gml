/// @desc SlideTransition (mode, targetroom)
/// @arg Mode sets transition mode between next, restart and goto
/// @arg Target sets target room when using the goto mode
// Modifies oTransition's mode and target based on given instructions when called
with (oTransition) {
	mode = argument[0];
	if (argument_count > 1) { // argument_count: returns the number of arguments passed through the function
		target = argument[1];
	}
}
