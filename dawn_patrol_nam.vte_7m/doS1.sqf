
while {true} do
{
	sleep 10;
	private _LT = list tService1;
	{
		if ((getPos _x select 2<3) && ((velocity _x select 0)+(velocity _x select 2)+(velocity _x select 2)<0.1)) then
		{
			if ((vehicle player==_x) && (vehicle player != player)) then
			{
				bSupp1 = true;
				cutText["Servicing Vehicle...","PLAIN DOWN"];
				_x setDammage 0;
				_x setFuel 1;
				_x setVehicleAmmo 1;
				_x setVehicleArmor 1;
			};
		};
	} forEach _LT;
	if (end1) exitWith {};
};
