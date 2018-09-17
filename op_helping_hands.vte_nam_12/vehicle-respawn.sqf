/*;Script by Mr-Murray 2006
;mr-murray@bossmail.de
;www.mapfact.net
;www.mr-murray.de.vu
*/

if !(Local Server) exitWith {};

private _vehicle = _this select 0;
private _vehicleClass = _this select 1;
private _respawnArea = _this select 2;
private _azimutCode = _this select 3;
private _respawnDelay = _this select 4;
private _respawnrate = _this select 5;
private _deletevehicle = _this select 6;
private _staticrespawn = _this select 7;
private _deleteeffect = _this select 8;

private _counter = 0;

while { (_counter <= _respawnrate) } do
{
	sleep 1;
	if (!Canmove _Vehicle) then
	{
		_counter = _counter + 1;
		
		// Staticposition  (0=Flexible/1=Static)
		if (_staticrespawn == 0) then
		{
			_respawnArea setpos getpos _vehicle;
		};
		
		if (_staticrespawn == 0) then
		{
			_VehAzimut = getdir _vehicle;
		};
		
		sleep _respawnDelay;

		deleteVehicle _vehicle;
		private _bomb = "M_Javelin_AT" createVehicle [0,0,1000];
		_bomb setpos getpos _vehicle;
		
		// Deletevehicle (0=No Delete/1=Delete)
		if (_deletevehicle == 0) then
		{
			sleep 2;
			_vehicle = _vehicleClass createVehicle getpos _respawnArea;
			_vehicle setdir _azimutCode;
			if (_staticrespawn == 0) then
			{
				_vehicle setdir _VehAzimut;
			};
		};
	
		// Delete effect
		if (_deleteeffect == 0) then
		{
			sleep 2;
			_vehicle = _vehicleClass createVehicle getpos _respawnArea;
			_vehicle setdir _azimutCode;
			if (_staticrespawn == 0) then
			{
				_vehicle setdir _VehAzimut;
			};
		};
	};
};
