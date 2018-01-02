
private
[
	"_tmp",
	"_tmp2"
];

_tmp = _this select 0;
_tmp2 = _this select 1;

_tmp setMarkerColorLocal "ColorGreen";
_tmp setMarkerTypeLocal "dot";
_tmp = true;
publicVariable format["%1", _tmp];
_tmp2 setTaskState "succeeded";

// nice hint of it
[objNull, ObjNull, _tmp2, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
diag_log format ["Objective %1 succeeded!", _tmp];
