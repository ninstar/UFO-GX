depth = -50;

global.State = STATE.Playing;

Game_Score = 0;
Game_Speed = game_p1_speedmin;

Asteroid_EmptyCell = floor(random(game_p1_cells));
GameOver_Delay = 120;
Cursor_Region = false;

if(global.HiScore > 0)
	Anim_NewRecord = -1;
else
	Anim_NewRecord = 0;
	
// Asteroids
for(var _R = 0; _R < 2; ++_R){
	
	for(var _A = 0; _A < game_p1_cells; ++_A){
		
		Asteroids[_R][_A] = instance_create_depth((x+32) + (64*_A), (y-128) - (room_height*_R), 5, obj_A_Asteroid);
		with(Asteroids[_R][_A])
			visible = other.Asteroid_EmptyCell != _A;
	}
}

alarm[0] = 1;