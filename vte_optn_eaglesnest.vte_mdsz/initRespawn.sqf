comment "Team Leader Group Respawn script (1.0) by Mongoose_84";

_location = getPos player;

_maximumDistance = 0;

_weapons =
[
'VTE_XM177E'
];

_magazines =
[
'VTE_20Rnd_556x45_Stanag',
'VTE_20Rnd_556x45_Stanag',
'VTE_20Rnd_556x45_Stanag',
'VTE_20Rnd_556x45_Stanag',
'VTE_20Rnd_556x45_Stanag',
'VTE_20Rnd_556x45_Stanag',
'VTE_20Rnd_556x45_Stanag',
'vte_grenadered',
'vte_grenadeGREEN',
'HandGrenade',
'HandGrenade'
];


waitUntil {alive player};



[_location, _maximumDistance, _weapons, _magazines] execVM 'respawnPlayer.sqf';




