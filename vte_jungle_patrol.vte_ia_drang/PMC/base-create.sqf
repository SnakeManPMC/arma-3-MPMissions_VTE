/*

	Main NVA base creating

Create the base into random location chosen by the _PMC_OPFOR_Starts gamelogics.

*/

private
[
	"_A",
	"_barrels1b1",
	"_bx",
	"_by",
	"_c",
	"_dshk1b1",
	"_Eammo1b1",
	"_fireb1",
	"_fish",
	"_grp",
	"_mortar1b1",
	"_mortar1b2",
	"_PMC_OPFOR_Starts",
	"_pmcfish",
	"_poleb1",
	"_RanDistance",
	"_Rnd",
	"_shedb1",
	"_shedsmallb1",
	"_tentb1",
	"_tero",
	"_truckb1"
];

// NVA starting locations gamelogics.
_PMC_OPFOR_Starts =
[
	vc_start1,
	vc_start2,
	vc_start3,
	vc_start4,
	vc_start5,
	vc_start6,
	vc_start7,
	vc_start8,
	vc_start9,
	vc_start10,
	vc_start11,
	vc_start12,
	vc_start13
];

// random distance range from center of chosen base location
_RanDistance = 500;
_A = 0;

// this is how many bases we create
_c = 1 + floor random 3;

/*
if (PMC_debug) then
{
	hint format["base-create.sqf, _c: %1",_c];
};
*/
diag_log format["base-create.sqf, _c: %1",_c];

// array for the bases, pole object name is placed here.
NVA_Bases = [];

while {_A < _c} do
{
	_bx = 0;
	_by = 0;

	// randomly pick the base location
	_Rnd = 0;
	_Rnd = floor random (count _PMC_OPFOR_Starts);
	_pmcfish = _PMC_OPFOR_Starts select _Rnd;
	// remove the just chosen location
	_PMC_OPFOR_Starts = _PMC_OPFOR_Starts - [_PMC_OPFOR_Starts select _Rnd];

	// place the x,y coords actually on random range of _RanDistance
	_bx = ((getPosASL _pmcfish select 0) - (_RanDistance/2) + random _RanDistance);
	_by = ((getPosASL _pmcfish select 1) - (_RanDistance/2) + random _RanDistance);
	_fish = [_bx,_by];

	if (PMC_debug) then 
	{
		_tero = format ["basemk%1",_A];
		// changed these to LOCAL, maybe it breaks something? dunno
		_tero setMarkerPosLocal [_bx, _by, 0];
		_tero setMarkerTypeLocal "mil_flag";
		_tero setMarkerColorLocal "ColorRed";
	}
	else
	{
		// hide the debug markers
		"basemk0" setMarkerTypeLocal "empty";
		"basemk1" setMarkerTypeLocal "empty";
		"basemk2" setMarkerTypeLocal "empty";
		"basemk3" setMarkerTypeLocal "empty";
	};

	// flag pole center of base (why is this VC and not NVA?)
	_poleb1 = "VTE_flagcarrier_vc" createVehicle [_bx,_by];

	// bases are identified by the flag pole in the center
	NVA_Bases = NVA_Bases + [_poleb1];
	// increment one base to our global / public variable.
	PMC_NVA_Bases = PMC_NVA_Bases + 1;
	publicVariable "PMC_NVA_Bases";

	// camp fire burning
	_fireb1 = "land_vte_vilfire1" createVehicle [_bx+5,_by];
	_fireb1 inFlame true;
	_fireb1 setDir random 360;

	// tents
	_tentb1 = "Land_VTE_UStent_small" createVehicle [_bx+10,_by+10];
	_tentb1 setDir random 360;

	// ammo boxes
	_Eammo1b1 = "VTE_AmmoBoxNVA" createVehicle [_bx,_by+10];
	_Eammo1b1 setDir random 360;
	_Eammo1b1 setVelocity [0,0,10];

	// sheds
	_shedb1 = "Land_VTE_vilbasket1" createVehicle [_bx-20,_by];
	_shedb1 setDir random 360;
	_shedsmallb1 = "Land_VTE_vilbasket1" createVehicle [_bx,_by-10];
	_shedsmallb1 setDir random 360;

	// barrels stuff
	_barrels1b1 = "Land_VTE_vilbasket1" createVehicle [_bx-20,_by];
	_barrels1b1 setDir random 360;
	_barrels1b1 setVelocity [0,0,1];

	// 60mm mortar pits and D30 artillery for NVA base camp
/*
THERE ARE TO BE REPLACED WITH THE VTE MORTARS WHEN THEY ARE READY TO BE USED!
*/
	_mortar1b1 = "VTE_82mm_mortar_nva" createVehicle [_bx+10,_by+25];
	_mortar1b1 setdir random 360;
	_mortar1b2 = "VTE_82mm_mortar_nva" createVehicle [_bx-10,_by-25];
	_mortar1b2 setdir random 360;
	_mortar1b3 = "VTE_82mm_mortar_nva" createVehicle [_bx-25,_by-35];
	_mortar1b3 setdir random 360;
	_mortar1b4 = "VTE_82mm_mortar_nva" createVehicle [_bx+25,_by+35];
	_mortar1b4 setdir random 360;

	// dshk machine guns NVA base camp
	_dshk1b1 = "VTE_dshkm" createVehicle [_bx+15,_by+35];
	_dshk1b1 setDir 0;

	// a truck
	_truckb1 = "VTE_nvatruck" createVehicle [_bx - random 50 + random 100,_by - random 50 + random 100];
	_truckb1 setDir random 360;
	_truckb1 setVelocity [0,0,1];

	// a group to defend the base!
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	// these are the guns, mortars and arty
	"VTE_NVAsoldier" createUnit [_fish, _grp, "baseguy1 = this", 1, "SERGEANT"];
	baseguy1 moveInGunner _mortar1b1;
	"VTE_NVAsoldier" createUnit [_fish, _grp, "baseguy2 = this", 1, "CORPORAL"];
	baseguy2 moveInGunner _mortar1b2;
	"VTE_NVAsoldier" createUnit [_fish, _grp, "baseguy3 = this", 1, "CORPORAL"];
	baseguy3 moveInGunner _dshk1b1;
	"VTE_NVAsoldier" createUnit [_fish, _grp, "baseguy4 = this", 1, "PRIVATE"];
	baseguy4 moveInGunner _mortar1b3;
	"VTE_nvacrew" createUnit [_fish, _grp, "baseguy5 = this", 1, "PRIVATE"];
	baseguy5 moveInGunner _mortar1b4;

	// additional troops
	"VTE_NVArto" createUnit [_fish, _grp, "", 0.3, "PRIVATE"];
	"VTE_NVAmedic" createUnit [_fish, _grp, "", 0.3, "PRIVATE"];
	"VTE_NVArpg" createUnit [_fish, _grp, "", 0.3, "PRIVATE"];
	"VTE_NVAat" createUnit [_fish, _grp, "", 0.3, "PRIVATE"];
	"VTE_NVAmg" createUnit [_fish, _grp, "", 1, "PRIVATE"];
	"VTE_NVAmg" createUnit [_fish, _grp, "", 1, "PRIVATE"];
	"VTE_NVAsoldier" createUnit [_fish, _grp, "", 0, "PRIVATE"];
	"VTE_NVAsoldier" createUnit [_fish, _grp, "", 0, "PRIVATE"];

	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;

	// set this group for deletion.
	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	_grp setBehaviour "SAFE";
	_grp setCombatMode "YELLOW";
	_grp setSpeedMode "LIMITED";
	_grp setFormation "WEDGE";

	/*
	if (PMC_debug) then
	{
		player sideChat format["base created to: %1",_fish];
	};
	*/
	diag_log format["base-create.sqf: base created to: %1",_fish];

	// we created one base
	_A = _A + 1;
};
