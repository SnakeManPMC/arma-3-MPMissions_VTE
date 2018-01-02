
if (PMC_arty_81mm_on_call) exitWith{ hint "Mortar is on call, sorry. Try again after few minutes."; };

//onMapSingleClick "PMC_arty_81mm_target_pos = _pos; onMapSingleClick 'publicVariable ""PMC_arty_81mm_target_pos""'; true;";
onMapSingleClick {PMC_arty_81mm_target_pos = _pos; publicVariable "PMC_arty_81mm_target_pos"; onMapSingleClick {}; true;};

titleText["Open the map and click over it for 81mm mortar coordinates", "PLAIN DOWN"];

// attempt to get some client side radio traffic here
waitUntil
{
	sleep 1;
	PMC_arty_81mm_on_call
};

_myBattery = pmc_artillery_81mm;
player sidechat format["Mortar support on: %1", PMC_arty_81mm_target_pos];

waitUntil {_myBattery getVariable "ARTY_ONMISSION"};
player sidechat "The battery is on a mission.";

waitUntil {_myBattery getVariable "ARTY_COMPLETE"};
player sidechat "M252 mortar is rounds complete.";

waitUntil {_myBattery getVariable "ARTY_SPLASH"};
player sidechat "Splash!";
