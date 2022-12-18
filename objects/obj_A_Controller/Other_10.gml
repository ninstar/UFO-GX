/// @description Generate comets
if(global.State == STATE.Playing)
&&(global.Speed > .60)
&&(random(1) <= .25){	// 25% chance
			
	var _FirstCell = -1;
	var _Double = (random(1) <= .05);
	for(var _C = 0; _C < 1 + _Double; ++_C){		// 5% chance

		// Check available cells
		var _S = 0;
		var _AvailableCells = [];
		for(var _P = 0; _P < game_p1_cells; ++_P){
						
			if(_P != obj_A_UFO.Cell_X)
			&&(_P != Asteroid_EmptyCell)
			&&(_P != _FirstCell){
							
				_AvailableCells[_S] = _P;
				_S++;
			}
		}
	
		// Transform int power up
		var _Type = obj_A_Comet;
		if(!_Double)
		&&(random(1) <= .05)	// 5% chance
			_Type = obj_A_PowerUp;
		
		// Shoot comet
		var _Cell = _AvailableCells[ floor(random(_S)) ];			
		instance_create_depth((x+32) + (64*_Cell), -room_height * 2, 5, _Type);
			
		// Remember cell where the first comet shoot
		if(_C == 0)
			_FirstCell = _Cell;
	}
}