var _X = global.CameraX+x;
var _Y = global.CameraY+y;

// Battery
draw_sprite_ext(sprite_index, 0, _X, _Y, 1, 1, Anim_Tilt, global.Colors[COLOR.Elements], 1);
draw_sprite_ext(sprite_index, 1, _X, _Y, 1, 1, Anim_Tilt, global.Colors[COLOR.Accent], 1);

// Rings
draw_sprite_ext(sprite_index, 2, _X, _Y, -1 + Anim_Scale, 1, Anim_Tilt + 45, global.Colors[COLOR.Accent], 1);
draw_sprite_ext(sprite_index, 2, _X, _Y, 1, -1 + Anim_Scale, -Anim_Tilt + 45, global.Colors[COLOR.Accent], 1);