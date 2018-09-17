
while {true} do
{
	sleep 0.001;
	if (count _this == 0) exitWith {};
	
	(_this select 0) setdammage 1;
};
