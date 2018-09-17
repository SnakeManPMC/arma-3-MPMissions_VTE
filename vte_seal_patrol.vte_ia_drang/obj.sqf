/*; SEAL PATROL
; SEB NAM Mission
; by Nagual 2002
*/

private _scriptcall = _this select 1;

if (_scriptcall == "objective0") then
{
	"0" objstatus "done";
	"r0" setmarkercolor "colorblue";
	ob0=false;
	o0=true;
	publicvariable "ob0";
	publicvariable "o0";
	leader ops sidechat "OK, we have found some boats.";
};

if (_scriptcall == "objective1") then
{
	"1" objstatus "done";
	"r1" setmarkercolor "colorblue";
	"r1m" setmarkercolor "colorblue";
	ob1=false;
	o1=true;
	publicvariable "ob1";
	publicvariable "o1";
	leader ops sidechat "Crash site located, looks like no survivors.";
	sleep 5;
	leader ops groupchat "Grab some claymores team.";
};

if (_scriptcall == "objective2") then
{
	"2" objstatus "done";
	"r2" setmarkercolor "colorblue";
	"r2m" setmarkercolor "colorblue";
	ob2=false;
	o2=true;
	publicvariable "ob2";
	publicvariable "o2";
	leader ops sidechat "Its too hot to count bodies, but at least half of the NVA convoy have to be dead by now!";
	sleep 4;
	boss sidechat "Roger SEAL team, get back across the river to the LZ, UH1 is ready for takeoff.";
	sleep 3;
	convoygrp1 move getpos evac;
	convoygrp2 move getpos evac;
	convoygrp3 move getpos evac;
	
	convoygrp1 allowfleeing 0;
	convoygrp2 allowfleeing 0;
	convoygrp3 allowfleeing 0;

	if (local server) then
	{
		"VTE_vcofficer" createUnit [combat0_1,rg1," "];
		"VTE_vcrpg" createUnit [combat0_1,rg1," "];
		"VTE_vcsoldier" createUnit [combat0_1,rg1," "];
		"VTE_vcsoldier" createUnit [combat0_1,rg1," "];
		"VTE_vcsoldier" createUnit [combat0_1,rg1," "];
		"VTE_vcsoldier" createUnit [combat0_1,rg1," "];
		"VTE_vcsoldier" createUnit [combat0_1,rg1," "];
		"VTE_vcmg" createUnit [combat0_1,rg1," "];
		"VTE_vcmg" createUnit [combat0_1,rg1," "];
		
		"VTE_nvaofficer" createUnit [combat0_2,rg2," "];
		"VTE_nvarto" createUnit [combat0_2,rg2," "];
		"VTE_vcsoldier" createUnit [combat0_2,rg2," "];
		"VTE_nvasoldier" createUnit [combat0_2,rg2," "];
		"VTE_nvasoldier" createUnit [combat0_2,rg2," "];
		"VTE_nvasoldier" createUnit [combat0_2,rg2," "];
		"VTE_nvamg" createUnit [combat0_2,rg2," "];
		"VTE_nvamg" createUnit [combat0_2,rg2," "];
	};
};

if (_scriptcall == "objective3") then
{
	"3" objstatus "done";
	"r3" setmarkercolor "colorblue";
	"r3m" setmarkercolor "colorblue";
	ob3=false;
	o3=true;
	publicvariable "ob3";
	publicvariable "o3";
	leader ops sidechat "We're all in, GO, GO, GO!";
	var_cancel_landing = helo1;
	publicvariable "var_cancel_landing";
	helo1 flyinheight 30;
};

if (_scriptcall == "objective4") then
{
	"4" objstatus "done";
	"r4" setmarkercolor "colorblue";
	"r4m" setmarkercolor "colorblue";
	ob4=false;
	o4=true;
	publicvariable "ob4";
	publicvariable "o4";
	leader ops sidechat "Objective Complete";
};

if (_scriptcall == "objective5") then
{
};

if (_scriptcall == "objective6") then
{
};

if (_scriptcall == "extract") then
{
	rg1 move getpos rg1m;
	rg2 move getpos rg2m;
	convoygrp1 move getpos cm;
	convoygrp2 move getpos cm;
	convoygrp3 move getpos cm;
};

if (_scriptcall == "nvacamp") then
{
	if (local server) then
	{
		_ambush1= [(getpos leader ops select 0)+100, (getpos leader ops select 1)+100, (getpos leader ops select 2)];
		_ambush2= [(getpos leader ops select 0)-100, (getpos leader ops select 1)-100, (getpos leader ops select 2)];
		_ambush3= [(getpos leader ops select 0)-100, (getpos leader ops select 1)+100, (getpos leader ops select 2)];
		"VTE_nvaofficer" createUnit [_ambush1,ag1," "];
		"VTE_vcsoldier" createUnit [_ambush1,ag1," "];
		"VTE_vcsoldier" createUnit [_ambush1,ag1," "];
		"VTE_nvasoldier" createUnit [_ambush1,ag1," "];
		"VTE_nvasoldier" createUnit [_ambush1,ag1," "];
		"VTE_nvasoldier" createUnit [_ambush1,ag1," "];
		"VTE_nvamg" createUnit [_ambush1,ag1," "];
		"VTE_nvamg" createUnit [_ambush1,ag1," "];
		
		"VTE_nvaofficer" createUnit [_ambush2,ag2," "];
		"VTE_vcsoldier" createUnit [_ambush2,ag2," "];
		"VTE_vcsoldier" createUnit [_ambush2,ag2," "];
		"VTE_nvasoldier" createUnit [_ambush2,ag2," "];
		"VTE_nvasoldier" createUnit [_ambush2,ag2," "];
		"VTE_nvasoldier" createUnit [_ambush2,ag2," "];
		"VTE_nvamg" createUnit [_ambush2,ag2," "];
		"VTE_nvamg" createUnit [_ambush2,ag2," "];
		
		"VTE_nvaofficer" createUnit [_ambush3,ag3," "];
		"VTE_vcsoldier" createUnit [_ambush3,ag3," "];
		"VTE_vcsoldier" createUnit [_ambush3,ag3," "];
		"VTE_nvasoldier" createUnit [_ambush3,ag3," "];
		"VTE_nvasoldier" createUnit [_ambush3,ag3," "];
		"VTE_nvasoldier" createUnit [_ambush3,ag3," "];
		"VTE_nvamg" createUnit [_ambush3,ag3," "];
		"VTE_nvamg" createUnit [_ambush3,ag3," "];
		
		ag1 setbehaviour "stealth";
		ag2 setbehaviour "stealth";
		ag3 setbehaviour "stealth";
		ag1 setcombatmode "red";
		ag2 setcombatmode "red";
		ag3 setcombatmode "red";
		ag1 move getpos leader ops;
		ag2 move getpos leader ops;
		ag3 move getpos leader ops;
		sleep 15;
		ag1 move getpos leader ops;
		ag2 move getpos leader ops;
		ag3 move getpos leader ops;
		sleep 15;
		ag1 move getpos leader ops;
		ag2 move getpos leader ops;
		ag3 move getpos leader ops;
		sleep 15;
		ag1 move getpos leader ops;
		ag2 move getpos leader ops;
		ag3 move getpos leader ops;
		sleep 15;
		ag1 move getpos leader ops;
		ag2 move getpos leader ops;
		ag3 move getpos leader ops;
		sleep 15;
		ag1 move getpos leader ops;
		ag2 move getpos leader ops;
		ag3 move getpos leader ops;
		sleep 15;
		ag1 move getpos leader ops;
		ag2 move getpos leader ops;
		ag3 move getpos leader ops;
		sleep 15;
		ag1 move getpos leader ops;
		ag2 move getpos leader ops;
		ag3 move getpos leader ops;
	};
};

if (_scriptcall == "pink") then
{
	leader ops sidechat "Send a Pink Team to our postion HQ, enemy are close.";
	[driver pink2, gunner pink2] join driver pink1;
	pinkteam move [(getpos leader ops select 0)+(random 100), (getpos leader ops select 1)+(random 100), 40];
	pink1 flyinheight 25;
	pink2 flyinheight 50;
	pink1 setskill .5;
	pink2 setskill .5;
	waitUntil
	{
		sleep 5;
		(leader ops distance leader pinkteam < 600);
	};
	pinkteam setbehaviour "combat";
	pinkteam setcombatmode "red";
	while { (alive vehicle pink1 && alive vehicle pink2) } do
	{
		pinkteam move [(getpos leader ops select 0)+(random 100), (getpos leader ops select 1)+(random 100), 40];
		sleep 25;
	};
};

if (_scriptcall == "red") then
{
	leader ops sidechat "Requesting a cobra RED team ASAP! I will direct them to the targets.";
	sleep 8;
	[driver red1, driver red2, gunner red1, gunner red2] join leader ops;
	red1 domove getpos leader ops;
	red2 domove getpos leader ops;
	red1 setskill .5;
	red2 setskill .5;
	red1 flyinheight 30;
	red2 flyinheight 45;
};
