
private _first = _this select 0;

private _text = "Choose your parachute-location by single-clicking on map near any Town or Island.";
if ?(format["%1",_first] == "Again") then
{
	_text = "Your choosen parachute-location is too far away from the Island!\nChoose another parachute-location.";
};

TitleText [_text,"Plain"];
//;forceMap true;

onMapSingleClick "_StartLocation = _pos;[_StartLocation] exec ""SpawnWPara2.sqs"";onMapSingleClick """"";
