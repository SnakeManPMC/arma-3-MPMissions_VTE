/*

	PMC Create Zones according to gamelogicks

Syntax:
[] execVM "PMC\PMC_Create_Zones.sqf";

Requires:
PMC_zones[]

Returns:
-

reference: PMC_objectivesALL.sqf from real war's

*/

private ["_a","_m","_markerobj","_PMC_t","_targetpoint","_tlogic","_triggerArea","_triggerTimeout","_z"];

// small check that we are coordinated with server
waitUntil
{
	(!isNil "PMC_zones");
};

// create objectives
_PMC_t = [];
_PMC_t = PMC_zones;
_a = 0;
_triggerArea = _this select 0;
_triggerTimeout = _this select 1;

while { _a < (count PMC_zones) } do
{
	_tlogic = (_PMC_t select _a);
	_targetpoint = getPosASL _tlogic;

// marker zone area
	_m = format ["PMC_zone_%1", _a];
	_markerobj = createMarkerLocal [_m, _targetpoint];
	_markerobj setMarkerShapeLocal "RECTANGLE";
	_markerobj setMarkerColorLocal "ColorBlack"; // or "ColorWhite"
	_markerobj setMarkerBrushLocal "Solid";
	_markerobj setMarkerSizeLocal [_triggerArea, _triggerArea];

// marker zone label
	_m = format ["PMC_zonename_%1", _a];
	_markerobj = createMarkerLocal [_m, _targetpoint];
	_markerobj setMarkerTypeLocal "mil_box";
	_markerobj setMarkerColorLocal "ColorBlack";
	_markerobj setMarkerTextLocal format ["Zone %1", _a];

// triggers
	// BLUFOR
	_z = createTrigger ["EmptyDetector", _targetpoint];
	_z setTriggerActivation ["WEST SEIZED", "PRESENT", true];
	_z setTriggerArea [_triggerArea, _triggerArea, 0, true];
	_z setTriggerTimeout [0, (_triggerTimeout/2), _triggerTimeout, false];
	_z setTriggerStatements ["this", format ["this = ['pmc_zone_%1', 'BLUFOR'] execVM 'PMC\PMC_sector_seized.sqf';", _a], ""];

	// OPFOR
	_z = createTrigger ["EmptyDetector", _targetpoint];
	_z setTriggerActivation ["EAST SEIZED", "PRESENT", true];
	_z setTriggerArea [_triggerArea, _triggerArea, 0, true];
	_z setTriggerTimeout [0, (_triggerTimeout/2), _triggerTimeout, false];
	_z setTriggerStatements ["this", format ["this = ['pmc_zone_%1', 'OPFOR'] execVM 'PMC\PMC_sector_seized.sqf';", _a], ""];

	_a = _a + 1;
};
