
private
[
	"_tmp"
];

// description.ext mission starting parameters
skiptime (((paramsarray select 0) - daytime + 24) % 24);

// set our weather using multiplayer parameter array
[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

// place the SF team to the downed helo
{
	_x setPosASL [(getPosASL downed_helo select 0) + 50, (getPosASL downed_helo select 1) + 50, 0];
	sleep 0.01;
} forEach units sfteam;

// move NVA alert forces into the helo
{
	_x setPosASL [(getPosASL downed_helo select 0) - 250, (getPosASL downed_helo select 1) - 250, 0];
	sleep 0.01;
} forEach units nvainf1;
leader nvainf1 move getPosASL downed_helo;
