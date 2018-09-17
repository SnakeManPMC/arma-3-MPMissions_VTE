/*; *****************************************************
; ** Operation Flashpoint Script File
; *****************************************************
*/
if !(Local server) exitWith {};

private _vehicle = Vehicle _this;
private _startpos = GetPos _vehicle;
private _direction = GetDir _vehicle;
private _typ = TypeOf _this;

waitUntil
{
	sleep 10;
	( (!canMove _vehicle) || (getDammage _vehicle > 0.98) );
};

private _new = _typ CreateVehicle [_startpos Select 0, _startpos Select 1, 0];
_new SetDir _direction;
[_new] execVM "respawn_vehicle.sqf";
