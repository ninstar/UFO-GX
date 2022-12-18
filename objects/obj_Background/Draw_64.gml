draw_clear(global.Colors[COLOR.Background]);

var _X = global.CameraX;
var _Y = global.CameraY;
var _I;

// Stars
var _Stretch = 12 * clamp((global.Speed-1) / game_p1_speedmax, 0, 12);
for(_I = 0; _I < 64; ++_I)
	draw_sprite_ext(spr_Stars, Stars[_I].Size, _X+Stars[_I].X, _Y+Stars[_I].Y, 1, 1 + _Stretch, 0, Color_Stars, image_alpha);
	
// Planets
for(_I = 0; _I < 2; ++_I)
	draw_sprite_ext(spr_Planets, Planets[_I].Type, _X+Planets[_I].X, _Y+Planets[_I].Y, 1,1, 0, Color_Stars, image_alpha);
	
// Globe
if(Globe.Y < room_height + 657){
	
	draw_sprite_stretched_ext(spr_GUI_Region, 1, -16, Globe.Y, room_width+32, room_height+32, global.Colors[COLOR.Background], 1);
	draw_sprite_ext(spr_Globe, 0, Globe.X, Globe.Y, 1, 1, Globe.Tilt, Color_Stars, image_alpha);
}

// Speed fade
draw_sprite_stretched_ext(spr_GUI_Region, 1, -16, -16, room_width+32, room_height+32, global.Colors[COLOR.Background], clamp(.7 * ( (global.Speed-game_p1_speedmin) / (game_p1_speedmax-game_p1_speedmin) ), 0, .7) );

// Guide panels
if(obj_System.Anim_Guides > 0){
	
	for(_I = 0; _I < game_p1_cells; ++_I)
		draw_sprite_stretched_ext(spr_GUI_Region, 1, game_p1_grid * _I, room_height-144, game_p1_grid, room_height - (room_height-144), global.Colors[COLOR.Accent], .5 * clamp(obj_System.Anim_Guides, 0, 1));
}

// Animations
Globe.Tilt = (Globe.Tilt + .05) % 360;