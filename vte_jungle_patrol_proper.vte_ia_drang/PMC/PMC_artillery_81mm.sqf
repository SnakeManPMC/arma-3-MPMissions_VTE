
if (PMC_arty_81mm_on_call) exitWith{};

//onMapSingleClick "PMC_arty_81mm_target_pos = _pos; onMapSingleClick 'publicVariable ""PMC_arty_81mm_target_pos""'; true;";
onMapSingleClick {PMC_arty_81mm_target_pos = _pos; publicVariable "PMC_arty_81mm_target_pos"; onMapSingleClick {}; true;};

//onMapSingleClick "res = [_pos] execVM ""mando_missiles\mando_bombs\mando_basic_bombrun.sqf"";  onMapSingleClick '';true;";

titleText["Open the map and click over it for 81mm mortar coordinates", "PLAIN DOWN"];
