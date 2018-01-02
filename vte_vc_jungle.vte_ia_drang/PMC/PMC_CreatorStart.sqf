
PMC_CreatorStart =
{
	private
	[
		"_count",
		"_ran",
		"_vc1",
		"_A",
		"_B",
		"_thepos"
	];

	_count = _this select 0;
	// Viet Cong
	_ran=0;
	_ran=random(1);
	
	e2=objnull;
	_vc1=objnull;
	
	"VTE_vcofficer" createunit [getPosASL EastInfStart, groupCharlie, "e2 = this", _ran, "SERGEANT"];
	[e2] join grpnull;
	_vc1 = group e2;
	_count = _count + 1;
	
	_A=1;
	_B=random(11);
	
	while {_A < _B} do
	{
		_A=_A+1;
		_ran=0;
		_ran=random(1);
                e1=objNull;
		
		"VTE_vcsoldier" createunit [getPosASL EastInfStart, groupCharlie, "e1 = this", _ran, "CORPORAL"];
		[e1] join grpnull;
		[e1] join _vc1;
	};	
	_count = _count + _A;
	_thepos = call PMC_Random_Pos_SEBNam;
	_vc1 addWaypoint [_thepos, 50];
	[_vc1, 1] setWaypointBehaviour "SAFE";
	[_vc1, 1] setWaypointCombatMode "RED";
	[_vc1, 1] setWaypointSpeed "LIMITED";
	[_vc1, 1] setWaypointFormation "WEDGE";
	[_vc1, 1] setWaypointType "MOVE";
	[_vc1, 1] setWaypointTimeout [60*2, 60*10, 60*20]; // min, mid, max
	[_vc1, 1] setWaypointCompletionRadius 50;

	//hint format["Created: %1\ngroup: %2\n%3",_B,_B+1,(count eastlist)];
	
	// NVA
	e2=objnull;
	_vc1=objnull;
	
	_ran=0;
	_ran=random(1);
	
	"VTE_nvaofficer" createunit [getPosASL EastStart, groupDelta, "e2 = this", _ran, "SERGEANT"];
	[e2] join grpnull;
	_vc1 = group e2;
	_count = _count + 1;
	
	_A=1;
	_B=random(11);
	
	while {_A < _B} do
	{
		_A=_A+1;
		_ran=0;
		_ran=random(1);
		
		"VTE_nvasoldier" createunit [getPosASL EastStart, groupCharlie, "e1 = this", _ran, "CORPORAL"];
		[e1] join grpnull;
		[e1] join _vc1;
	};	
	_count = _count + _A;
	_thepos = call PMC_Random_Pos_SEBNam;
	_vc1 addWaypoint [_thepos, 50];
	[_vc1, 1] setWaypointBehaviour "SAFE";
	[_vc1, 1] setWaypointCombatMode "RED";
	[_vc1, 1] setWaypointSpeed "LIMITED";
	[_vc1, 1] setWaypointFormation "WEDGE";
	[_vc1, 1] setWaypointType "MOVE";
	[_vc1, 1] setWaypointTimeout [60*2, 60*10, 60*20]; // min, mid, max
	[_vc1, 1] setWaypointCompletionRadius 50;
	
	_count
};
