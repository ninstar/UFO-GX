/// @description Logic
depth = -100;

// Window canvas
if(os_browser != browser_not_a_browser){
	
	if(window_get_width() != browser_width)
	||(window_get_height() != browser_height)
		window_set_size(browser_width, browser_height);
}

// Auto-pause
if(global.State == STATE.Paused)
&&(window_has_focus())
&&(alarm[0] == -1){
		
	// Resume
	if(Countdown > 0)
		Countdown -= 1 / 45;
	else
		global.State = STATE.Playing;
}

if(global.State == STATE.Playing)
&&(!window_has_focus())
	alarm[0] = 1;

// Palette
if(keyboard_check_pressed(vk_anykey)){
	
	// Change
	var _PreviousPalette = Palette;
	switch(keyboard_key){
						
		case(ord("1")):	Palette = 0;	break;
		case(ord("2")):	Palette = 1;	break;
		case(ord("3")):	Palette = 2;	break;
		case(ord("4")):	Palette = 3;	break;
		case(ord("5")):	Palette = 4;	break;
		case(ord("6")):	Palette = 5;	break;
		case(ord("7")):	Palette = 6;	break;
		case(ord("8")):	Palette = 7;	break;
		case(ord("9")):	Palette = 8;	break;
	}
	if(Palette != _PreviousPalette){

		// Apply
		event_user(0);
	
		// Background color
		layer_background_blend(Background_Element, global.Colors[COLOR.Background]);
	}
}

// Quit
if(Show_Quit){
	
	// Key
	if(keyboard_check_released(vk_backspace) || keyboard_check_released(vk_escape)){
		
		audio_play_sound(snd_GUI_Quit, 0, false);
		room_goto(rm_Title);
	}

	// Button
	var _Button_Quit = point_in_circle(mouse_x, mouse_y, canvas_margin + 16, canvas_gui_h - (canvas_margin + 16), 24);

	if(mouse_check_button(mb_left))
		Hold_Quit = _Button_Quit;

	if(_Button_Quit){
	
		if(Hold_Quit)
		&&(mouse_check_button_released(mb_left)){
	
			Hold_Quit = false;
			audio_play_sound(snd_GUI_Quit, 0, false);
			room_goto(rm_Title);
		}
	}
}

// Animations
Anim_Quit = lerp(Anim_Quit, Show_Quit, .1);
Anim_Guides = lerp(Anim_Guides, Show_Guides, .05);
Anim_Instructions = lerp(Anim_Instructions, Show_Instructions, .1);

if(Screen_Rumble > .75)
	Screen_Rumble -= .75;
else
	Screen_Rumble = 0;

var _Rumble = sin(Screen_Rumble) * ( Screen_Rumble / pi );
global.CameraX = 8 * _Rumble;
global.CameraY = 6 * _Rumble;