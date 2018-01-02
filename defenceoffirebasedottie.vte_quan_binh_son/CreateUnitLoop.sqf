
private
[
	"_create1",
	"_create2",
	"_create3"
];
diag_log "CreateUnitLoop.sqf executed.";

center = createCenter east;
EAST setFriend [WEST, 0];

/*
// this script was made from the hopeless triggers in mission editor

// first trigger batch - 30sec
sleep 30;

[] execVM "creategroup2.sqf";
//60;
sleep 30;

[] execVM "creategroup3.sqf";
//70;
sleep 10;

[] execVM "creategroup1.sqf";

// second trigger batch - 600sec
sleep 530;
[] execVM "creategroup2.sqf";

sleep 20;
[] execVM "creategroup1.sqf";

sleep 60;
[] execVM "creategroup3.sqf";

// third trigger batch - 1300sec
sleep 620;
[] execVM "creategroup2.sqf";

sleep 30;
[] execVM "creategroup2.sqf";

sleep 60;
[] execVM "creategroup3.sqf";

// fourth trigger batch - 1350sec
[] execVM "creategroup1.sqf";
[] execVM "creategroup2.sqf";
[] execVM "creategroup3.sqf";

// that's the timeline how I interpret the original horrific triggers :) Snake Man, PMC.
*/

/*
ok the new idea here is that we simply create these enemy groups until the mission ends one way
or the other, this method works nicely unless the enemies stack up somewhere (which they shoudn't do).
*/
_create1 = compile preprocessFileLineNumbers "creategroup1.sqf";
_create2 = compile preprocessFileLineNumbers "creategroup2.sqf";
_create3 = compile preprocessFileLineNumbers "creategroup3.sqf";

// initial wait before they attack
sleep 30;

while {true} do
{
	call _create1;
	sleep 3;
	call _create2;
	sleep 3;
	call _create3;

	sleep 180;
};
