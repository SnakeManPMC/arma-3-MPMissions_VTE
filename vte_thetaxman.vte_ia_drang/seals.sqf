/*
; The Taxman
; by Ebud

============
_scriptcall = _this select 1
============
*/

if (_scriptcall == "vc1") then
{
	tracker1_1 say "viet_at1";
	sleep 3;
	tracker1_2 say "viet_at2";
	sleep 2;
	tracker1_3 say "viet_at3";
	sleep 2;
	tracker1_4 say "viet_at4";
	sleep 2;
	tracker1_5 say "viet_at5";
	sleep 2;
	tracker1_6 say "viet_at6";
	sleep (random 25);
};

if (_scriptcall == "vc2") then
{
	tracker2_1 say "viet_at7";
	sleep 3;
	tracker2_2 say "viet_at8";
	sleep 2;
	tracker2_3 say "viet_at9";
	sleep 2;
	tracker2_4 say "viet_at10";
	sleep 2;
	tracker2_5 say "viet_at11";
	sleep 2;
	tracker2_6 say "viet_at12";
	sleep 2;
	tracker2_7 say "viet_at13";
	sleep 2;
	tracker2_8 say "viet_at14";
	sleep (random 25);
};

if (_scriptcall == "vc3") then
{
	tracker3_1 say "viet_at15";
	sleep 3;
	tracker3_2 say "viet_at1";
	sleep 2;
	tracker3_3 say "viet_at2";
	sleep (random 25);
};

if (_scriptcall == "vc4") then
{
	tracker4_1 say "viet_at3";
	sleep 3;
	tracker4_2 say "viet_at4";
	sleep 2;
	tracker4_3 say "viet_at5";
	sleep (random 25);
};

if (_scriptcall == "vc5") then
{
	tracker5_1 say "viet_at3";
	sleep 3;
	tracker5_2 say "viet_at4";
	sleep 2;
	tracker5_3 say "viet_at5";
	sleep 3;
	tracker5_4 say "viet_at6";
	sleep 3;
	tracker5_5 say "viet_at7";
	sleep 3;
	tracker5_6 say "viet_at8";
	sleep 3;
	tracker5_7 say "viet_at9";
	sleep 3;
	tracker5_8 say "viet_at10";
	sleep 3;
	tracker5_9 say "viet_at11";
	sleep (random 25);
};

if (_scriptcall == "vc6") then
{
	Patrol1_1 say "viet_at12";
	sleep 3;
	Patrol1_2 say "viet_at13";
	sleep 2;
	Patrol1_3 say "viet_at14";
	sleep (random 25);
};

if (_scriptcall == "vc7") then
{
	Patrol2_1 say "viet_at15";
	sleep 3;
	Patrol2_2 say "viet_at1";
	sleep 2;
	Patrol2_3 say "viet_at2";
	sleep (random 25);
};

if (_scriptcall == "vc8") then
{
	Patrol3_1 say "viet_at3";
	slep 3;
	Patrol3_2 say "viet_at4";
	sleep 2;
	Patrol3_3 say "viet_at14";
	sleep (random 25);
};

if (_scriptcall == "voices") then
{
	while {true} do
	{
		VC1 setpos getpos leader tracker1;
		VC2 setpos getpos leader tracker2;
		VC3 setpos getpos leader tracker3;
		VC4 setpos getpos leader tracker4;
		VC5 setpos getpos leader tracker5;
		VC6 setpos getpos leader patrol1;
		VC7 setpos getpos leader patrol2;
		VC8 setpos getpos leader patrol3;
		sleep 1;
	};
};

if (_scriptcall == "objective0") then
{
	"0" objstatus "done";
	ob0=false;
	o0=true;
	publicvariable "ob0";
	publicvariable "o0";
	sleep 1;
};

if (_scriptcall == "objective1") then
{
	"1" objstatus "done";
	stealth=2;
};

if (_scriptcall == "66down") then
{
	sleep 5;

	Zulu sideChat "Alpha1, Alpha1, this is Zulu. Sierra66 is down. Over.";

	playsound "zulu_say_66_down"
};

if (_scriptcall == "67down") then
{
	sleep 5;

	Zulu sideChat "Alpha1, Alpha1, this is Zulu. Sierra67 is down. Over.";

	playsound "zulu_say_67_down"
};

if (_scriptcall == "det") then
{
	if (stealth == 0) then
	{
		stealth=1;
	};

	if (stealth == 1) then
	{
		"1" objstatus "failed";
	};

	if (alive Ap5) then
	{
		aP5 sideChat "Damn, contact South!";
	};

	if (alive Ap5) then
	{
		aP5 say "det1";
	};

	sleep 4;
	if (alive Ap2) then
	{
		aP2 sideChat "Enemy attacking..";
	};

	if (alive Ap2) then
	{
		aP2 say "det2";
	};
	sleep 7;

	if (alive ap) then
	{
		aP sideChat "Zulu, Zulu, this is Alpha1. Contact! We're under fire. Request support. Over.";
	};

	if (alive ap) then
	{
		aP say "det3";
	};
	sleep 9;
	Zulu sideChat "Roger, Alpha1. Contact Sierra66 for support. Over.";
	playsound "det4";
	sleep 8;
};

if (_scriptcall == "gunships") then
{
	if (alive ap) then
	{
		aP sideChat "Sierra6, Sierra6. This is Alpha1, request support at target, I say again request support at target. Over.";
	};

	if (alive ap) then
	{
		aP say "alpharequestsupport";
	};
	sleep 13;

	Wolf1 sideChat "Alpha1, Alpha1. This is Sierra66. Roger. On the way target position. Out.";
	playsound "sierraotw";
};

if (_scriptcall == "evac") then
{
	if (alive ap) then
	{
		aP sideChat "Kilo1, Kilo1. This is Alpha1, request move to Xray. over.";
	};

	if (alive ap) then
	{
		ap say "alphaextract";
	};
	sleep 5;

	Kilo sideChat "Alpha1, Alpha1. This is Kilo1. Roger. On the way. Out.";

	playsound "kilootw"
};

if (_scriptcall == "radiocheck") then
{
	if (alive ap) then
	{
		aP sideChat "Zulu. Zulu. This is Alpha1. Request Romeo Charlie. Over?";
	};

	if (alive ap) then
	{
		aP say "radiocheckalpha";
	};
	sleep 8;

	Zulu sideChat "Alpha1, this is Zulu. Report is Lima Charlie. Zulu Out.";

	playsound "radiocheckzulu";

	sleep 6;
};

if (_scriptcall == "vcidown") then
{
	if (alive Ap) then
	{
		aP sideChat "Zulu, Zulu, This is Alpha1, target down. I say again, target is down. Over";
	};

	if (alive Ap) then
	{
		aP say "apsaytrgtdown";
	};

	sleep 5;

	Homeplate sideChat "Alpha1, Alpha1, this is Zulu. Roger, target is down. Over.";

	playsound "zulusaytrgtdown";
};

if (_scriptcall == "informant") then
{
	if (alive informant) then
	{
		informant sideChat "Chieu hoi! Chieu hoi!";
	};

	if (alive informant) then
	{
		playsound "viet_hit4";
	};

	sleep 5;
	cuttext ["Prisoner secured.", "PLAIN DOWN", 2];

	"2" objstatus "done";
	"obj3" SetMarkerType "pickup";
	"3" objstatus "active";
};

if (_scriptcall == "intel") then
{
	sleep 5;
	cuttext ["Intel discovered.", "PLAIN DOWN", 2];
	"3" objstatus "done";
};
