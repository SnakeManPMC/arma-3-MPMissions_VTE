

if (player == w1) then
{
ID1 = player addAction ["Request artillery", "mortarrequest1.sqf",[],-1,false];
};


if (player == w2) then
{
ID2 = player addAction ["Request artillery", "mortarrequest2.sqf",[],-1,false];
};


if (!isServer) exitWith {};



mortar1 = false;
mortar2 = false;


while {true} do
{



if (mortar1) then
{
iniposX = (mortar1Pos select 0) - 50;
iniposY = (mortar1Pos select 1) - 50;
dropPosX = iniposX + (random 100);
dropPosY = iniposY + (random 100);
shell = "Sh_85_HE" createVehicle [dropPosX, dropPosY, 150];
sleep 3;

iniposX = (mortar1Pos select 0) - 50;
iniposY = (mortar1Pos select 1) - 50;
dropPosX = iniposX + (random 100);
dropPosY = iniposY + (random 100);
shell = "Sh_85_HE" createVehicle [dropPosX, dropPosY, 150];
sleep 3;

iniposX = (mortar1Pos select 0) - 50;
iniposY = (mortar1Pos select 1) - 50;
dropPosX = iniposX + (random 100);
dropPosY = iniposY + (random 100);
shell = "Sh_85_HE" createVehicle [dropPosX, dropPosY, 150];
sleep 3;

iniposX = (mortar1Pos select 0) - 50;
iniposY = (mortar1Pos select 1) - 50;
dropPosX = iniposX + (random 100);
dropPosY = iniposY + (random 100);
shell = "Sh_85_HE" createVehicle [dropPosX, dropPosY, 150];
sleep 3;

iniposX = (mortar1Pos select 0) - 50;
iniposY = (mortar1Pos select 1) - 50;
dropPosX = iniposX + (random 100);
dropPosY = iniposY + (random 100);
shell = "Sh_85_HE" createVehicle [dropPosX, dropPosY, 150];
sleep 3;

mortar1 = false;
"mortarloc1" setMarkerType "Empty";
};



if (mortar2) then
{
iniposX = (mortar2Pos select 0) - 50;
iniposY = (mortar2Pos select 1) - 50;
dropPosX = iniposX + (random 100);
dropPosY = iniposY + (random 100);
shell = "Sh_85_HE" createVehicle [dropPosX, dropPosY, 150];
sleep 3;

iniposX = (mortar2Pos select 0) - 50;
iniposY = (mortar2Pos select 1) - 50;
dropPosX = iniposX + (random 100);
dropPosY = iniposY + (random 100);
shell = "Sh_85_HE" createVehicle [dropPosX, dropPosY, 150];
sleep 3;

iniposX = (mortar2Pos select 0) - 50;
iniposY = (mortar2Pos select 1) - 50;
dropPosX = iniposX + (random 100);
dropPosY = iniposY + (random 100);
shell = "Sh_85_HE" createVehicle [dropPosX, dropPosY, 150];
sleep 3;

iniposX = (mortar2Pos select 0) - 50;
iniposY = (mortar2Pos select 1) - 50;
dropPosX = iniposX + (random 100);
dropPosY = iniposY + (random 100);
shell = "Sh_85_HE" createVehicle [dropPosX, dropPosY, 150];
sleep 3;

iniposX = (mortar2Pos select 0) - 50;
iniposY = (mortar2Pos select 1) - 50;
dropPosX = iniposX + (random 100);
dropPosY = iniposY + (random 100);
shell = "Sh_85_HE" createVehicle [dropPosX, dropPosY, 150];
sleep 3;

mortar2 = false;
"mortarloc2" setMarkerType "Empty";
};









sleep 3;

};