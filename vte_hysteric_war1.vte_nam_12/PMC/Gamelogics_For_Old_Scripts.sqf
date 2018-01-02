private ["_center","_group","_pos"];
_center = createCenter sideLogic;
_group = createGroup _center;
_pos = [0, 0, 0];
pmc_homebase = _group createUnit ["LOGIC", _pos , [], 0, ""];
pmc_temp_logic = _group createUnit ["LOGIC", _pos , [], 0, ""];
