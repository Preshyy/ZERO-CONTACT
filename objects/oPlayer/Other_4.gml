/// @description Auto Save feature
// Check to see if save file exists, then overwrite old save
if (file_exists(SAVEFILE)) file_delete(SAVEFILE);

// Creeate a new save
var file; // temporary file variable
file = file_text_open_write(SAVEFILE); // open new save file
file_text_write_real(file, room); // write to save file
file_text_write_real(file, global.kills); // saves the score on each level after player death
file_text_write_real(file, global.hasgun); // saves game state
file_text_write_real(file, global.health);
file_text_close(file); // close new save file
