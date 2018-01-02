
if (isServer) then
{
	// run the war initialization
	[] execVM "PMC\PMC_init.sqf";
}
else
{
	// 81mm mortars
	"PMC_arty_81mm_target_pos" addPublicVariableEventhandler
	{
		diag_log "launching PMC_arty_fire_81mm.sqf";
		[] execVM "PMC\PMC_arty_fire_81mm.sqf";
	};
	
	// m101 artillery
	"PMC_arty_m101_target_pos" addPublicVariableEventhandler
	{
		diag_log "launching PMC_arty_fire_m101.sqf";
		[] execVM "PMC\PMC_arty_fire_m101.sqf";
	};
	
	[] execVM "briefing.sqf";
	
	// mando missile air support console stuff
	//[] execVM "PMC\PMC_Mandoble_VTE.sqf";
	
	// mandoble air support console added to player, run this on init.sqf
	//player addAction ["Call CAS", "mando_missiles\mando_bombs\mando_airsupportdlg.sqf"];
};

enableSaving [ false, false ];
PAPABEAR = [West,"HQ"];
