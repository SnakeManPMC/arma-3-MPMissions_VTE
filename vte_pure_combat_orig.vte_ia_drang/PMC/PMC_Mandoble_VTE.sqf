
// mando settings suitable for VTE
mando_support_left_WEST = 200;			// max number of CAS
mando_support_left_ca_WEST = 200;		// max number of helo gunsips
mando_support_left_rc_WEST = 200;		// max numbers of recon planes
mando_support_left_cb_WEST = 200;		// max number of carpet bomb runs
mando_airsupport_type = "VTE_f105";
mando_airsupport_type_ca = "vte_ah1j";
mando_airsupport_type_pa = "vte_uh1";
mando_airsupport_type_rc = "vte_birddog";
mando_airsupport_type_ev = "vte_ch47ca";
mando_airsupport_type_la = "vte_f105";
mando_airsupport_type_am = "vte_ch34";
mando_airsupport_type_ambox = "vte_ammoboxus";
mando_airsupport_type_ve = "vte_ch47ca";
mando_airsupport_type_cp = "vte_f4_grey_aa";
mando_airsupport_type_cb = "vte_b52";		// plane for carpet bombing
mando_airsupport_bomb_altmax = 1000;		// max alt of attack
mando_airsupport_range = 5000;			// range for plane spawns
mando_airsupport_range_he = 3000;		// range for helo spawns
mando_airsupport_max_cas = 6;
mando_airsupport_bomb_type = "VTE_MK84";
mando_airsupport_maxrecoscan = 2500;		// max recon camera range
mando_support_no_sa = true;
mando_support_no_cm = true;
mando_support_no_sat = true;
mando_support_no_la = true;
mando_support_no_ab = true;
mando_support_no_ev = true;
mando_support_no_ve = true;
mando_support_no_re = true;
mando_support_no_la = true;

// Carpet bombing custom code
mando_airsupport_carpetcode = 
{
	private["_plane", "_targetpos","_NumBombs","_interval"];
	_plane = _this select 0;
	_targetpos = _this select 1;
	_NumBombs = 48;
	_Interval = 0.2;
	while {(([getPosASL _plane select 0, getPosASL _plane select 1, 0] distance _targetpos) > 2000) && (alive _plane)} do
	{
		sleep 1;
	};
	if (alive _plane) then
	{
		/*
		// was _i < 6
		for [{_i=0}, {_i<_NumBombs}, {_i=_i+1}] do
		{
			_plane action ["useWeapon",_plane,driver _plane,2];
			sleep _Interval; // was 0.5
		};
		*/
		_plane action ["useWeapon",_plane,driver _plane,3];
	};
};

/*
"Single","Full","All","AllClose"
0 single; reloadTime=0.1;
1 full; reloadTime=0.1;
2 all; reloadTime=0.2; burst 48
3 allclose; reloadTime=0.05; burst 48

all = 48 burst. STR_VTE_DISPLAYNAME_B52MK82AllSpread,"MK-82 | Drop All Spread"
STR_VTE_DISPLAYNAME_B52MK82AllTight,"MK-82 | Drop All Tight"
full = STR_VTE_DISPLAYNAME_B52MK82Auto,"MK-82 | Auto Release"
single = STR_VTE_DISPLAYNAME_B52MK82Manual,"MK-82 | Manual Release"
*/

/*
mandoble air support console added to player. does not get added on JIP :(
*/
player addAction ["Call CAS", "mando_bombs\mando_airsupportdlg.sqf"];
