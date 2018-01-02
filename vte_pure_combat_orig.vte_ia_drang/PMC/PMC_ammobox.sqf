// call from mission editor init line:
// handle = [this] execVM "PMC_ammobox.sqf";
_b = _this select 0;

// clear box
clearMagazineCargo _b;
clearWeaponCargo _b;

// add magazines and weapons
_b addMagazineCargo ["VTE_7Rnd_1911",50];
_b addWeaponCargo ["VTE_M1911",50];
_b addMagazineCargo ["VTE_32Rnd_9x19",50];
_b addWeaponCargo ["VTE_uzi",10];
_b addMagazineCargo ["VTE_32Rnd_9x18",50];
_b addWeaponCargo ["VTE_sten",10];
_b addMagazineCargo ["VTE_20Rnd_556x45",50];
_b addWeaponCargo ["VTE_AR15",10];
_b addMagazineCargo ["VTE_20Rnd_556x45",50];
_b addWeaponCargo ["VTE_XM177E",10];
_b addMagazineCargo ["VTE_20Rnd_556x45",50];
_b addWeaponCargo ["VTE_M16A1",10];
_b addMagazineCargo ["VTE_20Rnd_762x51_nato",50];
_b addWeaponCargo ["VTE_M14",10];
_b addMagazineCargo ["VTE_20Rnd_762x51_nato",50];
_b addWeaponCargo ["VTE_M21",10];
_b addMagazineCargo ["VTE_30Rnd_40mm_AmmoBag",50];
_b addWeaponCargo ["VTE_M79",10];
_b addMagazineCargo ["VTE_20Rnd_556x45",50];
_b addWeaponCargo ["VTE_Stoner_AR",10];
_b addMagazineCargo ["VTE_100Rnd_556x45",50];
_b addWeaponCargo ["VTE_Stoner_MG",10];
_b addMagazineCargo ["VTE_100Rnd_762x51_M60",50];
_b addWeaponCargo ["VTE_M60",10];
_b addMagazineCargo ["VTE_M72",10];
_b addWeaponCargo ["VTE_LAW",10];

_b addWeaponCargo ["Binocular",3];
_b addMagazineCargo ["HandGrenade",3];
_b addMagazineCargo ["SmokeShell",3];
_b addMagazineCargo ["SmokeShellGreen",3];
_b addMagazineCargo ["SmokeShellRed",3];

//_b addMagazineCargo ["",50];
//_b addWeaponCargo ["",10];
