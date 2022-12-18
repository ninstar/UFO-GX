// Generate debris
for(var _D = 0; _D < 6; ++_D)
	instance_create_depth((x-32) + random(64), (y-32) + random(64), 4, obj_A_Debris);

// Destroy
if(global.Game == GAME.B)
||(object_index == obj_A_Comet)
	instance_destroy(id, true);
else
	Destroyed = true;