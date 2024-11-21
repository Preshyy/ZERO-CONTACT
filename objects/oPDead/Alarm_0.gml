/// @description: Reset Game speed + Room
// game_set_speed(60, gamespeed_fps); // sets frame rate back to 60
// SlideTransition(TRANS_MODE.GOTO, room); // restarts current game room

if (global.health > 0) {
    // Player still has lives remaining, restart the current room
    game_set_speed(60, gamespeed_fps); // Set frame rate back to normal
    SlideTransition(TRANS_MODE.GOTO, room); // Restart the current room
} 