
// this was on init.sqf earlier and apparently working?
"PMC_CSAR_mission" addPublicVariableEventhandler
{
	private
	[
		"_tmp1"
	];
	_tmp0 = _this select 0;
	_tmp1 = _this select 1;
	/*
	diag_log format ["_tmp0: %1, _tmp1: %2", _tmp0, _tmp1];
	
	diag_log "addPublicVariableEventhandler PMC_CSAR_mission is HERE!";
	player sideChat "addPublicVariableEventhandler PMC_CSAR_mission is HERE!";
	hint "addPublicVariableEventhandler PMC_CSAR_mission is HERE!";
	
	diag_log format ["addPubicHair PMC_CSAR_mission: %1", PMC_CSAR_mission];
	player sidechat format ["addPubicHair PMC_CSAR_mission: %1", PMC_CSAR_mission];
	
	diag_log format ["PMC_CSAR_marker_%1", PMC_helo_cv];
	player sidechat format ["PMC_CSAR_marker_%1", PMC_helo_cv];
	
	diag_log format ["deleteMarkerLocal 'PMC_CSAR_marker_%1'; hint 'You have rescued the pilot!';", PMC_helo_cv];
	player sidechat format ["deleteMarkerLocal 'PMC_CSAR_marker_%1'; hint 'You have rescued the pilot!';", PMC_helo_cv];
	*/
	// grab marker name from number of CV helos
	_m = format ["PMC_CSAR_marker_%1", PMC_helo_cv];
	_markerobj = createMarkerLocal [_m, getPosASL _tmp1];
	_markerobj setMarkerTypeLocal "mil_pickup";
	_markerobj setMarkerColorLocal "ColorBlue";
	_markerobj setMarkerTextLocal format ["DOWNED PILOT %1", PMC_helo_cv];
	
	// triggers
	_z = createTrigger ["EmptyDetector", getPosASL _tmp1];
	_z setTriggerActivation ["WEST SEIZED", "PRESENT", true];
	_z setTriggerArea [50, 50, 0, true];
	_z setTriggerTimeout [0, 0, 0, true];
	_z setTriggerStatements ["this && player in thisList", format ["deleteMarkerLocal 'PMC_CSAR_marker_%1'; hint 'You have rescued the pilot!';", PMC_helo_cv], ""];
};

// these two artillery EH's were on PMC\PMC_init.sqf before, that was wrong?
// but when these were moved to init.sqf ... not working anymore?
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

// LZ opening fiddle
"PMC_LZ_opened" addPublicVariableEventhandler
{
	private
	[
		"_m",
		"_markerobj",
		"_pos",
		"_tmp"
	];
	_tmp = _this select 1;
	_pos = _this select 2;

	//however this doesnt work on clients...
	"pmc_blufor_start_6" setMarkerPosLocal _pos;
	
	// set respawn to this location
	"respawn_west" setMarkerPosLocal _pos;
	
	// create marker for this LZ
	_m = format ["PMC_LZ_opened_marker_%1", _tmp];
	_markerobj = createMarkerLocal [_m, _pos];
	_markerobj setMarkerShapeLocal "ELLIPSE";
	_markerobj setMarkerColorLocal "ColorBlue";
	_markerobj setMarkerBrushLocal "Solid";
	_markerobj setMarkerSizeLocal [50, 50];
	hint "LZ has been opened, thank you.";
};
