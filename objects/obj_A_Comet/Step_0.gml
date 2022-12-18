// Move
if(global.State != STATE.Paused)
	y += (7.5 * 2) * global.Speed;

// Reset position
if(y > room_height+96)
	instance_destroy(id, true);

// Sound effect
if(y > -32)
&&(!SFX){
	
	SFX = true;
	if(audio_is_playing(snd_Comet))
		audio_stop_sound(snd_Comet);
		
	var _SFX = audio_play_sound(snd_Comet, 0, false);
	audio_sound_pitch(_SFX, 1 + (global.Speed/game_p1_speedmax));
}

// Animations
Anim_Tilt = ( (abs(Anim_Tilt) + Tilt_Speed) % 360) * Tilt_Direction;
image_speed = 1 * (global.State != STATE.Paused);