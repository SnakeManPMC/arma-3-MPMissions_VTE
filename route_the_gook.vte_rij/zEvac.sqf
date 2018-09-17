
//;zEvac.sqs
while {true} do
{
	sleep 10;
	private _totcnt=0;
	private _lt = list to1;
	private _clt = count _lt;
	private _totcnt = _totcnt + _clt;
	
	if (_clt<1) then
	{
		"mzA" setMarkerColor "ColorBlue";
	};
	
	if (_clt>0) then
	{
		"mzA" setMarkerColor "ColorRed";
	};
	
	if ((_clt<10)&&(count _lt>0)) then
	{
		{
			_x doMove getMarkerPos "mEvacZoneA";
		} forEach _lt;
		"mZA_dude" setMarkerPos (getPos (_lt select 0));
	};
	
	if (_clt==0) then
	{
		"mZA_dude" setMarkerPos [0,0,0];
		sleep 0.5;
		_lt = list to2;
		_clt = count _lt;
		_totcnt = _totcnt + _clt;
	};
	
	if (_clt<1) then
	{
		"mzB" setMarkerColor "ColorBlue";
	};
	
	if (_clt>0) then
	{
		"mzB" setMarkerColor "ColorRed";
	};
	
	if ((_clt<10)&&(_clt>0)) then
	{
		{
			_x doMove getMarkerPos "mEvacZoneB";
		} forEach _lt;
		"mZB_dude" setMarkerPos (getPos (_lt select 0));
	};
	
	if (_clt==0) then
	{
		"mZB_dude" setMarkerPos [0,0,0];
		sleep 0.5;
		_lt = list to3;
		_clt = count _lt;
		_totcnt = _totcnt + _clt;
	};
	
	if (_clt<1) then
	{
		"mzC" setMarkerColor "ColorBlue";
	};
	
	if (_clt>0) then
	{
		"mzC" setMarkerColor "ColorRed";
	};
	
	if ((_clt<10)&&(count _lt>0)) then
	{
		{
			_x doMove getMarkerPos "mEvacZoneC";
		} forEach _lt;
		"mZC_dude" setMarkerPos (getPos (_lt select 0));
	};
	
	if (_clt==0) then
	{
		"mZC_dude" setMarkerPos [0,0,0];
		sleep 0.5;
		_lt=list to4;
		_clt=count _lt;
		_totcnt=_totcnt+_clt;
	;
	
	if (_clt<1) then
	{
		"mzD" setMarkerColor "ColorBlue";
	};
	
	if (_clt>0) then
	{
		"mzD" setMarkerColor "ColorRed";
	};
	
	if ((_clt<10)&&(_clt>0)) then
	{
		{
			_x doMove getMarkerPos "mEvacZoneD";
		} forEach _lt;
		"mZD_dude" setMarkerPos (getPos (_lt select 0));
	};
	
	if (_clt==0) then
	{
		"mZD_dude" setMarkerPos [0,0,0];
	};
	
	if (end1) exitWith {};
};
