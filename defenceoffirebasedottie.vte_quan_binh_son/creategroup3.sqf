diag_log "creategroup3.sqf activated!";

private
[
	"_grp"
];

_grp = createGroup east;

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn3", [], .8, "none"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn3", [], .8, "none"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn3", [], .8, "none"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn3", [], .8, "none"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn3", [], .8, "none"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn3", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn3", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn3", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn3", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn3", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn3", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcrpg", getMarkerPos "infspawn3", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcrpg", getMarkerPos "infspawn3", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcrpg", getMarkerPos "infspawn3", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

[unit] join _grp;
_grp allowfleeing 0;

wp = _grp addWaypoint [getmarkerpos "destination3", 0];
[_grp, 0] setWaypointType "GUARD";

diag_log "creategroup3.sqf exited.";
