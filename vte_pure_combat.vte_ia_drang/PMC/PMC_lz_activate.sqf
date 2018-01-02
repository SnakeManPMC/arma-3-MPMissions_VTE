/*
on activation

this = ["PMC_blufor_start_4", pmc_lz_4, PMC_blufor_start_4] execVM "PMC\PMC_lz_activate.sqf";

*/
private
[
	"_GameLogic",
	"_mytext",
	"_Trigger",
	"_Marker"
];

_Marker = _this select 0;
_Trigger = _this select 1;
_GameLogic = _this select 2;

_GameLogic setPos getPosASL _Trigger;
_Marker setMarkerPosLocal getPosASL _Trigger;

_mytext = format ["%1 has been moved into the field.", _Marker];

hintSilent _mytext;
player sideChat _mytext;
