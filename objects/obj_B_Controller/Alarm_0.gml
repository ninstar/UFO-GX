/// @description Generate asteroids / comets
if(global.State == STATE.Playing){
	
	var _Type = choose(obj_A_Asteroid, obj_A_Comet);
	instance_create_depth(x+32 + ( 64 * floor(random(game_p1_cells)) ), -room_height * 2, 5, _Type);

	var _Interval = 1;
	if(Game_Timer <= 100)	_Interval = 30;
	if(Game_Timer <= 80)	_Interval = 15;
	if(Game_Timer <= 60)	_Interval = 25;
	if(Game_Timer <= 20)	_Interval = 10;
	if(Game_Timer <= 10)	_Interval = 30;
	if(Game_Timer <= 0)		_Interval = -1;

	alarm[0] = _Interval;
}
else
	alarm[0] = 1;