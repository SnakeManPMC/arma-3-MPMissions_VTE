
private
[
	"_tmp"
];

// debug on/off
PMC_debug = true;
publicVariable "PMC_debug";

// variables for the flag changes
[] execVM "PMC\PMC_variables.sqf";

// markers to specific colors etc
[] execVM "PMC\PMC_markers.sqf";

PMC_groups = [];
PMC_targets =
[
	pole1,
	pole2,
	pole3,
	pole4,
	pole5,
	pole6,
	pole7,
	pole8,
	pole9,
	pole10,
	pole11,
	pole12,
	pole13,
	pole14,
	pole15,
	pole16,
	pole17,
	pole18,
	pole19,
	pole20,
	pole21,
	pole22,
	pole23
];

// lets add the editor placed group here.
PMC_groups = PMC_groups + [ vcinf1, vcinf2, vcinf3, vcinf4, vcinf5, vcinf6, vcinf7, vcinf8, usinf1, usinf2, usinf3, usinf4, usinf5, usinf6 ];
{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} forEach units vcinf1 + units vcinf2 + units vcinf3 + units vcinf4 + units vcinf5 + units vcinf6 + units vcinf7 + units vcinf8 + units usinf1 + units usinf2 + units usinf3 + units usinf4 + units usinf5 + units usinf6;

// some variables
PMC_killedNum = 0;
publicVariable "PMC_killedNum";

PMC_grpNum = 0;
publicVariable "PMC_grpNum";

PMC_NVA_Bases = 0;
publicVariable "PMC_NVA_Bases";

PMC_200KIAs = false;

// run body remove script
PMC_corpses = [];
[75] execVM "PMC\PMC_corpses.sqf";

PMC_InfTransport = 0;

// sleep so the trigger have time to activate.
//sleep 3;
waitUntil
{
	(!isNil {aiwest} && !isNil {aieast});
};
/*
if (PMC_debug) then
{
	hint format["aiwest: %1, aieast: %2, time: %3", count aiwest, count aieast, time];
};
*/
diag_log format["aiwest: %1, aieast: %2, time: %3", count aiwest, count aieast, time];

waitUntil { !isnil "bis_fnc_init" };

// create the NVA bases where assaults are launched.
_tmp = [] execVM "PMC\base-create.sqf";
waitUntil
{
	scriptDone _tmp;
};

// launch the main war!
[] execVM "PMC\war.sqf";
