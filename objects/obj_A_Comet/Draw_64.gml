if(!Destroyed){
	
	var _X = global.CameraX+x;
	var _Y = global.CameraY+y;

	// Trail
	draw_sprite_ext(spr_Comet, image_index, _X, _Y, -image_xscale, image_yscale, image_angle, global.Colors[COLOR.Accent], image_alpha);
	draw_sprite_ext(spr_Comet, image_index, _X, _Y, image_xscale, image_yscale, image_angle, global.Colors[COLOR.Accent], image_alpha);

	// Rocks
	draw_sprite_ext(spr_Asteroid, 0, _X, _Y, image_xscale, image_yscale, Anim_Tilt, global.Colors[COLOR.Elements], image_alpha);
}