private ["_ran","_tlogic","_respawnpoint"];
// select one starting point
_ran = (floor random (count PMC_opfor_starts));
_tlogic = (PMC_opfor_starts select _ran);
_respawnpoint = [(getPosASL _tlogic select 0)-50+random 100,(getPosASL _tlogic select 1)-50+random 100];

// place the value to be returned like this at the end in function!
_respawnpoint
