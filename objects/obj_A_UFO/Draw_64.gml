var _X = global.CameraX+x;
var _Y = global.CameraY+y;

// Cursor region
if(Anim_CursorRegion > 0)
	draw_sprite_stretched_ext(spr_GUI_Region, 0, 4, room_height-144, room_width - 8, room_height - (room_height - (144-4) ), global.Colors[COLOR.Accent], clamp(Anim_CursorRegion, 0, 1));

// Expressions
var _Expression = ceil(Anim_Blink);
if(Crash)
	_Expression = 3; //+ (GameOver_Rumble < pi * 3);
else{
		
	if(global.State == STATE.Paused)
		_Expression = 1;
	else if(obj_A_Controller.Anim_NewRecord > 0)
		_Expression = 2;
}

// Trail
if(PowerUp){
	
	var _Stretch = clamp(global.Speed / game_p1_speedmax, 0, 1);
	
	draw_sprite_ext(spr_Comet, Anim_Trails, _X, _Y, -1, .75 + (.25 * _Stretch), 180 + Anim_Tilt, global.Colors[COLOR.Accent], image_alpha * _Stretch);
	draw_sprite_ext(spr_Comet, Anim_Trails, _X, _Y, 1, .75 + (.25 * _Stretch), 180 + Anim_Tilt, global.Colors[COLOR.Accent], image_alpha * _Stretch);
}

// Body
draw_sprite_ext(spr_UFO_Body, 1 + (2 * (PowerUp > 0) ), _X, _Y, 1, 1, Anim_Tilt, global.Colors[COLOR.Background], image_alpha);
draw_sprite_ext(spr_UFO_Body, 0 + (2 * (PowerUp > 0) ), _X, _Y, 1, 1, Anim_Tilt, global.Colors[COLOR.Elements], image_alpha);

// Eyes
draw_sprite_ext(spr_UFO_EyesOL, _Expression, _X, _Y, 1, 1, Anim_Tilt, global.Colors[COLOR.Elements], image_alpha);
draw_sprite_ext(spr_UFO_Eyes, _Expression, _X, _Y, 1, 1, Anim_Tilt, c_white, image_alpha);

// Antenna
if(PowerUp <= 0)
	draw_sprite_ext(spr_UFO_Antenna, 0, _X, _Y, -Anim_Face, 1, Anim_Tilt, global.Colors[COLOR.Elements], image_alpha);
	
// Sleep
if(global.State == STATE.Paused)
	draw_sprite_ext(spr_UFO_Sleep, Anim_Sleep, _X, _Y, 1, 1, Anim_Tilt, global.Colors[COLOR.Accent], image_alpha);