diag_log "creategroup1.sqf activated!";

private
[
	"_grp"
];

_grp = createGroup east;

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn1", [], .7, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn1", [], .7, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn1", [], .7, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn1", [], .7, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn1", [], .7, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn1", [], .7, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcrpg", getMarkerPos "infspawn1", [], .7, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcrpg", getMarkerPos "infspawn1", [], .7, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcmg", getMarkerPos "infspawn1", [], .7, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

unit = _grp createUnit ["VTE_vcmg", getMarkerPos "infspawn1", [], .7, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];

[unit] join _grp;
_grp allowfleeing 0;

wp = _grp addWaypoint [getmarkerpos "destination1", 0];
[_grp, 0] setWaypointType "GUARD";

diag_log "creategroup1.sqf exited.";
