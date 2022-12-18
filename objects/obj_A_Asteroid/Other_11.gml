// Sound effect
if(audio_is_playing(snd_Asteroid_Crash))
	audio_stop_sound(snd_Asteroid_Crash);
	
if(audio_is_playing(snd_Asteroid))
	audio_stop_sound(snd_Asteroid);

var _SFX = snd_Asteroid_Crash;
if(global.Speed >= game_p1_speedmax)
	_SFX = snd_Asteroid;
	
audio_play_sound(_SFX, 0, false);