
if (PMC_arty_m101_on_call) exitWith{};

//onMapSingleClick "PMC_arty_m101_target_pos = _pos; onMapSingleClick 'publicVariable ""PMC_arty_m101_target_pos""'; true;";
onMapSingleClick {PMC_arty_m101_target_pos = _pos; publicVariable "PMC_arty_m101_target_pos"; onMapSingleClick {}; true;};

titleText["Open the map and click over it for M101 artillery coordinates", "PLAIN DOWN"];
