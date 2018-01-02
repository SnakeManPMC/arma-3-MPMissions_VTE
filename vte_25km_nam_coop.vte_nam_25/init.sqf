PAPABEAR = [West,"HQ"];

[] execVM "briefing.sqf";

enableSaving [ false, false ];

// if we run this on client, exit immediately.
if (!isServer) exitWith{};

// set up the base objects relative to the pole which gets 10 KILOMETER radius :)
// NW corner mortar
mor1 setpos [(getPosASL nvabase select 0)-50,(getPosASL nvabase select 1)+50,0];
// NE corner machine gun
mgun2 setpos [(getPosASL nvabase select 0)+50,(getPosASL nvabase select 1)+50,0];
// SW corner mortar
mgun1 setpos [(getPosASL nvabase select 0)-50,(getPosASL nvabase select 1)-50,0];
// SE corner machine gun
mor2 setpos [(getPosASL nvabase select 0)+50,(getPosASL nvabase select 1)-50,0];
// hut north and south of pole
hut1 setpos [(getPosASL nvabase select 0),(getPosASL nvabase select 1)+20,0];
hut2 setpos [(getPosASL nvabase select 0),(getPosASL nvabase select 1)-20,0];
// ammo boxes
box1 setpos [(getPosASL nvabase select 0)+5,(getPosASL nvabase select 1)+5,0];
box2 setpos [(getPosASL nvabase select 0)-5,(getPosASL nvabase select 1)-5,0];

{
	_x setpos getPosASL nvabase;
} forEach units nvahq;

nvahq move [(getPosASL nvabase select 0)-10,(getPosASL nvabase select 1)+10];
