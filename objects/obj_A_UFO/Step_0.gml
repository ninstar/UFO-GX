/// @description Logic
var _CursorRegion = obj_A_Controller.Cursor_Region;

// Controls
if(!Crash)
&&(global.State == STATE.Playing){
	
	// Enable cursor controls
	if(_CursorRegion)
	&&(!Cursor)
	&&(mouse_check_button_released(mb_left)){
		
		Cursor = true;
		
		// Hide region
		Anim_CursorRegion = 0;
		
		// Show guides
		with(obj_System)
			Anim_Guides = 60;
	}
	
	// Keyboard direction inputs
	var _Dir_HOLD = ( keyboard_check(vk_right) || keyboard_check(ord("D")) ) - ( keyboard_check(vk_left) || keyboard_check(ord("A")) );
	var _Dir_PRESS = ( keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")) ) - ( keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) );
	
	// Keyboard controls
	if(_Dir_HOLD != 0){
		
		// Disable cursor controls
		Cursor = false;
			
		// Button threshold
		if(_Dir_PRESS != 0){
		
			// Face direction
			Face = _Dir_PRESS;
			
			Threshold = 10;
		}
		
		Threshold -= Threshold > 0;
		
		if(_Dir_PRESS != 0)
		||(Threshold == 0){
			
			// Cell at grid
			Cell_X += _Dir_HOLD;
			Cell_X = clamp(Cell_X, 0, game_p1_cells-1);
		}
	}
	
	// Cursor controls
	if(Cursor)
	&&(_CursorRegion){
					
		// Cursor position at cell
		var _CursorCell = floor( mouse_x / ( room_width / game_p1_cells ) );
		
		// Face direction
		if(_CursorCell > Cell_X)
		||(_CursorCell < Cell_X)
			Face = (_CursorCell > Cell_X) - (_CursorCell < Cell_X);
			
		// Cell at grid
		Cell_X = clamp(_CursorCell, 0, game_p1_cells-1);
	}
}

// Asteroids / comets collision
instance_place_list(x, y, obj_A_Asteroid, Collisions, false);
if(ds_list_size(Collisions) > 0){
	
	for(var _A = 0; _A < ds_list_size(Collisions); ++_A) {
		    
		var _Asteroid = ds_list_find_value(Collisions, _A);
		if(_Asteroid.visible)
		&&(!_Asteroid.Destroyed){
			
			if(PowerUp <= 0){
				
				// Crash U.F.O.
				if(!Crash){
				
					Crash = true;
				
					// Disable cursor
					Cursor = false;
				
					// Move further
					Target_Y = y-128;
				
					// Shake screen
					with(obj_System)
						Screen_Rumble = pi * 4;
	
					// Game over
					global.State = STATE.GameOver;
				}
			
				// Tilt
				var _TiltForce = 360 * (1 + global.Speed);
				if(_Asteroid.object_index == obj_A_Comet)
					_TiltForce *= 4;
				
				Anim_Tilt = _TiltForce * -sign( (x+.1) - _Asteroid.x);
			}
			else{
			
				// Shake screen
				with(obj_System)
					Screen_Rumble = pi * 2;
			}
			
			// Destroy asteroid
			with(_Asteroid){
				
				event_user(0);
				event_user(1);
			}
		}
	}
}
ds_list_clear(Collisions);
	
// Move to destination
var _Dest_X = (Cell_X * game_p1_grid) + 32;
x = lerp(x, _Dest_X, .5);
y = lerp(y, Target_Y, .1);

// Power up
PowerUp_Timer -= PowerUp_Timer > 0;
if(PowerUp)
&&(PowerUp_Timer == 0){

	if(global.Speed == obj_A_Controller.Game_Speed){

		Anim_Tilt = 360;
		PowerUp = false;
	}
}

var _PowerUp = instance_place(x, y, obj_A_PowerUp);
if(_PowerUp){

	// Sound effect
	if(!PowerUp){
		
		if(audio_is_playing(snd_PowerUp))
			audio_stop_sound(snd_PowerUp);
	
		audio_play_sound(snd_PowerUp, 0, false);
	}

	// 8 seconds
	PowerUp_Timer = 60 * 8;
	PowerUp = true;
	
	instance_destroy(_PowerUp, true);
}

// Animations
if(Crash)
	Anim_Tilt = lerp(Anim_Tilt, 0, .05);
else
	Anim_Tilt = lerp(Anim_Tilt, -25 * sign( round(_Dest_X - x) ), .25);

Anim_Face = lerp(Anim_Face, Face, .1);
Anim_CursorRegion = lerp(Anim_CursorRegion, Cursor && !_CursorRegion, .1);
Anim_Sleep = ( Anim_Sleep + (1 / 30) ) % 4; 

if(global.State != STATE.Paused)
	Anim_Trails = ( Anim_Trails + (32 / 60) ) % 4;

if(Anim_Blink == 0){

	if(random(100) < 1)
		Anim_Blink = 1;
}
else{

	if(Anim_Blink > 1 / 8)
		Anim_Blink -= 1 / 8;
	else
		Anim_Blink = 0;
}