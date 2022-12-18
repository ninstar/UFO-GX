// Pragma
gml_pragma("PNGCrush");

// Macros
#macro game_p1_speedmin .5
#macro game_p1_speedmax 2
#macro game_p1_speedinc .0001
#macro game_p1_grid 64
#macro game_p1_cells 5

#macro canvas_margin 16
#macro canvas_gui_w 320
#macro canvas_gui_h 512

#macro file_save game_save_id+"ufogx.dat"

#macro text_mapstring "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-<>{}&$ "

#macro text_pause "PAUSE"
#macro text_gameover "GAME OVER"
#macro text_startgame "CLICK TO START"
#macro text_game1P "1 PLAYER"
#macro text_game2P "2 PLAYERS"
#macro text_guide1P "CLICK OR PRESS < >"
#macro text_guide2P "CRASH AS MANY ASTEROIDS AS POSSIBLE"

// Enumerators
enum COLOR {

	Accent,
	Elements,
	Background,
}

enum GAME {

	None,
	A,
	B,
}

enum STATE {
	
	Idle,
	Playing,
	Paused,
	GameOver,
}

// Functions
function string_zero(stg, total){
	
	return string_replace_all(string_format(stg, total, 0), " ", "0");
}
function draw_text_ol(x, y, stg, color, colorol){

	var _Col = draw_get_color();
	
	draw_set_color(colorol);
	draw_text(x-1, y, stg);
	draw_text(x+1, y, stg);
	draw_text(x, y-1, stg);
	draw_text(x, y+1, stg);
	
	draw_set_color(color);
	draw_text(x, y, stg);
	
	draw_set_color(_Col);
}