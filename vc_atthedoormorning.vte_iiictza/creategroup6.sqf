
if (!(local server)) exitWith {};

center = createCenter east;
EAST setFriend[WEST,0];
private _grp = createGroup east;

private _unit = _grp createUnit ["VTE_NVAsoldier", getMarkerPos "infspawn6", [], .3, "form"];
_unit = _grp createUnit ["VTE_NVAsoldier", getMarkerPos "infspawn6", [], .3, "form"];
_unit = _grp createUnit ["VTE_NVAsoldier", getMarkerPos "infspawn6", [], .3, "form"];
_unit = _grp createUnit ["VTE_NVAsoldier", getMarkerPos "infspawn6", [], .3, "form"];
_unit = _grp createUnit ["VTE_NVAsoldier", getMarkerPos "infspawn6", [], .3, "form"];
_unit = _grp createUnit ["VTE_NVAsoldier", getMarkerPos "infspawn6", [], .3, "form"];
_unit = _grp createUnit ["VTE_NVAsoldier", getMarkerPos "infspawn6", [], .3, "form"];
_unit = _grp createUnit ["RU_Soldier_MG", getMarkerPos "infspawn6", [], .3, "form"];
_unit = _grp createUnit ["RU_Soldier_MG", getMarkerPos "infspawn6", [], .3, "form"];
_unit = _grp createUnit ["RU_Soldier_MG", getMarkerPos "infspawn6", [], .3, "form"];

private _trig=createTrigger ["EmptyDetector",getmarkerpos "infspawn2"];
_trig setTriggerArea[1000,1000,0,false];
_trig setTriggerActivation ["group member","MEMBER", false];
_trig setTriggerStatements ["this","this exec 'creategroup2.sqs'", ""];
_trig triggerAttachVehicle [_unit];

[_unit] join _grp ;
_grp allowfleeing 0;

_grp addWaypoint [getMarkerPos "destination6", 0];
