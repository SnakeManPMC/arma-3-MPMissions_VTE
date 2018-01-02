


private ["_unit"];
_unit = _this select 0;


player globalChat "Artillery standing by, mark target coordinates on map. Over.";


mapclick = false;

onMapSingleClick {

"mortarloc2" setMarkerType "Select";

"mortarloc2" setMarkerPos _pos;

clickpos = _pos;

mapclick = true;

        onMapSingleClick {};

true;

};


waituntil {mapclick};

_unit removeAction ID2;


_unit globalChat "Coordinates received. Firing 5 HE rounds on target. Out.";

sleep 10;

_unit globalChat "Rounds complete.";

sleep 12;



mortar2Pos = clickpos;
publicvariable "mortar2Pos";


mortar2 = true;
publicvariable "mortar2";


sleep 90;

ID2 = _unit addAction ["Request artillery", "mortarrequest2.sqf",[],-1,false];


hint format["Artillery available again"];