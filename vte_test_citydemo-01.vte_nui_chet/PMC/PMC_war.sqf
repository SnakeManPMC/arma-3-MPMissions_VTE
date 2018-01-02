
// if we run this on client, exit immediately.
if (!isServer) exitWith{};

private ["_respawnpoint","_MakeGuardOPFOR","_tmp","_targetNum","_targetpoint"];

// run killed script, 300 corpses max on the battlefield.
// this needs to be global??
PMC_corpses=[];
[50] execVM "PMC\PMC_corpses.sqf";

// we are running the scripts, just some debug stuff which should be removed.
PMC_running=1;
publicVariable "PMC_running";

PMC_debug = true;
PMC_opfor=0;
PMC_targets=[];
_targetpoint = getPosASL racsflag;

_MakeGuardOPFOR = compile preprocessFileLineNumbers "PMC\PMC_MakeGuardOPFOR.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Select_Target.sqf";

_tmp = [] execVM "PMC\PMC_targets.sqf";
waitUntil
{
	scriptDone _tmp;
};

_targetNum = count PMC_targets;

// small wait to let the trigger initialize?
waitUntil
{
	sleep 0.1;
	(count (list opforunits) > 0);
};

// create units
while { (PMC_opfor < 200) } do
{
        _respawnpoint = getPosASL call PMC_Select_Target;
        _targetpoint = getPosASL racsflag;
        
	waitUntil
	{
		sleep 3;
		(count list opforunits < 50);
	};

	if (count list opforunits < 50) then 
	{
		[_respawnpoint, _targetpoint] call _MakeGuardOPFOR;
		PMC_opfor=PMC_opfor+9;
		publicVariable "PMC_opfor";
	};
	sleep 5;
};

PMC_mcomplete=true;
publicVariable "PMC_mcomplete";
