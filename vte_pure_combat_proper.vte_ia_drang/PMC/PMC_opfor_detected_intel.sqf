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

/* this is some crazy shit, every time the trigger activates we start one of these loops
do you realize that the trigger can activate several hundred times... heh whoa dude
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
so lets only update one marker at the time... */
"opfor_detected_1" setMarkerPosLocal getPosASL _target;
