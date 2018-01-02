
// only game logics are local to the server. This is how we prevent clients running server scripts.
if (isServer) then
{
	[] execVM "PMC\PMC_war.sqf";

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
}
else
{
	[] execVM "briefing.sqf";

	player setVariable ["BIS_noCoreConversations", true];

	// mando settings suitable for VTE
	// not working in ArmA 2 [] execVM "PMC\PMC_Mandoble_VTE.sqf";
};

enableSaving [ false, false ];
