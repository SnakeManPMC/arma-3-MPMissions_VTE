//this = [this] execVM "PMC\PMC_opfor_detected_intel.sqf";
private
[
	"_old_target",
	"_target",
	"_triggerlist"
];

//_fish = _this select 0;
//_tmp = format ["%1", _tgt1];
_triggerlist = list pmc_opfor_detected;
_target = _triggerlist select 0;
_old_target = _target;

while {true} do
{
	_triggerlist = list pmc_opfor_detected;
	_target = _triggerlist select 0;
	if (_old_target != _target) then
	{
		"opfor_detected_3" setMarkerPosLocal getMarkerPos "opfor_detected_2";
		"opfor_detected_2" setMarkerPosLocal getMarkerPos "opfor_detected_1";
		"opfor_detected_1" setMarkerPosLocal getPosASL _target;
		_old_target = _target;
	};
	sleep 5;
};
