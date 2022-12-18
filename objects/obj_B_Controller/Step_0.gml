if(global.State == STATE.Playing){
	
	// Speed up
	global.Speed = lerp(global.Speed, game_p1_speedmax, .15);
	
	// Asteroids
	if(alarm[0] == -1)
	&&(Game_Timer > 0)
		alarm[0] = 15 + round(random(45));
		
	// Timer
	if(Game_Timer > 0)
		Game_Timer -= 1 / 60;
	else{
		
		Game_Timer = 0;
		global.State = STATE.GameOver;
		
		// Explode other asteroids
		with(obj_A_Asteroid)
			event_user(0);
	
		// Arrange UFOs
		obj_B_UFO_P1.Cell_X = 1;
		obj_B_UFO_P2.Cell_X = game_p1_cells-2;

		with(obj_B_UFO_P1){
			
			audio_play_sound(snd_PowerDown, 0, false);
		
			// Move further
			Target_Y = y-128;
	
			// Return to normal form
			Anim_Tilt = 180;
			PowerUp = false;
		}
	}
}
else if(global.State == STATE.GameOver){
	
	// Slow down
	global.Speed = lerp(global.Speed, 0, .1);
	
	if(global.Speed == 0){
	
		if(Display_Scores == -1)
			Display_Scores = 120;
		else{
			
			if(Display_Scores > 0)
				Display_Scores--;
			else{
				
				Score_Winner = max(obj_B_UFO_P1.Score, obj_B_UFO_P2.Score);
	
				// Quit
				with(obj_System)
					Show_Quit = true;
			}
		}
	}
}

// Animations
Anim_Score = lerp(Anim_Score, Display_Scores > -1, .1);