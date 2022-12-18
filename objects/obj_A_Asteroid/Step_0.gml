// Move
if(global.State == STATE.Playing)
	y += 6.5 * global.Speed;

// Remove
if(global.Game == GAME.B)
&&(y > room_height + 64)
	instance_destroy(id, true);

// Animations
Anim_Tilt = ( (abs(Anim_Tilt) + Tilt_Speed) % 360) * Tilt_Direction;