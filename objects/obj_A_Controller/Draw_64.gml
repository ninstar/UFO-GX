/// @description HUD
draw_set_font(global.Font_Small);
draw_set_halign(fa_middle);

var _Center = canvas_gui_w * .5;

// Region
draw_sprite_stretched_ext(spr_GUI_Region, 0, -8, -16, room_width+16, room_height+32, global.Colors[COLOR.Accent], .25);

// Game over
if(global.State == STATE.GameOver)
	draw_text_ol(_Center, canvas_margin+120, text_gameover, global.Colors[COLOR.Accent], global.Colors[COLOR.Background]);

// Score
var _Col = global.Colors[COLOR.Elements];
if(Anim_NewRecord > 0)
&&((Anim_NewRecord % 20) <= 10)
	_Col = global.Colors[COLOR.Accent];

var _NewRecord = "";
if(Game_Score >= global.HiScore)
	_NewRecord = "$";
else
	draw_text_ol(_Center, canvas_margin + 36, "$" + string_zero(global.HiScore, 4), _Col, global.Colors[COLOR.Background]);

draw_set_font(global.Font);
draw_text_ol(_Center, canvas_margin, _NewRecord + string_zero(Game_Score, 4), _Col, global.Colors[COLOR.Background]);