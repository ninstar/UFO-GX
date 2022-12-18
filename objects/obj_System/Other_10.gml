/// @description Colors

// Convert RRGGBB to BBGGRR
var _RRGGBB = function(hex){
	
	return (hex & $FF) << 16 | (hex & $FF00) | (hex & $FF0000) >> 16;
}

// Change palette
var _ColA, _ColB, _ColC;
switch(Palette){
	
	case(1):	_ColA = _RRGGBB($FFFFFF);	_ColB = _RRGGBB($8CF443);	_ColC = _RRGGBB($21222C);	break;	// Code
	case(2):	_ColA = _RRGGBB($FFFFFF);	_ColB = _RRGGBB($7B8210);	_ColC = _RRGGBB($1E312B);	break;	// DMG
	case(3):	_ColA = _RRGGBB($FFFFFF);	_ColB = _RRGGBB($C6CBA5);	_ColC = _RRGGBB($181818);	break;	// Pocket
	case(4):	_ColA = _RRGGBB($FFFFFF);	_ColB = _RRGGBB($00BE8D);	_ColC = _RRGGBB($17372D);	break;	// Light
	case(5):	_ColA = _RRGGBB($FFFFFF);	_ColB = _RRGGBB($9FEEFF);	_ColC = _RRGGBB($175395);	break;	// Winter
	case(6):	_ColA = _RRGGBB($FFFFFF);	_ColB = _RRGGBB($A9C1FF);	_ColC = _RRGGBB($7D198B);	break;	// Spring
	case(7):	_ColA = _RRGGBB($FFFFFF);	_ColB = _RRGGBB($F5FF85);	_ColC = _RRGGBB($9F3D1F);	break;	// Summer
	case(8):	_ColA = _RRGGBB($FFFFFF);	_ColB = _RRGGBB($FFDA78);	_ColC = _RRGGBB($7A221F);	break;	// Autumn
	default:	_ColA = _RRGGBB($FA1E4E);	_ColB = _RRGGBB($F7F6FF);	_ColC = _RRGGBB($120D21);	break;	// GX
}

// Apply colors
global.Colors[COLOR.Accent] = _ColA;
global.Colors[COLOR.Elements] = _ColB;
global.Colors[COLOR.Background] = _ColC;


obj_Background.Color_Stars = merge_color(_ColA, _ColC, .75);

window_set_color(global.Colors[COLOR.Background]);