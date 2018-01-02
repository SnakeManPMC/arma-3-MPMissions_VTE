comment "Team Leader Group Respawn script (1.0) by Mongoose_84/Modified by ANZAC SAS  to 'eject' ai on a dedicated server";

_location = getPosASL player;
_maximumDistance = 0;

_magazines =['VTE_20Rnd_556x45','VTE_20Rnd_556x45',
'VTE_20Rnd_556x45','VTE_20Rnd_556x45',
'VTE_20Rnd_556x45','VTE_20Rnd_556x45',
'VTE_20Rnd_556x45','VTE_20Rnd_556x45',
'vte_grenadered','vte_grenadeGREEN',
'handGrenade_West','handGrenade_West',
'VTE_7Rnd_1911','VTE_7Rnd_1911',
'VTE_7Rnd_1911','VTE_7Rnd_1911',
'VTE_7Rnd_1911','VTE_7Rnd_1911',
'VTE_7Rnd_1911','VTE_7Rnd_1911'];
_weapons =['VTE_m16a1','binocular','VTE_M1911'];
waitUntil {alive player};
[_location, _maximumDistance, _weapons, _magazines] execVM 'respawnPlayer.sqf';




