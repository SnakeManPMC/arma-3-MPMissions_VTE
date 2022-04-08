
[] execVM "PMC\PMC_Briefing.sqf";

// local to player(s)
// place the SF team to the downed helo
{
	_x setPosASL [(getPosASL downed_helo select 0) + 50, (getPosASL downed_helo select 1) + 50, 0];
	sleep 0.01;
} forEach units sfteam;
