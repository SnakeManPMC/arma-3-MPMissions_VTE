
if (!(local server)) exitWith {};

center = createCenter east;
EAST setFriend[WEST,0];
private _grp = createGroup east;

private _unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];
_unit = _grp createUnit ["ExtraT", getMarkerPos "infspawn7", [], .4, "form"];

/*
;_trig setTriggerArea[1000,1000,0,false];
;_trig setTriggerActivation ["group member","MEMBER", false];
;_trig setTriggerStatements ["this","this exec 'creategroup1.sqs'",""];
;_trig triggerAttachVehicle [_unit];
*/

[_unit] join _grp;
_grp allowfleeing 0;

_grp addWaypoint [getmarkerpos "destination7", 0];
