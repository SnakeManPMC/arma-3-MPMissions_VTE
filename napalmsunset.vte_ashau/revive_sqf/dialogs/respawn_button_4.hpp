/*

RESPAWN AT BASE DIALOG

This script adds a button when the follow_camera activates that allows the player to respawn at base

© June 2007 - norrin (norrins_nook@iprimus.com.au) 
**********************************************************************************************************************************
respawn_button_4.hpp
*/

// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101


// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c

#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144
#define ST_WITH_RECT      160
#define ST_LINE           176

#define FontM             "Zeppelin32"

class Respawn_button_4 {
  idd = -1;
  movingEnable = true;
  controlsBackground[] = {};
  objects[] = { };
  controls[] = {Respawn_1, Respawn_2, Respawn_3, Respawn_4};   


	class Respawn_1 
	{
	idc = 1;
	type = CT_BUTTON;
	style = ST_CENTRE;
	default = false;
	font = FontM;
	sizeEx = 0.022;
	colorText[] = { 0, 0, 0, 1 };
	colorFocused[] = { 0.31, 0.31, 0.31, 0.31 };   
	colorDisabled[] = { 0, 0, 1, 0.7 };   
	colorBackground[] = { 1, 1, 1, 0.5 };
	colorBackgroundDisabled[] = { 1, 1, 1, 0.5 };   
	colorBackgroundActive[] = { 0.5, 0.5, 0.5, 0.5 };   
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorShadow[] = { 0, 0, 0, 0.5 };
	colorBorder[] = { 0.5, 0.5, 0.5, 0.5 };
	borderSize = 0;
	soundEnter[] = { "", 0, 1 };  
	soundPush[] = { "buttonpushed.ogg", 0.1, 1 };
	soundClick[] = { "", 0, 1 };  
	soundEscape[] = { "", 0, 1 };  
	x = 0.85; y = 0.65;
	w = 0.11; h = 0.04;
	text = "RESPAWN 1";
	action = "[1] execVM ""revive_sqf\respawn_at_base.sqf""";
	};

	class Respawn_2 
	{
	idc = 2;
	type = CT_BUTTON;
	style = ST_CENTRE;
	default = false;
	font = FontM;
	sizeEx = 0.022;
	colorText[] = { 0, 0, 0, 1 };
	colorFocused[] = { 0.31, 0.31, 0.31, 0.31 };   
	colorDisabled[] = { 0, 0, 1, 0.7 };   
	colorBackground[] = { 1, 1, 1, 0.5 };
	colorBackgroundDisabled[] = { 1, 1, 1, 0.5 };   
	colorBackgroundActive[] = { 0.5, 0.5, 0.5, 0.5 };   
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorShadow[] = { 0, 0, 0, 0.5 };
	colorBorder[] = { 0.5, 0.5, 0.5, 0.5 };
	borderSize = 0;
	soundEnter[] = { "", 0, 1 };  
	soundPush[] = { "buttonpushed.ogg", 0.1, 1 };
	soundClick[] = { "", 0, 1 };  
	soundEscape[] = { "", 0, 1 };  
	x = 0.85; y = 0.7;
	w = 0.11; h = 0.04;
	text = "RESPAWN 2";
	action = "[2] execVM ""revive_sqf\respawn_at_base.sqf""";

	};

	class Respawn_3 
	{
	idc = 3;
	type = CT_BUTTON;
	style = ST_CENTRE;
	default = false;
	font = FontM;
	sizeEx = 0.022;
	colorText[] = { 0, 0, 0, 1 };
	colorFocused[] = { 0.31, 0.31, 0.31, 0.31 };   
	colorDisabled[] = { 0, 0, 1, 0.7 };   
	colorBackground[] = { 1, 1, 1, 0.5 };
	colorBackgroundDisabled[] = { 1, 1, 1, 0.5 };   
	colorBackgroundActive[] = { 0.5, 0.5, 0.5, 0.5 };   
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorShadow[] = { 0, 0, 0, 0.5 };
	colorBorder[] = { 0.5, 0.5, 0.5, 0.5 };
	borderSize = 0;
	soundEnter[] = { "", 0, 1 };  
	soundPush[] = { "buttonpushed.ogg", 0.1, 1 };
	soundClick[] = { "", 0, 1 };  
	soundEscape[] = { "", 0, 1 };  
	x = 0.85; y = 0.75;
	w = 0.11; h = 0.04;
	text = "RESPAWN 3";
	action = "[3] execVM ""revive_sqf\respawn_at_base.sqf""";
	};
	
	class Respawn_4 
	{
	idc = 4;
	type = CT_BUTTON;
	style = ST_CENTRE;
	default = false;
	font = FontM;
	sizeEx = 0.022;
	colorText[] = { 0, 0, 0, 1 };
	colorFocused[] = { 0.31, 0.31, 0.31, 0.31 };   
	colorDisabled[] = { 0, 0, 1, 0.7 };   
	colorBackground[] = { 1, 1, 1, 0.5 };
	colorBackgroundDisabled[] = { 1, 1, 1, 0.5 };   
	colorBackgroundActive[] = { 0.5, 0.5, 0.5, 0.5 };   
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorShadow[] = { 0, 0, 0, 0.5 };
	colorBorder[] = { 0.5, 0.5, 0.5, 0.5 };
	borderSize = 0;
	soundEnter[] = { "", 0, 1 };  
	soundPush[] = { "buttonpushed.ogg", 0.1, 1 };
	soundClick[] = { "", 0, 1 };  
	soundEscape[] = { "", 0, 1 };  
	x = 0.85; y = 0.8;
	w = 0.11; h = 0.04;
	text = "RESPAWN 4";
	action = "[4] execVM ""revive_sqf\respawn_at_base.sqf""";
	};
};