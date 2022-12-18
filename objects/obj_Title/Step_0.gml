// Start
if(mouse_check_button_released(mb_left) || keyboard_check_released(vk_enter))
&&(!Hold_Volume){

	// Skip animations
	Anim_Title = Page == 1;
	Anim_Modes = Page == 2;
	
	// Go to game modes screen
	if(Page < 2){
	
		audio_play_sound(snd_GUI_Next, 0, false);
		
		Page = 2;
	}
}

var _Button_Index = 0;
var _BttonX = (canvas_gui_w / 2) - ( 288 / 2 );
_Button_Index += 1 * point_in_circle(mouse_x, mouse_y, canvas_gui_w - (canvas_margin + 16), canvas_gui_h - (canvas_margin + 16), 24);
if(Page == 2){
	
	// Game modes
	_Button_Index += 2 * point_in_rectangle(mouse_x, mouse_y, _BttonX, 96, _BttonX + 288, 96+133);
	_Button_Index += 3 * point_in_rectangle(mouse_x, mouse_y, _BttonX, 288, _BttonX + 288, 288+133);
}

// Select button
if(mouse_check_button(mb_left)){
	
	Hold_Volume = _Button_Index == 1;
	Hold_1P = _Button_Index == 2;
	Hold_2P = _Button_Index == 3;
}

if(mouse_check_button_released(mb_left)){

	if(Hold_Volume){

		audio_master_gain(!audio_get_master_gain(0));
		audio_play_sound(snd_GUI_Toggle, 0, false);
		Hold_Volume = false;
	}
	if(Hold_1P){
		
		audio_play_sound(snd_GUI_Next, 0, false);
		
		Page = 3;
		global.Game = GAME.A;
		Hold_1P = false;
	}
	if(Hold_2P){

		audio_play_sound(snd_GUI_Next, 0, false);
		
		alarm[0] = 60 * 5;
		
		Page = 4;
		global.Game = GAME.B;
		Hold_2P = false;
	}
}

// 1 player
if(Page == 3){
	
	global.Speed += .015 * (global.Speed < game_p1_speedmax);
	
	if(global.Speed > 1){
	
		with(obj_System){
			
			if(mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, 0, room_height-144, room_width, room_height))
			||(keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_enter)){
		
				// Play
				room_goto(rm_Game_A);
			}
			else{
			
				// Keep instructions visible
				Show_Guides = true;
				Show_Instructions = true;
			}
		}
	}
}

// 2 players
if(Page == 4){
	
	global.Speed += .015 * (global.Speed < game_p1_speedmax);
	
	if(global.Speed > 1){
	
		// Skip
		if(keyboard_check_pressed(vk_enter))
			alarm[0] = 1;
				
		// Keep instructions visible
		with(obj_System)
			Show_Instructions = true;
	}
}

// Animations
Anim_Volume = lerp(Anim_Volume, Page < 3, .1);
Anim_Title = lerp(Anim_Title, Page == 1, .1);
Anim_Modes = lerp(Anim_Modes, Page == 2, .1);