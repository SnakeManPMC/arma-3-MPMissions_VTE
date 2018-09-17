
//; remover.sqs
if !(local server) exitWith {};
private _unit = _this select 0;
private _grp = group _unit;
sleep 30;
//;terminator action ["HIDEBODY", _unit];
sleep 10;
deletevehicle _unit;
deletegroup _grp;
