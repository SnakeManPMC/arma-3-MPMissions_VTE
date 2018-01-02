// choose random respawn location for enemy
private ["_respawnpoint"];
_respawnpoint = getPosASL (PMC_targets select floor random (count PMC_targets));
if (PMC_debug) then
{
	diag_log format["_respawnpoint: %1",_respawnpoint];
};
_respawnpoint;
