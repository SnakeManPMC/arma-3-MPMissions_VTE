/*
on deactivation

this = ["PMC_blufor_start_4", pmc_lz_4, PMC_blufor_start_4] execVM "PMC\PMC_lz_deactivate.sqf";

*/
private
[
	"_GameLogic",
	"_mytext",
	"_Marker"
];

_Marker = _this select 0;
_GameLogic = _this select 2;

_GameLogic setPos getPosASL pmc_blufor_start_1;
_Marker setMarkerPosLocal getPosASL pmc_blufor_start_1;

_mytext = format ["%1 has been moved back to base because location is not defended.", _Marker];

hintSilent _mytext;
player sideChat _mytext;
