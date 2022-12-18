if(global.Speed > 0)
&&(global.State != STATE.Paused){
	
	var _I, _Parallax;
	var _Speed = global.Speed / game_p1_speedmax;
	
	// Stars
	_Parallax = ( .5 * _Speed );
	for(_I = 0; _I < 64; ++_I){
		
		if(Stars[_I].Y > room_height + 16){
			
			Stars[_I].X = floor(random(room_width));
			Stars[_I].Y = -16 - random(32);
			Stars[_I].Size = floor(random(4));
		}
		else	
			Stars[_I].Y += _Parallax + ( .05 * (Stars[_I].Size+1) );
	}
	
	// Planets
	_Parallax = ( 2 * _Speed );
	for(_I = 0; _I < 2; ++_I){

		if(Planets[_I].Y > room_height + 128){

			Planets[_I].X = 64 + round(random(room_width - (64*2)));
			Planets[_I].Y = -( (room_height * 2) + random(96) );
			Planets[_I].Type = (2 * _I) + floor(random(2));
		}
		else
			Planets[_I].Y += _Parallax;
	}

	// Globe
	_Parallax = 24 * ( global.Speed / (game_p1_speedmax-game_p1_speedmin) );
	if(Globe.Y < room_height+657)
		Globe.Y += .75 + _Parallax;
}