// Move
if(global.State != STATE.Paused)
	y += (2.5 * 2) * global.Speed; //(5.75 * 2) * global.Speed;

// Reset position
if(y > room_height+96)
	instance_destroy(id, true);
	
// Animations
Anim_Tilt = ( (abs(Anim_Tilt) + 2) % 360) * Tilt_Direction;
Anim_Scale = (Anim_Scale + .025) % 2;