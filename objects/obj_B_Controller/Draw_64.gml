/// @description HUD

// Region
draw_sprite_stretched_ext(spr_GUI_Region, 0, -8, -16, room_width+16, room_height+32, global.Colors[COLOR.Accent], .25);

draw_set_font(global.Font_Small);
draw_set_halign(fa_middle);

var _Center = canvas_gui_w * .5;

if(Anim_Score > 0){

	var _P1 = obj_B_UFO_P1.Score;
	var _P2 = obj_B_UFO_P2.Score;
	if(Display_Scores > 0){
	
		_P1 = round(random(99));
		_P2 = round(random(99));
	}
	
	var _Offset = 128 * (1 - Anim_Score);
	
	draw_set_alpha(Anim_Score);
	
	// Names
	draw_text_ol((_Center-70) - _Offset, (canvas_margin+120)-16, "P1", global.Colors[COLOR.Elements], global.Colors[COLOR.Background]);
	draw_text_ol((_Center+70) + _Offset, (canvas_margin+120)-16, "P2", global.Colors[COLOR.Accent], global.Colors[COLOR.Background]);
	
	// Score
	draw_set_font(global.Font);
	draw_text_ol((_Center-70) - _Offset, canvas_margin+120, string(_P1), global.Colors[COLOR.Elements], global.Colors[COLOR.Background]);
	draw_text_ol((_Center+70) + _Offset, canvas_margin+120, string(_P2), global.Colors[COLOR.Accent], global.Colors[COLOR.Background]);

	draw_set_alpha(1);
}

if(Anim_Score < 1){
	
	// Timer
	var _Col = global.Colors[COLOR.Elements];
	if(Game_Timer <= 10)
		_Col = global.Colors[COLOR.Accent];

	draw_set_font(global.Font);
	draw_text_ol(_Center, canvas_margin - (48 * Anim_Score), "&" + string(floor(Game_Timer)), _Col, global.Colors[COLOR.Background]);
}