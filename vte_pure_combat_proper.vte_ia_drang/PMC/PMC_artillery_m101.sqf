
if (PMC_arty_m101_on_call) exitWith{ hint "Arty is on call, sorry. Try again after few minutes."; };

//onMapSingleClick "PMC_arty_m101_target_pos = _pos; onMapSingleClick 'publicVariable ""PMC_arty_m101_target_pos""'; true;";
onMapSingleClick {PMC_arty_m101_target_pos = _pos; publicVariable "PMC_arty_m101_target_pos"; onMapSingleClick {}; true;};

titleText["Open the map and click over it for M101 artillery coordinates", "PLAIN DOWN"];

// attempt to get some client side radio traffic here
waitUntil
{
	PMC_arty_m101_on_call
};

_myBattery = pmc_artillery_m101;
player sidechat format ["Artillery support on: %1", PMC_arty_m101_target_pos];

waitUntil {_myBattery getVariable "ARTY_ONMISSION"};
player sidechat "The battery is on a mission.";

waitUntil {_myBattery getVariable "ARTY_COMPLETE"};
player sidechat "M101 Artillery is rounds complete.";

waitUntil {_myBattery getVariable "ARTY_SPLASH"};
player sidechat "Splash!";
