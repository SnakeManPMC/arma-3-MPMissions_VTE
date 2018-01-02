/*
        PMC_Objectives.sqf      v 0.4
 
        Briefing.html objectives!
 
                "1" ObjStatus!
 
 
        Run this on all machines using
 
                [] execVM "PMC\PMC_Objectives.sqf"
 
        from the init.sqf
*/
 
private [
	"_m", "_markerobj", "_z", "_targetNum", "_a", "_ObjCount", "_ran",
	"_tlogic", "_targetNum", "_targetpoint", "_PMC_t", "_MaxObjectives",
	"_exit"
];
 
if (isNil "PMC_NumObjectives") then
{
        PMC_NumObjectives = 0;
        "PMC_NumObjectives" addPublicVariableEventhandler
	{
                _this call compile preprocessFileLineNumbers "PMC\PMC_Objectives.sqf";
        };
};

if (isNil "PMC_Objectives") then
{
        PMC_Objectives = [];
        "PMC_Objectives" addPublicVariableEventHandler
	{
                _this call compile preprocessFileLineNumbers "PMC\PMC_Objectives.sqf";
        };
};

// PMC_Objectives_Init tells us if we've set the objStatus and PMC_opfordead<N>
// values to their initial values or not
if (isNil "PMC_Objectives_Init") then
{
        PMC_Objectives_Init = false;
};

// Have the objective triggers and markers been created yet?
if (isNil "PMC_Objectives_Created") then
{
        PMC_Objectives_Created = false;
};
 
/* 
If the script is called with an empty parameter array, the mission is just
starting and we'll exit on clients after having set up the global vars
above. (The server will continue and randomise a few objectives)
*/
if ((count _this == 0) && !isServer) exitWith {};
 
_PMC_CreateObjective =
{
        private [ "_a", "_targetpoint", "_m", "_markerobj", "_z" ];
        
        _a = _this select 0;
        _targetpoint = _this select 1;
        
        _m = format ["PMC_marker_%1", _a];
        _markerobj = createMarkerLocal [_m, _targetpoint];
        _markerobj setMarkerShapeLocal "ELLIPSE";
        _markerobj setMarkerColorLocal "ColorRed";
        _markerobj setMarkerBrushLocal "Solid";
        _markerobj setMarkerSizeLocal [200, 200];
        
        _z = createTrigger ["EmptyDetector", _targetpoint];
        _z setTriggerActivation ["WEST", "PRESENT", false];
        _z setTriggerArea [100, 100, 0, true];
        _z setTriggerStatements ["this", format ["hint 'PMC_Marker_%1: objective completed'; '%1' objStatus 'DONE'; 'PMC_Marker_%1' setMarkerColorLocal 'ColorGreen'; 'PMC_Marker_%1' setMarkerTypeLocal 'Dot'; PMC_opfordead%1=true; player sideChat 'Objective %1 completed. Over.'",_a], ""];
};
 
/*
If this script is called with two parameter, we're being called from one of
the PV event handlers
*/
_exit = false;
if (count _this == 2) then
{
        _name = _this select 0;
        switch (_name) do
	{
                case "PMC_NumObjectives":
                {
                        _ObjCount = _this select 1;
                };

                case "PMC_Objectives":
                {
                        if !(PMC_Objectives_Created) then
			{
                                {
					_ call _PMC_CreateObjective;
				} forEach  (_this select 1);
                                PMC_Objectives_Created = true;
                        };
                        _exit = true;
                };

                default
		{
                        if (PMC_debug) then
			{
                                player sidechat "Uh oh, this should not happen";
                        };
                        _exit = true;
                };
        };
};
if (_exit) exitWith {};
 
// Initial server-side objectives randomisation
if (isServer) then
{
        // create 1 to _MaxObjectives objectives randomly
        _PMC_t = [];
        _PMC_t = +PMC_targets;
        _targetNum = count _PMC_t;
        // max objectives to create
        _MaxObjectives = 5;
        _a = 0;
        _ObjCount = round (random _MaxObjectives);
        
        // stupid check
        if (_ObjCount == 0) then
        {
                if (PMC_debug) then { player sidechat "_objcount was zero..."; };
                _ObjCount = 1;
        };
        // Send the number of objectives to all clients
        PMC_NumObjectives = _ObjCount;
        publicVariable "PMC_NumObjectives";
        while { _a < _ObjCount || _a < (count _PMC_t) } do
        {
                _a = _a + 1;
                
                // choose random posit, then remove it from selection so next time
                // we choose different random posit, no two units go in same location.
                _ran = (floor random _targetNum);
                _tlogic = (_PMC_t select _ran);
                _PMC_t = _PMC_t - [_tlogic];
                _targetNum = _targetNum - 1;
                _targetpoint = getPosASL _tlogic;
                
                // Build an array of objectives data
                PMC_Objectives = PMC_Objectives + [[_a, _targetpoint]];
        };
        // PV the list of objectives so the clients can set them up
        publicVariable "PMC_Objectives";
        // Set up the objective trigger and markers on the server aswell.
        // (it won't recieve the PV event since it's the one who sends it)
        {
		_x call _PMC_CreateObjective;
	} forEach PMC_Objectives;
        PMC_Objectives_Created = true;
        
        {
                _targetpoint = _x select 1;
                // create some defenses and enemy stuff
                _handle = [_targetpoint] execVM "PMC\PMC_objective_def_OPFOR.sqf";
                // wait until its done (so we dont overwhelm the server etc).
                waitUntil {scriptDone _handle};
                
                // create random civilians and crap into the objective.
                _handle = [_targetpoint] execVM "PMC\PMC_objective_civilians.sqf";
                // wait until its done (so we dont overwhelm the server etc).
                waitUntil {scriptDone _handle};
        } forEach PMC_Objectives;
};
 
if (PMC_Objectives_Init) exitWith {};
PMC_Objectives_Init = true;
 
// only 1 obective, shutdown others from briefing etc.
if (_ObjCount == 1) then
{
        "2" objStatus "HIDDEN";
        PMC_opfordead2 = true;
        "3" objStatus "HIDDEN";
        PMC_opfordead3 = true;
        "4" objStatus "HIDDEN";
        PMC_opfordead4 = true;
        "5" objStatus "HIDDEN";
        PMC_opfordead5 = true;
};
 
// 2 objectives
if (_ObjCount == 2) then
{
        "3" objStatus "HIDDEN";
        PMC_opfordead3 = true;
        "4" objStatus "HIDDEN";
        PMC_opfordead4 = true;
        "5" objStatus "HIDDEN";
        PMC_opfordead5 = true;
};
 
// 3 objectives
if (_ObjCount == 3) then
{
        "4" objStatus "HIDDEN";
        PMC_opfordead4 = true;
        "5" objStatus "HIDDEN";
        PMC_opfordead5 = true;
};
 
// 4 objectives
if (_ObjCount == 4) then
{
        "5" objStatus "HIDDEN";
        PMC_opfordead5 = true;
};
