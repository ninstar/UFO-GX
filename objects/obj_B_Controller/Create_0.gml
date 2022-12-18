depth = -50;

global.State = STATE.Playing;

audio_play_sound(snd_PowerUp, 0, false);

Game_Timer = 100;

Asteroid_EmptyCell = floor(random(game_p1_cells));
GameOver_Delay = 120;
Cursor_Region = false;

Display_Scores = -1;

Score_Winner = -1;
Anim_Score = 0;
