/*
	gamelogics: pmc_zone_1 -> how many you got
*/

private
[
	"_a",
	"_p"
];

// choose new digit for the gamelogic "pmc_*"
_a = 1;
_p = missionNamespace getVariable [format ["pmc_zone_%1",_a], objNull];
PMC_zones = [];

// loop until we have no gamelogics left, it then should return 0.
while {((getPosASL _p) select 0) != 0} do
{
	// just make array out of the gamelogics
	PMC_zones = PMC_zones + [_p];

	// add one digit to our gamelogic name.
	_a = _a + 1;
	_p = missionNamespace getVariable [format ["pmc_zone_%1",_a], objNull];
};
