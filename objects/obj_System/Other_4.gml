/// @description Add background

// Create
Background_Layer = layer_create(10000);
Background_Element = layer_background_create(Background_Layer, spr_Background);

// Modify
layer_background_stretch(Background_Element, true);
layer_background_blend(Background_Element, global.Colors[COLOR.Background]);

// Hide quit button
Show_Quit = false;