/*

	Village terror script, to create new VC units everytime they
	enter a new village. If group size reaches 12 men, they attack
	the US base.
*/

private ["_dudes","_PMC_BaseAssault","_pos","_vcleader", "_mike"];

// marker name
_pos = _this select 0;

// array of units there, does this also include the villagers?
_dudes = _this select 1;

// pick their learder, but again, can it be villager, or even player?
_vcleader = _dudes select 0;

_PMC_BaseAssault =
{
	/*
	here we make the bastards attack US Army base ;)
	pmcmk_16 marines base
	pmcmk_18 army base
	*/
	
private ["_USbases","_vctargets","_targetpoint","_grp","_vcleader"];
_USbases =
	[
		"pmcmk_16",
		"pmcmk_18"
	];

	_vctargets = _USbases select floor (random count _USbases);
	_targetpoint = getMarkerPos _vctargets;
        _vcleader = _this select 0;

/*
doesnt work on dedicated server, sorry.
	if (PMC_debug) then
	{
		hint format["assaauuult!\n\nVC will now attack %1 base!",_targetpoint];
	};
*/

	_grp = group _vcleader;
	_grp setBehaviour "AWARE";
	_grp setCombatMode "YELLOW";
	_grp setSpeedMode "FULL";
	_grp setFormation "LINE";

	{
		_x allowfleeing 0;
	} forEach units _grp;

	// waypoints, we add couple to make patrol area
	// first
	_grp addWaypoint [_targetpoint, 200];
	[_grp, 1] setWaypointBehaviour "AWARE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "FULL";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "SAD";

	// cycle
	_grp addWaypoint [_targetpoint, 0];
	[_grp, 2] setWaypointType "CYCLE";
};


/*

	Start of the main script body

*/
/*
doesnt work on dedicated server, sorry.
if (PMC_debug) then
{
	hint format["VILLAGE TERROR!\nsquad: %1\nunits: %2",_vcleader,(count units group _vcleader)];
};
*/

// if we have too much units, exit
if (count units group _vcleader > 11) then
{
	// call the base assault and then exit
	[_vcleader] call _PMC_BaseAssault;
	diag_log "vc_village_terror.sqf called for _PMC_BaseAssault;";
	if (true) exitWith {};
};

// if we have any of the NVA guys, lets not make VC into them
if (typeOf leader _vcleader == "VTE_nvaofficer") exitWith{};
if (typeOf leader _vcleader == "VTE_nvaaa") exitWith{};
if (typeOf leader _vcleader == "VTE_nvacrew") exitWith{};
if (typeOf leader _vcleader == "VTE_nvaengineer") exitWith{};
if (typeOf leader _vcleader == "VTE_nvamg") exitWith{};
if (typeOf leader _vcleader == "VTE_nvamedic") exitWith{};
if (typeOf leader _vcleader == "VTE_NVAofficer") exitWith{};
if (typeOf leader _vcleader == "VTE_nvarecon") exitWith{};
if (typeOf leader _vcleader == "VTE_nvareconrto") exitWith{};
if (typeOf leader _vcleader == "VTE_NVAsoldier") exitWith{};
if (typeOf leader _vcleader == "VTE_nvarpg") exitWith{};
if (typeOf leader _vcleader == "VTE_nvaat") exitWith{};
if (typeOf leader _vcleader == "VTE_nvarto") exitWith{};
if (typeOf leader _vcleader == "VTE_nvasapper") exitWith{};
if (typeOf leader _vcleader == "VTE_nvasoldier") exitWith{};
if (typeOf leader _vcleader == "VTE_nvamark") exitWith{};

// okay so we have VC squad inbound, lets create one more guy to them
_mike = group _vcleader createUnit ["VTE_vcsoldier", getPosASL _vcleader, [], 0, "FORM"];
_mike addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

//_unit = group player createUnit ["SoldierWB", Position player, [], 0, "FORM"] 

PMC_opfor = PMC_opfor + 1;
publicVariable "PMC_opfor";

diag_log format
[
	"vc_village_terror.sqf created one VC. count group: %1, _pos: %2, _dudes: %3",
	(count units group _vcleader),
	_pos,
	_dudes
];

/*
doesnt work on dedicated server, sorry.
if (PMC_debug) then
{
	_vcleader globalChat "we have just created another brave soldier! die usa!";
};
*/
