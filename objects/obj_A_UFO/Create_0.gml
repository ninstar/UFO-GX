Cell_X = 3;
Target_Y = room_height-112;
Threshold = 15;
Cursor = mouse_check_button(mb_left);
Crash = false;
Face = -1;

Collisions = ds_list_create();

Anim_Tilt = 0;
Anim_Face = -1;
Anim_Sleep = 0;
Anim_Blink = 0;
Anim_CursorRegion = 0;
Anim_Trails = 0;

PowerUp = false;
PowerUp_Timer = 0;