/// @description Logic

// Controls
if(!Crash)
&&(global.State == STATE.Playing){

	// Keyboard direction inputs
	var _Dir_PRESS = keyboard_check_pressed(Key_Right) - keyboard_check_pressed(Key_Left);
	if(_Dir_PRESS != 0){
		
		Face = _Dir_PRESS;
		
		// Cell at grid
		Cell_X += _Dir_PRESS;
		Cell_X = clamp(Cell_X, 0, game_p1_cells-1);
	}
}

// Asteroids / comets collision
instance_place_list(x, y, obj_A_Asteroid, Collisions, false);
if(ds_list_size(Collisions) > 0){
	
	for(var _A = 0; _A < ds_list_size(Collisions); ++_A){
		    
		var _Asteroid = ds_list_find_value(Collisions, _A);
		if(_Asteroid.visible)
		&&(!_Asteroid.Destroyed){
				
			// Shake screen
			with(obj_System)
				Screen_Rumble = pi * 2;
			
			// Destroy asteroid
			with(_Asteroid){
				
				event_user(0);
				event_user(1);
			}
			
			// Score
			Score++;
		}
	}
}
ds_list_clear(Collisions);
	
// Move to destination
var _Dest_X = (Cell_X * game_p1_grid) + 32;
if(global.State == STATE.GameOver){
	
	x = lerp(x, _Dest_X, .05);
	y = lerp(y, Target_Y, .025);
	
	Anim_Tilt = lerp(Anim_Tilt, 0, .1);
}
else{
	
	x = lerp(x, _Dest_X, .5);
	y = lerp(y, Target_Y, .1);
	
	Anim_Tilt = lerp(Anim_Tilt, -25 * sign( round(_Dest_X - x) ), .25);
}

// Shift UFOs
var _OtherUFO = instance_place(x, y, obj_B_UFO_P1);
if(_OtherUFO){
	
	// Shift to another cell
	if(Cell_X == _OtherUFO.Cell_X)
	&&(x != _Dest_X)
		_OtherUFO.Cell_X -= Face;
	
	// Clamp cells
	Cell_X = clamp(Cell_X, 0, game_p1_cells-1);
	_OtherUFO.Cell_X = clamp(_OtherUFO.Cell_X, 0, game_p1_cells-1);
}

// Animations
Anim_Face = lerp(Anim_Face, Face, .1);
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

// Colors
Color_Body = global.Colors[COLOR.Elements];
Color_Trail = global.Colors[COLOR.Accent];