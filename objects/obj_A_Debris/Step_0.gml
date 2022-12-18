// Move
if(global.State == STATE.Playing)
	y += 6.5 * global.Speed;

// Animations
var _Dir = 1;
if(hspeed < 0)
	_Dir = -1;
image_angle = ( ( abs(image_angle) + max(abs(hspeed), abs(vspeed)) ) % 360) * _Dir;

// Destroy
if(y > room_height+16)||(y < -16)
||(x > room_width+16)||(x < -16)
	instance_destroy(id, true);