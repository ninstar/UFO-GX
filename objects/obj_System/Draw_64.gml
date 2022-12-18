draw_set_font(global.Font_Small);
var _Center = canvas_gui_w / 2;

// Instructions
if(Anim_Instructions > 0){
	
	draw_set_alpha(clamp(Anim_Instructions, 0, 1));
	
	if(global.Game == GAME.A){
		
		draw_set_valign(fa_center);
		draw_text_ol(_Center, canvas_gui_h / 2, text_guide1P, global.Colors[COLOR.Elements], global.Colors[COLOR.Background]);
		draw_set_valign(fa_top);
	}
	else if(global.Game == GAME.B){
		
		draw_set_valign(fa_center);
		draw_text_ol(_Center, (canvas_gui_h/2) - 64, text_guide2P, global.Colors[COLOR.Elements], global.Colors[COLOR.Background]);
		draw_set_valign(fa_top);
		
		// Names
		draw_text_ol(_Center-70, (canvas_gui_h/2), "P1", global.Colors[COLOR.Elements], global.Colors[COLOR.Background]);
		draw_text_ol(_Center+70, (canvas_gui_h/2), "P2", global.Colors[COLOR.Accent], global.Colors[COLOR.Background]);
	
		// Controls
		draw_set_font(global.Font);
		draw_text_ol(_Center-70, (canvas_gui_h/2)+16, "{ }", global.Colors[COLOR.Elements], global.Colors[COLOR.Background]);
		draw_text_ol(_Center+70, (canvas_gui_h/2)+16, "< >", global.Colors[COLOR.Accent], global.Colors[COLOR.Background]);
		draw_set_font(global.Font_Small);
	}
	
	draw_set_alpha(1);
}

// Pause
if(window_has_focus()){
	
	if(Countdown > 0){
	
		draw_sprite_ext(spr_GUI_Countdown, clamp(floor(Countdown), 0, 2), _Center-1, canvas_gui_h * .5, 1, 1, 0, global.Colors[COLOR.Background], 1);	
		draw_sprite_ext(spr_GUI_Countdown, clamp(floor(Countdown), 0, 2), _Center+1, canvas_gui_h * .5, 1, 1, 0, global.Colors[COLOR.Background], 1);	
		draw_sprite_ext(spr_GUI_Countdown, clamp(floor(Countdown), 0, 2), _Center, (canvas_gui_h * .5)-1, 1, 1, 0, global.Colors[COLOR.Background], 1);	
		draw_sprite_ext(spr_GUI_Countdown, clamp(floor(Countdown), 0, 2), _Center, (canvas_gui_h * .5)+1, 1, 1, 0, global.Colors[COLOR.Background], 1);	
		draw_sprite_ext(spr_GUI_Countdown, clamp(floor(Countdown), 0, 2), _Center, canvas_gui_h * .5, 1, 1, 0, global.Colors[COLOR.Accent], 1);	
	}
}
else{

	if(global.State == STATE.Paused)
		draw_text_ol(_Center, (canvas_gui_h * .5) - 5, text_pause, global.Colors[COLOR.Accent], global.Colors[COLOR.Background]);
}

// Quit
if(Anim_Quit > 0){
	
	var _ButtonX = canvas_margin - ( 64 * (1-Anim_Quit) );
	var _ButtonY = ( canvas_gui_h - (canvas_margin + 32) ) + ( 64 * (1-Anim_Quit) );

	draw_sprite_stretched_ext(spr_GUI_Button, Hold_Quit, _ButtonX, _ButtonY + (4 * Hold_Quit), 32, 38, global.Colors[COLOR.Elements], 1);
	draw_sprite_ext(spr_GUI_Option, 3, _ButtonX, _ButtonY + (4 * Hold_Quit), 1, 1, 0, global.Colors[COLOR.Background], 1);
}

// Cursor
//draw_sprite_ext(spr_GUI_Cursor, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 1, 1, 0, global.Colors[COLOR.Elements], 1);
//draw_sprite_ext(spr_GUI_Cursor, 1, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 1, 1, 0, global.Colors[COLOR.Accent], 1);