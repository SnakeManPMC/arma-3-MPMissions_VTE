
private ["_location","_maximumDistance","_weapons","_magazines"];
comment "Team Leader Group Respawn script (1.0) by Mongoose_84";

_location = getPosASL player;

_maximumDistance = 0;

_weapons =
[
"M16A2",
"M9"
];

_magazines =
[
"30Rnd_556x45_Stanag",
"30Rnd_556x45_Stanag",
"30Rnd_556x45_Stanag",
"30Rnd_556x45_Stanag",
"30Rnd_556x45_Stanag",
"30Rnd_556x45_Stanag",
"30Rnd_556x45_Stanag",
"30Rnd_556x45_Stanag",
"30Rnd_556x45_Stanag",
"30Rnd_556x45_Stanag",
"30Rnd_556x45_Stanag",
"30Rnd_556x45_Stanag",
"15Rnd_9x19_M9",
"15Rnd_9x19_M9",
"15Rnd_9x19_M9",
"15Rnd_9x19_M9",
"15Rnd_9x19_M9",
"15Rnd_9x19_M9",
"15Rnd_9x19_M9",
"15Rnd_9x19_M9"

];


waitUntil {alive player};



[_location, _maximumDistance, _weapons, _magazines] execVM "respawnPlayer.sqf";




