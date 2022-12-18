Cursor_Region = point_in_rectangle(mouse_x, mouse_y, 0, canvas_gui_h-144, canvas_gui_w, canvas_gui_h);

if(global.State == STATE.Playing){
	
	// Speed
	if(obj_A_UFO.PowerUp){
		
		global.Speed = lerp(global.Speed, Game_Speed + (3 * (obj_A_UFO.PowerUp_Timer > 0) ), .05);
		
		var _Lapse = game_p1_speedmax / (60 * 3);
		if(obj_A_UFO.PowerUp_Timer > 0){
			
			// Sound effect
			if(obj_A_UFO.PowerUp_Timer == 1){
		
				if(audio_is_playing(snd_PowerDown))
					audio_stop_sound(snd_PowerDown);
	
				audio_play_sound(snd_PowerDown, 0, false);
			}
	
			// Boost
			if(global.Speed < game_p1_speedmax+1)
				global.Speed += _Lapse;
			else
				global.Speed = game_p1_speedmax+1;
		}
		else{
		
			if(global.Speed > Game_Speed)
				global.Speed -= _Lapse;
			else
				global.Speed = Game_Speed;
		}
	}
	else{
		
		// Speed up
		if(Game_Speed < game_p1_speedmax)
			Game_Speed += game_p1_speedinc;
		
		global.Speed = Game_Speed;
	}
	
	// Score
	Game_Score += 15 / 60;
	if(Game_Score > global.HiScore){
		
		// Set new high score
		global.HiScore = Game_Score;
		
		// High score highlight
		if(Anim_NewRecord == -1){
					
			Anim_NewRecord = 60;
			audio_play_sound(snd_GUI_HiScore, 0, false);
		}
	}
	
	// Asteroids
	for(var _R = 0; _R < 2; ++_R){
	
		// Check if all asteroids in this row are at the very bottom
		var _RowReset = 0;
		for(var _A = 0; _A < game_p1_cells; ++_A){
			
			if(Asteroids[_R][_A].y > room_height+32)
				_RowReset++;
		}
		
		// Reset entire row
		if(_RowReset == game_p1_cells){
		
			// Set new empty cell
			Asteroid_EmptyCell = floor(random(game_p1_cells));
			
			// Apply to asteroids
			for(var _A = 0; _A < game_p1_cells; ++_A){
			
				with(Asteroids[_R][_A]){

					Destroyed = false;
					
					visible = other.Asteroid_EmptyCell != _A;
					
					y = -room_height;
					image_index = round(random(4));
	
					Tilt_Direction = choose(-1, 1);
					Tilt_Speed = .25 + random(2);
				}
			}
			
			// Generate comet
			event_user(0);
		}
	}
}
else if(global.State == STATE.GameOver){

	// Slowdown
	global.Speed = lerp(global.Speed, 0, .25);
	
	// Game over delay
	GameOver_Delay -= GameOver_Delay > 0;
	
	if(GameOver_Delay < 90){
	
		// Quit
		with(obj_System)
			Show_Quit = true;
	}
	
	if(GameOver_Delay < 30){
		
		// Display guides
		with(obj_System)
			Show_Guides = true;
		
		// Try again
		var _Button_Quit = point_in_circle(mouse_x, mouse_y, canvas_margin + 16, canvas_gui_h - (canvas_margin + 16), 24);
		if( ( keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_enter) )
		  ||( mouse_check_button_pressed(mb_left) && Cursor_Region && !_Button_Quit ) )
			room_restart();
	}
}

// Animations
Anim_NewRecord -= Anim_NewRecord > 0;