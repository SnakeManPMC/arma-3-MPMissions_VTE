
private ["_newPos","_safePos"];

waitUntil { !isnil "bis_fnc_init" };

// place player in random pos
_newPos = (PMC_loc select random (count PMC_loc));

_safePos = [_newPos, 0, 100, 10, 0, 20, 0] call BIS_fnc_findSafePos;

player setPos _safePos;
