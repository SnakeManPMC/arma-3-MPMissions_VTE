/*

	Created at 2021-08-03T08:16:21Z with Mission Converter v0.0.1 by PMC

*/
"respawn_west" setMarkerPosLocal getPosASL PMC_pleimeopen;
pmc_teleportPole setPos getPosASL PMC_pleimeopen;
["t33", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
