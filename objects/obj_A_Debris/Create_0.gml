image_speed = 0;
image_index = round(random(4));

Tilt_Direction = choose(-1, 1);
Tilt_Speed = .25 + random(2);

hspeed = ( (1 + random(4)) * (global.Speed+1) ) * choose(-1, 1);
vspeed = ( (1 + random(4)) * (global.Speed+1) ) * choose(-1, 1);