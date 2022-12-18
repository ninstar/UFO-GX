var _X = global.CameraX+x;
var _Y = global.CameraY+y;

// Expressions
var _Expression = ceil(Anim_Blink);

if(global.State == STATE.GameOver){

	if(obj_B_Controller.Display_Scores == 0){

		if(Score == obj_B_Controller.Score_Winner)
			_Expression = 2;
		else
			_Expression = 4;
	}
}
else{
		
	if(global.State == STATE.Paused)
		_Expression = 1;
}

// Trail
if(PowerUp){
	
	var _Stretch = clamp(global.Speed / game_p1_speedmax, 0, 1);
	
	draw_sprite_ext(spr_Comet, Anim_Trails, _X, _Y, -1, .75 + (.25 * _Stretch), 180 + Anim_Tilt, Color_Trail, image_alpha * _Stretch);
	draw_sprite_ext(spr_Comet, Anim_Trails, _X, _Y, 1, .75 + (.25 * _Stretch), 180 + Anim_Tilt, Color_Trail, image_alpha * _Stretch);
}

// Body
draw_sprite_ext(spr_UFO_Body, 1 + (2 * (PowerUp > 0) ), _X, _Y, 1, 1, Anim_Tilt, global.Colors[COLOR.Background], image_alpha);
draw_sprite_ext(spr_UFO_Body, 0 + (2 * (PowerUp > 0) ), _X, _Y, 1, 1, Anim_Tilt, Color_Body, image_alpha);

// Eyes
draw_sprite_ext(spr_UFO_EyesOL, _Expression, _X, _Y, 1, 1, Anim_Tilt, Color_Body, image_alpha);
draw_sprite_ext(spr_UFO_Eyes, _Expression, _X, _Y, 1, 1, Anim_Tilt, c_white, image_alpha);

// Antenna
if(PowerUp <= 0)
	draw_sprite_ext(spr_UFO_Antenna, 0, _X, _Y, -Anim_Face, 1, Anim_Tilt, Color_Body, image_alpha);
	
// Sleep
if(global.State == STATE.Paused)
	draw_sprite_ext(spr_UFO_Sleep, Anim_Sleep, _X, _Y, 1, 1, Anim_Tilt, global.Colors[COLOR.Accent], image_alpha);