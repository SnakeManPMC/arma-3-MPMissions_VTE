/*

	It picks up the "PMC_lz_num" as location for the LZ we want to setup.

	It then moves respawn marker into this LZ so players wont have to walk.

*/

private ["_m","_markerobj","_pos","_r"];

_pos = _this select 0;

// the variable number of our LZ's.
PMC_lz_num = PMC_lz_num + 1;
publicVariable "PMC_lz_num";

diag_log format["PMC_lz_num: %1. _pos: %2. isServer: %3", PMC_lz_num, _pos, isServer];

// set respawn to this location
"respawn_west" setMarkerPos _pos;

// if we have setup 4 LZ's, we cant do more.
if (PMC_lz_num == 4) then
{
	1 setRadioMsg "Null";

	// set objective done and variable for it.
	PMC_objective_blufor1 setTaskState "succeeded";
	PMC_lz_done = true;
	publicVariable "PMC_lz_done";
}
else
{
	// change radio call name for it accordingly.
	_r = format["Setup LZ %1", (PMC_lz_num + 1)];
	1 setRadioMsg _r;
};

// create marker for this LZ
_m = format ["PMC_lz_%1", PMC_lz_num];
_markerobj = createMarkerLocal [_m, _pos];
_markerobj setMarkerShapeLocal "ELLIPSE";
_markerobj setMarkerBrushLocal "Solid";
_markerobj setMarkerColorLocal "ColorBlue";
_markerobj setMarkerSizeLocal [150, 150];

// Server side starts!
if (isServer) then
{
	// usaflag is the name of the flag pole
	[_pos, usaflag] execVM "PMC\PMC_lz_prepare_server.sqf";
}
