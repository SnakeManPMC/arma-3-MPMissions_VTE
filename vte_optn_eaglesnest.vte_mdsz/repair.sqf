F_Repair = 
{
	_vec = (vehicle player);
	_type = typeOf vehicle player;
	if(getDammage _vec > 0 or fuel _vec < 0.98 and not (_vec isKindOf "Man")) then
	{
		_inrepairzone = ((_vec in list RZoneA) or (_vec in list RZoneB) or (_vec in list RZoneC) or (_vec in list RZoneD));
		if(_inrepairzone and _vec != player and speed _vec > -2 and speed _vec < 2 and position _vec select 2 < 2.0 and (local _vec)) then
		{

			 titleText ["Servicing", "PLAIN DOWN",0.3];
			 for [{_loop2=0}, {_loop2<1}, {_loop2=_loop2}] do
			 {
			    sleep 0.200;	    		    
			    if (getDammage _vec > 0) then {_vec setDammage ((getDammage _vec)-0.0125);};
			    if (Fuel _vec < 1) then {_vec setFuel ((Fuel _vec)+0.0125);};
			    if (getDammage _vec == 0 and Fuel _vec == 1) then {_loop2=1;};
			    if(_vec != vehicle player or speed _vec < -2 or speed _vec > 2 or position _vec select 2 > 2.0) then {_loop2=1;titleText [localize "EVO_015", "PLAIN DOWN",0.3];};
			};
			_vec setVehicleAmmo 1;
		};
	};
};


for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{	
	[] call F_Repair;
	sleep 1.011;
};