_unit = _this select 0;
sleep 10.0; //3 min =180
//sleep 10.0; //3 min =180

_vec = vehicle _unit;
if (not (_vec isKindOf "Man")) then
{
	{if( not(isnull _x)) then {deletevehicle _x}} foreach ([_vec] + crew _vec)
}
else
{
	if( not (isnull _unit)) then {deletevehicle _unit}
	//if( not (isnull _unit)) then {jim action ["HIDEBODY",_unit]}
};








/*
_unit = _this select 0;
_vec = vehicle _unit;
if (not (_vec isKindOf "Man")) then
{
	_unit action ["Eject",(_vec)];
	unassignVehicle _unit;
	
};

//sleep 240.0; //3 min =180
sleep 10.0; //3 min =180
_unit removealleventhandlers "killed";
_unit removealleventhandlers "getout";
_unit removealleventhandlers "getin";
deletevehicle _unit;
*/