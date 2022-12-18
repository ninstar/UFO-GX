// Rocks
if(!Destroyed){
	
	var _X = global.CameraX+x;
	var _Y = global.CameraY+y;
	
	draw_sprite_ext(spr_Asteroid, image_index, _X, _Y, image_xscale, image_yscale, Anim_Tilt, global.Colors[COLOR.Elements], image_alpha);
}