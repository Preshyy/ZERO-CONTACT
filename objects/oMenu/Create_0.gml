/// @description GUI/Vars/Menu setup
// Creating macro: constant feature, no semi-colon at end
#macro SAVEFILE "Save.sav" // Save feature to text file

// Defining variables
gui_width = display_get_gui_width(); // GUI width
gui_height = display_get_gui_height(); // GUI height
gui_margin = 40; // 32 pixels from the edge of the screen

// Menu variables
menu_x = gui_width + 200; // x-position of menu at any point in time
menu_y = gui_height - gui_margin; // y-poistion of the menu at any point in time
menu_x_target = gui_width - gui_margin; // target location for the GUI
menu_speed = 25; // Determines the movement speed of the menu across the screen, lower is faster
menu_font = fMenu; // Menu font
menu_itemheight = font_get_size(fMenu); // Allows font change while keeping the position of the text
menu_committed = -1; // Value set to a number when an option is selected
menu_control = true; // Boolean variable to determine status of menu control

// Menu entry setup with arrays and indexes
menu[2] = "NEW GAME"; 
menu[1] = "CONTINUE";
menu[0] = "QUIT";

menu_items = array_length_1d(menu); // Determines how many entries there are
menu_top = menu_y - ((menu_itemheight * 1.5) * menu_items); // Determines the top of the menu
menu_cursor = 2;