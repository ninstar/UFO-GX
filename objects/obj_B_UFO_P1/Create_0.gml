Cell_X = floor(x / game_p1_grid);
Target_Y = room_height-112;
Threshold = 15;
Crash = false;
Face = -1;

Collisions = ds_list_create();

Anim_Tilt = 0;
Anim_Face = -1;
Anim_Sleep = 0;
Anim_Blink = 0;
Anim_CursorRegion = 0;
Anim_Trails = 0;

PowerUp = true;
Score = 0;

Key_Left = ord("A");
Key_Right = ord("D");

Color_Body = c_white;
Color_Trail = c_white;