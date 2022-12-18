/// @description Remove background
if(layer_background_exists(Background_Layer, Background_Element))
	layer_background_destroy(Background_Element);

if(layer_exists(Background_Layer))
	layer_destroy(Background_Layer);

// Hide instructions
Show_Instructions = false;
Show_Guides = false;