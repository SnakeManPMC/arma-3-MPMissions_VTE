


private ["_unit"];
_unit = _this select 0;


player globalChat "Artillery standing by, mark target coordinates on map. Over.";


mapclick = false;

onMapSingleClick {

"mortarloc1" setMarkerType "Select";

        "mortarloc1" setMarkerPos _pos;

clickpos = _pos;

mapclick = true;

        onMapSingleClick {};

true;

};


waituntil {mapclick};

_unit removeAction ID1;

_unit globalChat "Coordinates received. Firing 5 HE rounds on target. Out.";

sleep 10;

_unit globalChat "Rounds complete.";

sleep 12;



mortar1Pos = clickpos;
publicvariable "mortar1Pos";


mortar1 = true;
publicvariable "mortar1";






sleep 90;

ID1 = _unit addAction ["Request artillery", "mortarrequest1.sqf",[],-1,false];

hint format["Artillery available again"];