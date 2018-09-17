
//zEvac.sqs
while {true} do
{
	sleep 10;
	private _totcnt=0;
	private _lt = list to2;
	private _clt = count _lt;
	private _totcnt = _totcnt + _clt;
	if (_clt<1) then
	{
		"T2-2" setMarkerColor "ColorBlue";
	};
	
	if (_clt>0) then
	{
		"T2-2" setMarkerColor "ColorRed";
	};
	
	if (_clt==0) then
	{
		// ??? setmarkerPos [0,0,0];
	};
	if (end1) exitWith {};
};
