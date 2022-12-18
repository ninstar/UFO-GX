// Sound effect
if(audio_is_playing(snd_Comet_Crash))
	audio_stop_sound(snd_Comet_Crash);
	
audio_play_sound(snd_Comet_Crash, 0, false);