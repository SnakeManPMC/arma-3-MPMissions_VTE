/*

	Take vehicle as parameter, fly it to bottom right corner of the map, then delete him and the crew.

Syntax:
[vehicle] execVM "PMC\PMC_vehicle_graveyard.sqf";

Requires:
PMC_InfTransportUsed variable

Returns:
-

*/

private
[
	"_vcl"
];

_vcl = _this select 0;

diag_log format ["PMC_vehicle_graveyard.sqf _vcl: %1", _vcl];

// umm this was bottom right corner, right? :)
_vcl move [12800, 0, 0];

sleep 5;

waitUntil
{
	// is ready or dead or cant move
	(unitReady _vcl || !alive _vcl || !canMove _vcl);
};

diag_log format ["PMC_vehicle_graveyard wait done, _vcl: %1, unitReady: %2, alive: %3, canMove: %4, speed: %5", _vcl, unitReady _vcl, alive _vcl, canMove _vcl, speed _vcl];

// if shes still flying, lets wait until she comes to almost a stop
if (speed _vcl > 5) then
{
	waitUntil
	{
		(speed _vcl < 2);
	};
	diag_log format ["PMC_vehicle_graveyard speed was >5, now exited, _vcl: %1, unitReady: %2, alive: %3, canMove: %4, speed: %5", _vcl, unitReady _vcl, alive _vcl, canMove _vcl, speed _vcl];
};

// delete crew first
{
	deleteVehicle _x;
} forEach (crew vehicle _vcl);

// vehicle itself
deleteVehicle _vcl;
