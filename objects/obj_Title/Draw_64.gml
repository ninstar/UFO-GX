draw_set_font(global.Font_Small);
draw_set_halign(fa_middle);

var _Center = canvas_gui_w * .5;
var _Offset, _ButtonX, _ButtonY;

if(Anim_Title > 0){

	_Offset = canvas_gui_h * ( 1 - Anim_Title );
 
	// Logo
	draw_sprite_ext(spr_GUI_Title, 0, _Center, _Offset + 96, 1, 1, 0, global.Colors[COLOR.Elements], 1);
	draw_sprite_ext(spr_GUI_Title, 1, _Center, _Offset + 96, 1, 1, 0, global.Colors[COLOR.Accent], 1);

	// Text
	draw_text_ol(_Center, _Offset + (canvas_gui_h - (canvas_margin+80)), text_startgame, global.Colors[COLOR.Elements], global.Colors[COLOR.Background]);
	draw_text_ol(_Center, _Offset + (canvas_gui_h - (canvas_margin+10)), "2021 - NINSTAR", global.Colors[COLOR.Accent], global.Colors[COLOR.Background]);
}
if(Anim_Modes > 0){

	_Offset = canvas_gui_h * ( 1 - Anim_Modes );
	var _ButtonX = (canvas_gui_w / 2) - ( 288 / 2 );
	
	draw_set_alpha(Anim_Modes);
	draw_text_ol(_Center, 250-_Offset, "$ "+string_zero(global.HiScore, 4)+"", global.Colors[COLOR.Elements], global.Colors[COLOR.Background]);
	draw_set_alpha(1);
	
	draw_set_font(global.Font);
	
	// Single player
	draw_sprite_stretched_ext(spr_GUI_Button, Hold_1P, _ButtonX, ( 96 + (4 * Hold_1P) ) - _Offset, 288, 133, global.Colors[COLOR.Elements], 1);
	draw_sprite_ext(spr_GUI_Cards, 0, _ButtonX, ( 96 + (4 * Hold_1P) ) - _Offset, 1, 1, 0, global.Colors[COLOR.Background], 1);
	draw_sprite_ext(spr_GUI_Cards, 1, _ButtonX, ( 96 + (4 * Hold_1P) ) - _Offset, 1, 1, 0, c_white, 1);
	draw_text_ol(_Center, ( (96+104) + (4 * Hold_1P) ) - _Offset, text_game1P, global.Colors[COLOR.Background], global.Colors[COLOR.Elements]);

	// Multiplayer
	draw_sprite_stretched_ext(spr_GUI_Button, Hold_2P, _ButtonX, ( 288 + (4 * Hold_2P) ) + _Offset, 288, 133, global.Colors[COLOR.Elements], 1);
	draw_sprite_ext(spr_GUI_Cards, 2, _ButtonX, ( 288 + (4 * Hold_2P) ) + _Offset, 1, 1, 0, global.Colors[COLOR.Background], 1);
	draw_sprite_ext(spr_GUI_Cards, 3, _ButtonX, ( 288 + (4 * Hold_2P) ) + _Offset, 1, 1, 0, c_white, 1);
	draw_text_ol(_Center, ( (288+104) + (4 * Hold_2P) ) + _Offset, text_game2P, global.Colors[COLOR.Background], global.Colors[COLOR.Elements]);
}

// Volume
if(Anim_Volume > 0){
	
	_ButtonX = ( canvas_gui_w - (canvas_margin + 32) ) + ( 64 * (1-Anim_Volume) );
	_ButtonY = ( canvas_gui_h - (canvas_margin + 32) ) + ( 64 * (1-Anim_Volume) );

	draw_sprite_stretched_ext(spr_GUI_Button, Hold_Volume, _ButtonX, _ButtonY + (4 * Hold_Volume), 32, 38, global.Colors[COLOR.Elements], 1);

	if(audio_get_master_gain(0) > 0)
		draw_sprite_ext(spr_GUI_Option, 0, _ButtonX, _ButtonY + (4 * Hold_Volume), 1, 1, 0, global.Colors[COLOR.Background], 1);
	else{
	
		draw_sprite_ext(spr_GUI_Option, 1, _ButtonX, _ButtonY + (4 * Hold_Volume), 1, 1, 0, global.Colors[COLOR.Background], 1);
		draw_sprite_ext(spr_GUI_Option, 2, _ButtonX, _ButtonY + (4 * Hold_Volume), 1, 1, 0, global.Colors[COLOR.Accent], 1);
	}
}

//draw_text_ol(_Center, _Offset + (canvas_gui_h - (canvas_margin+40)), "- HI "+string_zero(global.HiScore, 4)+" -", global.Colors[COLOR.Elements], global.Colors[COLOR.Background]);