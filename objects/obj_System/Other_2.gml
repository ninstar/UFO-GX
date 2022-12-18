display_set_gui_size(canvas_gui_w, canvas_gui_h);
math_set_epsilon(.00001);

// Load settings
ini_open(file_save)
global.HiScore = ini_read_real("UFOGX", "hs", global.HiScore);
Palette = ini_read_real("UFOGX", "col", Palette);
ini_close();
event_user(0);

// Go to title screen
room_goto(rm_Title);