
private _RecPos1=_this select 0;
private _leader=_this select 1;
private _cnt=count units group _leader;
private _pos=getPos _leader;
private _type=typeOf _leader;

if ((_type=="VTE_acsoldierWPilot")||(_type=="VTE_acsoldierEPilot")||(_type=="VTE_acsoldierGPilot")) exitWith
{
	if (_cnt>1) exitWith
	{
		hint "you already have a gunner";
	};

	_type createUnit [_pos, group _leader,"this addweapon ""NVGoggles"";", 0.85, "private"];
	hint (_type + " created");
};

if ((_type=="VTE_acsoldierWCrew")||(_type=="VTE_acsoldierECrew")) exitWith
{
	if (_cnt>5) exitWith
	{
		hint "you already have 5 crewmen";
	};
	_type createUnit [_pos, group _leader,"this addweapon ""NVGoggles"";", 0.85, "private"];
	hint (_type + " created");
}:

if ((_type=="VTE_acsoldierWSaboteurAssault")||(_type=="VTE_acsoldierWB")||(_type=="VTE_acsoldierGB")) exitWith
{
	if (_cnt>19) exitWith
	{
		hint "you already have 20 troops";
	};
	_type createUnit [_pos, group _leader,"this addweapon ""NVGoggles"";", 0.85, "private"];
	hint (_type + " created");
};

if ((_type=="SoldierESaboteurAssault")||(_type=="VTE_NVAsoldier")||(_type=="VTE_NVAsoldier")) then
{
};
