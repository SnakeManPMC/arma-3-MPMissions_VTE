
private _type=_this select 0;
private _ammocrateid=_this select 1;

if (_type == "1W") then
{
	while {true} do
	{
		Wammo setdammage 0;
		clearweaponcargo _ammocrateid
		clearmagazinecargo _ammocrateid
		_ammocrateid setdammage 0
		_ammocrateid addweaponCargo ["Binocular",10]
		_ammocrateid addmagazinecargo ["HandGrenade", 10]
		_ammocrateid addmagazinecargo ["VTE_GrenadeGreen", 10]
		_ammocrateid addweaponCargo ["VTE_m16a1",10]
		_ammocrateid addmagazinecargo ["VTE_20Rnd_556x45", 10]
		_ammocrateid addmagazinecargo ["VTE_1Rnd_40mm_HE", 10]
		_ammocrateid addweaponCargo ["VTE_m14",10]
		_ammocrateid addmagazineCargo ["VTE_20Rnd_762x51_nato",10]
		_ammocrateid addweaponCargo ["VTE_m45",10]
		_ammocrateid addmagazineCargo ["VTE_36Rnd_9x19",10]
		_ammocrateid addweaponCargo ["VTE_rpg2",10]
		_ammocrateid addmagazineCargo ["VTE_pg2",10]
		_ammocrateid addweaponCargo ["VTE_m60",10]
		_ammocrateid addmagazineCargo ["VTE_100Rnd_762x51_M60",10]
		_ammocrateid addweaponCargo ["VTE_M3A1",10]
		_ammocrateid addmagazineCargo ["VTE_25Rnd_45ACP",10]
		_ammocrateid addweaponCargo ["VTE_m1911",10]
		_ammocrateid addmagazineCargo ["VTE_7Rnd_1911",10]
		_ammocrateid addweaponCargo ["VTE_m79",10]
		_ammocrateid addmagazineCargo ["VTE_1Rnd_40mm_HE",10]
		_ammocrateid addmagazineCargo ["VTE_1Rnd_40mm_buckshot",10]
		_ammocrateid addmagazineCargo ["VTE_30Rnd_40mm_AmmoBag",10]
		sleep 60;
	};
};

if (_type == "1E") then
{
	while {true} do
	{
		Eammo setdammage 0;
		clearweaponcargo _ammocrateid
		clearmagazinecargo _ammocrateid
		_ammocrateid setdammage 0
		_ammocrateid addweaponCargo ["Binocular",10]
		_ammocrateid addmagazinecargo ["HandGrenade", 10]
		_ammocrateid addmagazinecargo ["VTE_GrenadeGreen", 10]
		_ammocrateid addweaponCargo ["VTE_ak47",10]
		_ammocrateid addmagazinecargo [VTE_30Rnd_762x39_AK47, 10]
		_ammocrateid addmagazinecargo ["VTE_ak47", 10]
		_ammocrateid addweaponCargo ["VTE_sks",10]
		_ammocrateid addmagazineCargo ["VTE_10Rnd_762x54",10]
		_ammocrateid addweaponCargo ["VTE_rpd",10]
		_ammocrateid addmagazineCargo ["VTE_100Rnd_762x51_M60",10]
		_ammocrateid addweaponCargo ["VTE_rpg2",10]
		_ammocrateid addmagazineCargo ["VTE_pg2",10]
		_ammocrateid addweaponCargo ["VTE_tokarevt33",10]
		_ammocrateid addmagazineCargo ["VTE_8Rnd_tokarevt33",10]
		_ammocrateid addweaponCargo ["VTE_mosina",10]
		_ammocrateid addmagazineCargo ["VTE_10Rnd_762x54",10]
		_ammocrateid addweaponCargo ["VTE_sa7launcher",10]
		_ammocrateid addmagazineCargo ["VTE_sa7missile",10]
		_ammocrateid addweaponCargo ["VTE_RPG7",10]
		_ammocrateid addmagazineCargo ["VTE_PG7V",10]
		sleep 60;
	};
};
