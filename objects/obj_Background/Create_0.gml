var _I;

// Stars
for(_I = 0; _I < 64; ++_I){
	
	Stars[_I] = {
	
		X : floor(random(room_width)),
		Y : floor(random(room_height)),
		Size : floor(random(4)),
	}
}

// Planets
for(_I = 0; _I < 2; ++_I){
	
	Planets[_I] = {

		X : 64 + round(random(room_width - (64*2))),
		Y : -room_height * (_I+1),
		Type : floor(random(4)),
	}
}

// Globe
Globe = {

	Tilt : 0,
	X : canvas_gui_w * .5,
	Y : room_height,
}

Color_Stars = c_white;