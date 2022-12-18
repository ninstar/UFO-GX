// Variables
global.TitleSkip = false;
global.Game = GAME.None;
global.State = STATE.Idle;
global.HiScore = 0;
global.Speed = 0;
global.CameraX = 0;
global.CameraY = 0;

// Fonts
global.Font = font_add_sprite_ext(spr_GUI_Font, text_mapstring, 0, 0);
global.Font_Small = font_add_sprite_ext(spr_GUI_FontSmall, text_mapstring, 0, 0);

// Background
instance_create_depth(x, y, 100, obj_Background);

// Colors
Palette = 0;
event_user(0);

// Background
Background_Layer = noone;
Background_Element = noone;

Countdown = 0;
Screen_Rumble = 0;

Show_Guides = false;
Show_Instructions = false;
Show_Quit = false;

Anim_Guides = 0;
Anim_Instructions = 0;

Hold_Quit = false;
Anim_Quit = 0;