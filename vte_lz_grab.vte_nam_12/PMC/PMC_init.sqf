
PMC_lz_num = 0;
publicVariable "PMC_lz_num";

// debug on
PMC_debug = true;
publicVariable "PMC_debug";

"PMC_Setup_My_LZ" addPublicVariableEventhandler
{
	private
	[
		"_tmp0",
		"_tmp1"
	];
	_tmp0 = _this select 0;
	_tmp1 = _this select 1;
	
	[_tmp1] execVM "PMC\PMC_lz_prepare.sqf";
	diag_log format ["_tmp0: %1, _tmp1: %2", _tmp0, _tmp1];
	player sideChat format["We are at: %1 and PMC_Setup_My_LZ was called!", _tmp1];
};
