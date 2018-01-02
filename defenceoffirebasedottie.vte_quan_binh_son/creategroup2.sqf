diag_log "creategroup2.sqf activated!";

private
[
	"_grp"
];

_grp = createGroup east;

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcsoldier3", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcrpg", getMarkerPos "infspawn2", [], .8, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcmg", getMarkerPos "infspawn2", [], .7, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

unit = _grp createUnit ["VTE_vcmg", getMarkerPos "infspawn2", [], .7, "form"];
unit addEventHandler ['killed', {handle = [_this select 0] execVM 'bury.sqf'}];
unit setunitpos "up";

[unit] join _grp;
_grp allowfleeing 0;

wp = _grp addWaypoint [getmarkerpos "destination2", 0];
[_grp, 0] setWaypointType "GUARD";

diag_log "creategroup2.sqf exited.";
