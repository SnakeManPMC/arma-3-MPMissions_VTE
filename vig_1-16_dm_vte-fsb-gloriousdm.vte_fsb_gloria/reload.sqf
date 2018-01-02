private ["_unit","_param2","_rand","_rn"];

// var inits
_unit = _this;
_param2 = Param2;
_rand = 0;
_rn = 0;

// set units ration, so AI starts shooting each other
_unit addrating (-(rating _unit) - 100000);
RemoveAllWeapons _unit;

// define scope to jump back to, after random selector with different _param2
scopeName "main";
switch (_param2) do
{
// 'light' weapons after here
	case 1:
	{
		_unit addMagazine "VTE_30Rnd_762x39_AK47";
		_unit addMagazine "VTE_30Rnd_762x39_AK47";
		_unit addMagazine "VTE_30Rnd_762x39_AK47";
		_unit addMagazine "VTE_30Rnd_762x39_AK47";
		_unit addMagazine "VTE_30Rnd_762x39_AK47";
		_unit addWeapon "VTE_ak47";
		_unit selectWeapon "VTE_ak47";
	};
	case 2:
	{
		_unit addMagazine "VTE_32Rnd_9x18";
		_unit addMagazine "VTE_32Rnd_9x18";
		_unit addMagazine "VTE_32Rnd_9x18";
		_unit addMagazine "VTE_32Rnd_9x18";
		_unit addMagazine "VTE_32Rnd_9x18";
		_unit addWeapon "VTE_sten";
		_unit selectWeapon "VTE_sten";
	};
	case 3:
	{
		_unit addMagazine "VTE_100Rnd_45ACP";
		_unit addMagazine "VTE_100Rnd_45ACP";
		_unit addWeapon "VTE_thompson";
		_unit selectWeapon "VTE_thompson";
	};
	case 4:
	{
		_unit addMagazine "VTE_20Rnd_556x45";
		_unit addMagazine "VTE_20Rnd_556x45";
		_unit addMagazine "VTE_20Rnd_556x45";
		_unit addMagazine "VTE_20Rnd_556x45";
		_unit addMagazine "VTE_20Rnd_556x45";
		_unit addWeapon "VTE_xm177e";
		_unit selectWeapon "VTE_xm177e";
	};
	case 5:
	{
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addMagazine "VTE_5Rnd_762x54";
		_unit addWeapon "VTE_mosin38";
		_unit selectWeapon "VTE_mosin38";
	};
	case 6:
	{
		_unit addMagazine "VTE_20Rnd_762x51_nato";
		_unit addMagazine "VTE_20Rnd_762x51_nato";
		_unit addMagazine "VTE_20Rnd_762x51_nato";
		_unit addMagazine "VTE_20Rnd_762x51_nato";
		_unit addMagazine "VTE_20Rnd_762x51_nato";
		_unit addWeapon "VTE_m14";
		_unit selectWeapon "VTE_m14";
	};
	case 7:
	{
		_unit addMagazine "VTE_10Rnd_762x54";
		_unit addMagazine "VTE_10Rnd_762x54";
		_unit addMagazine "VTE_10Rnd_762x54";
		_unit addMagazine "VTE_10Rnd_762x54";
		_unit addMagazine "VTE_10Rnd_762x54";
		_unit addMagazine "VTE_10Rnd_762x54";
		_unit addMagazine "VTE_10Rnd_762x54";
		_unit addWeapon "VTE_garand";
		_unit selectWeapon "VTE_garand";
	};
	case 8:
	{
		_unit addMagazine "VTE_25Rnd_45ACP";
		_unit addMagazine "VTE_25Rnd_45ACP";
		_unit addMagazine "VTE_25Rnd_45ACP";
		_unit addMagazine "VTE_25Rnd_45ACP";
		_unit addMagazine "VTE_25Rnd_45ACP";
		_unit addWeapon "VTE_m3a1";
		_unit selectWeapon "VTE_m3a1";
	};
	case 9:
	{
		_unit addMagazine "VTE_ithacashell";
		_unit addMagazine "VTE_ithacashell";
		_unit addMagazine "VTE_ithacashell";
		_unit addMagazine "VTE_ithacashell";
		_unit addMagazine "VTE_ithacashell";
		_unit addMagazine "VTE_ithacashell";
		_unit addMagazine "VTE_ithacashell";
		_unit addMagazine "VTE_ithacashell";
		_unit addMagazine "VTE_ithacashell";
		_unit addMagazine "VTE_ithacashell";
		_unit addMagazine "VTE_ithacashell";
		_unit addMagazine "VTE_ithacashell";
		_unit addMagazine "VTE_ithacashell";
		_unit addMagazine "VTE_ithacashell";
		_unit addMagazine "VTE_ithacashell";
		_unit addMagazine "VTE_ithacashell";
		_unit addMagazine "VTE_ithacashell";
		_unit addMagazine "VTE_ithacashell";
		_unit addMagazine "VTE_ithacashell";
		_unit addMagazine "VTE_ithacashell";
		_unit addWeapon "VTE_ithaca";
		_unit selectWeapon "VTE_ithaca";
	};

// heavy weapons after here
	case 10:
	{
		_unit addMagazine "VTE_30Rnd_40mm_AmmoBag";
		_unit addMagazine "VTE_1Rnd_40mm_buckshot";
		_unit addMagazine "VTE_1Rnd_40mm_buckshot";
		_unit addMagazine "VTE_1Rnd_40mm_buckshot";
		_unit addMagazine "VTE_1Rnd_40mm_buckshot";
		_unit addMagazine "VTE_1Rnd_40mm_buckshot";
		_unit addWeapon "VTE_m79";
		_unit selectWeapon "VTE_m79";
	};
	case 11:
	{
		_unit addMagazine "VTE_100Rnd_556x45";
		_unit addMagazine "VTE_100Rnd_556x45";
		_unit addWeapon "VTE_stoner_mg";
		_unit selectWeapon "VTE_stoner_mg";
	};
	case 12:
	{
		_unit addMagazine "VTE_100Rnd_762x51_M60";
		_unit addMagazine "VTE_100Rnd_762x51_M60";
		_unit addWeapon "VTE_m60s";
		_unit selectWeapon "VTE_m60s";
	};
	case 13:
	{
		_unit addMagazine "VTE_10Rnd_762x54";
		_unit addMagazine "VTE_10Rnd_762x54";
		_unit addMagazine "VTE_10Rnd_762x54";
		_unit addMagazine "VTE_10Rnd_762x54";
		_unit addMagazine "VTE_10Rnd_762x54";
		_unit addMagazine "VTE_10Rnd_762x54";
		_unit addMagazine "VTE_10Rnd_762x54";
		_unit addMagazine "VTE_10Rnd_762x54";
		_unit addWeapon "VTE_enfieldn4";
		_unit selectWeapon "VTE_enfieldn4";
	};
	case 14:
	{
		_unit addMagazine "VTE_PG2";
		_unit addMagazine "VTE_PG2";
		_unit addMagazine "VTE_PG2";
		_unit addMagazine "VTE_PG2";
		_unit addWeapon "VTE_rpg2";
		_unit selectWeapon "VTE_rpg2";
	};
	case 15:
	{
		_unit addMagazine "VTE_47Rnd_762x51_drum";
		_unit addMagazine "VTE_47Rnd_762x51_drum";
		_unit addMagazine "VTE_47Rnd_762x51_drum";
		_unit addMagazine "VTE_47Rnd_762x51_drum";
		_unit addWeapon "VTE_dp27";
		_unit selectWeapon "VTE_dp27";
	};
	case 16:
	{
		_unit addMagazine "VTE_100Rnd_762x54";
		_unit addMagazine "VTE_100Rnd_762x54";
		_unit addWeapon "VTE_rpd";
		_unit selectWeapon "VTE_rpd";
	};
	case 17:
	{
		_unit addMagazine "VTE_71Rnd_762x25";
		_unit addMagazine "VTE_71Rnd_762x25";
		_unit addMagazine "VTE_71Rnd_762x25";
		_unit addWeapon "VTE_ppd40";
		_unit selectWeapon "VTE_ppd40";
	};
// random selectors
	case 18:
	{
		_rand = 1+random 8;
		_rn = (_rand + 0.5) - ((_rand + 0.5) Mod 1);
		_param2 = _rn;
		breakTo "main";
	};
	case 19:
	{
		_rand = 10+random 7;
		_rn = (_rand + 0.5) - ((_rand + 0.5) Mod 1);
		_param2 = _rn;
		breakTo "main";
	};
	case 20:
	{
		_rand = 1+random 16;
		_rn = (_rand + 0.5) - ((_rand + 0.5) Mod 1);
		_param2 = _rn;
		breakTo "main";
	};
};