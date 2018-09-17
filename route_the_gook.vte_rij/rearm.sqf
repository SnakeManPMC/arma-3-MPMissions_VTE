/*; ****************************************************************
; Script file for Armed Assault
; Created by: TODO: Author Name
; ****************************************************************
;/// addto init line of Unit []exec"rearm.sqs"
;//// rearm.sqs;
*/
while {true} do
{
	sleep 20;
	waitUntil
	{
		sleep 0.1;
		(!alive player);
	};
	
	private _weapons = weapons player;
	private _magazines = magazines player;
	
	waitUntil
	{
		(alive player);
	};
	
	removeallweapons player;
	
	{player addMagazine _x} forEach _magazines;
	{player addWeapon _x} forEach _weapons;
};
