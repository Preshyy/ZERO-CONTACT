/// @description Set up camera
// Defining necessary variables
cam = view_camera[0]; // Camera created to capture the viewport view
follow = oPlayer; // makes the camera follow the player object

// Variables to define the center point of the view
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

// Determines the x-y coordinates the camera will be moving to
xTo = xstart;
yTo = ystart;

// Variables for screen shake
shake_length = 0; // shake duration
shake_magnitude = 0; // 6 pixels in each direction
shake_remain = 0; // remainder
buff = 32;