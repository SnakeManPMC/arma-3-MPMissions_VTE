// notification for player about US forces entering a village
// usage
// [string] execVM "PMC\PMC_village_us_forces.sqf";

private
[
	"_v",
	"_str"
];

// village number
_v = _this select 0;

_str = format["%1 village has been pacified by US forces, good job.", _v];

PAPABEAR sideChat _str;
hint _str;
