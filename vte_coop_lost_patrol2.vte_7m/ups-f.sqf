// =========================================================================================================
//  Urban Patrol Script  
//  Version: 1.7.0
//  Author: Kronzky (www.kronzky.info / kronzky@gmail.com)
// =========================================================================================================
//
//  Lets a unit or group move randomly through a defined area,
//  with enhanced behaviour for enemy encounters.
//
// =========================================================================================================//
//
//  Call syntax: nul=[unit, markername] execVM "ups-f.sqf"
//
//    unit       = unit to be patrolling area
//    markername = name of rectangular marker that covers the area to be patrolled.
//                 nul=[this,"town"] execVM "ups-f.sqf"
//
//  Requires a Game Logic named "server" to work.
//  Script has to be initialized via nul=["init"] execVM "ups-f.sqs", 
//     either in the init.sqs or from the server GL.
//
// =========================================================================================================
// =========================================================================================================

// server parameters 
// how close unit has to be to target to generate a new one (as squared value)
_closeenough=100;
// how far opfors should move away if they're under attack
_safedist=75;

// *********************************************************************************************************
_exit = false;

// does the server GL exist?
if (isNil ("server")) exitWith {
	hintc "This script requires a game logic named 'server.";
};

// ***************************************** SERVER INITIALIZATION *****************************************
	// global functions
if (((_this find "INIT")!=-1) || ((_this find "init")!=-1)) then {
	VBS_randomElement = {private["_r"]; _r = random (count _this); _r = (_r - (_r mod 1)); (_this select _r)};
	VBS_getDirPos = {private["_a","_b","_from","_to","_return"]; _from = _this select 0; _to = _this select 1; _return = 0; _a = ((_to select 0) - (_from select 0)); _b = ((_to select 1) - (_from select 1)); if (_a != 0 || _b != 0) then {_return = _a atan2 _b}; if ( _return < 0 ) then { _return = _return + 360 }; _return};
	VBS_distancePosSqr = {(((_this select 0) select 0)-((_this select 1) select 0))^2 + (((_this select 0) select 1)-((_this select 1) select 1))^2};
	KRON_compassDir = {private["_d","_r","_c"]; _c=["North","NorthEast","East","SouthEast","South","SouthWest","West","NorthWest","North"]; _d=[getPosASL player,_this select 0] call VBS_getDirPos; _d=1+floor((_d-22.5)/45); _r=_c select _d; _r};
	// server functions
	KRON_randomPos = {private["_cx","_cy","_rx","_ry","_cd","_sd","_ad","_tx","_ty","_xout","_yout"];_cx=_this select 0; _cy=_this select 1; _rx=_this select 2; _ry=_this select 3; _cd=_this select 4; _sd=_this select 5; _ad=_this select 6; _tx=random (_rx*2)-_rx; _ty=random (_ry*2)-_ry; _xout=if (_ad!=0) then {_cx+ (_cd*_tx - _sd*_ty)} else {_cx+_tx}; _yout=if (_ad!=0) then {_cy+ (_sd*_tx + _cd*_ty)} else {_cy+_ty}; [_xout,_yout]};
	KRON_PosInfo = {private["_pos","_lst","_bld","_bldpos"];_pos=_this select 0; _lst=_pos nearObjects ["House",12]; if (count _lst==0) then {_bld=0;_bldpos=0} else {_bld=_lst select 0; _bldpos=[_bld] call KRON_BldPos}; [_bld,_bldpos]};
	KRON_BldPos = {private ["_bld","_bldpos","_bz","_hz"];_bld=_this select 0; _hz=2; _bi=40; _bldpos=0; while {_bi>0} do {_bz=((_bld BuildingPos _bi) select 2); if ((_bz-_hz)>.3) then {_hz=_bz; _bldpos=_bi+1;}; _bi=_bi-1;}; _bldpos;};
	KRON_OnRoad = {private["_pos","_rdidx","_lst"];_pos=_this select 0; _rdidx=_this select 1; _lst=_pos nearObjects ["House",12]; if (count _lst==0) then {_rdidx=99}; _rdidx+1};
	
	KRON_AllTroops=[];
	KRON_AllWest=[];
	KRON_AllEast=[];
	KRON_AllRes=[];
	KRON_KnownEnemy=0;
	_trg=createTrigger ["EmptyDetector", [5000,5000]]; 
	_trg setTriggerArea [20000,20000,0,false]; 
	_trg setTriggerActivation ["ANY","PRESENT",false]; 
	_trg setTriggerTimeout [1,1,1,false];
	sleep 1 + (random 1);
	_l=list _trg; 
	deleteVehicle _trg; 
	{
		if (("AllVehicles" countType [_x]>0) && (side _x != civilian)) then {
			KRON_AllTroops=KRON_AllTroops+[_x];
			_s = side _x;
			switch (_s) do {
				case west: 
					{ KRON_AllWest=KRON_AllWest+[_x]; };
				case east: 
					{ KRON_AllEast=KRON_AllEast+[_x]; };
				case resistance: 
					{ KRON_AllRes=KRON_AllRes+[_x]; };
			};
		};
	} forEach _l;
	_l = nil;
	
	if (isNil("KRON_UPS_Debug")) then {KRON_UPS_Debug=0};
	KRON_HQ=server;
	KRON_UPS_INIT=true;
	KRON_UPS_Instances=0;
	KRON_UPS_Total=0;
	KRON_UPS_Exited=0;
	//player globalChat "initialized";
	_exit=true;
};
if (_exit) exitWith {};

// ---------------------------------------------------------------------------------------------------------

// unit that's moving
_obj = _this select 0;		
_exit = true;		
_npc = _obj;
if (typename _obj=="OBJECT") then {
	if (alive _npc) then {_exit = false;}		
} else {
	if (count _obj==0) then {
		_exit=true;
	} else {
		{if (alive _x) then {_npc = _x; _exit = false;}} forEach _obj;
	};
};
//player sidechat format["%1: %2",_npc,_exit];

// get name of area marker 
_areamarker = _this select 1;
if (isNil ("_areamarker")) exitWith {
	hintc "Area marker not defined.\n(Name not enclosed in quotation marks?)";
};	
// remember center position of area marker
_centerpos = getMarkerPos _areamarker;
_centerX = abs(_centerpos select 0);
_centerY = abs(_centerpos select 1);

// show area marker 
_showmarker = if (((_this find "SHOWMARKER")!=-1) || ((_this find "showmarker")!=-1)) then {"SHOWMARKER"} else {"HIDEMARKER"};
if (_showmarker=="HIDEMARKER") then {_areamarker setmarkerpos [-abs(_centerX),-abs(_centerY)]};

// ***************************************** PLAYER INITIALIZATION *****************************************
if !(local server) then {
	_exit=true;
	// more to come... eventually...
};
if (_exit) exitWith {};

// ---------------------------------------------------------------------------------------------------------
	
waitUntil {KRON_UPS_INIT};
sleep (random 1);

// give this group a unique index
_grpidx = format["%1",round(random(100000))];
_grpname = format["%1_%2",(side _npc),_grpidx];

// remember the original group members, so we can later find a new leader, in case he dies
_members = units _npc;
//hint format["%1",_members];

//player globalChat format["%1:%2",KRON_UPS_Instances, count _members];
KRON_UPS_Instances =	KRON_UPS_Instances + 1;
KRON_UPS_Total = KRON_UPS_Total + (count _members);

// is unit infantry ?
_isman = if ("Man" countType [_npc]>0) then {true} else {false};
_iscar = if ("LandVehicle" countType [_npc]>0) then {true} else {false};
_isboat = if ("Ship" countType [_npc]>0) then {true} else {false};
_isplane = if ("Air" countType [_npc]>0) then {true} else {false};

// check to see whether group is an enemy of the player (for attack and avoidance maneuvers)
// since countenemy doesn't count vehicles, and also only counts enemies if they're known, we just have to brute-force it for now, and declare *everyone* an enemy who isn't a civilian
_issoldier = if (side _npc != civilian) then {true} else {false};

_friends=[];
_enemies=[];	
//TODO: FIND A WAY TO DETERMINE ASSOCIATION OF RESISTANCE UNITS
if (_issoldier) then {
	switch (side _npc) do {
		case west:
			{ _friends=_friends+KRON_AllWest; _enemies=_enemies+KRON_AllEast+KRON_AllRes; };
		case east:
			{ _friends=_friends+KRON_AllEast; _enemies=_enemies+KRON_AllWest+KRON_AllRes; };
		case resistance:
			{ _enemies=_enemies+KRON_AllEast+KRON_AllWest; };
	};
	_friends=_friends-[_npc];
	if (KRON_UPS_Debug==3) then {hint format["[%1]:\nfriends (%2):%3\nenemies (%4):%5",_npc,count _friends,_friends,count _enemies,_enemies]};
};
//player globalChat format["%1:%2",count _friends,count _enemies];
sleep .1;

// global unit variable to externally influence script 
_named = false;
_npcname = str(side _npc);
if (((_this find "NAMED")!=-1) || ((_this find "named")!=-1)) then {
	_named = true;
	_npcname = format["%1",_npc];
	_grpidx = _npcname;
};
// create global variable for this group
call compile format ["KRON_UPS_%1=1",_npcname];

// X/Y range of target area
_areasize = getMarkerSize _areamarker;
_rangeX = _areasize select 0;
_rangeY = _areasize select 1;
// marker orientation (needed as negative value!)
_a=-1; _areadir=0;
// _areadir = (markerDir _areamarker) * -1;
//  NO GETMARKERDIR IN ARMA YET, so we have to use [...,"ROT:",15]
{_a=_a+1; _v=format["%1",_this select _a]; if ((_v=="ROT:") || (_v=="rot:")) then {_areadir=(_this select _a+1)*-1}} foreach _this;
sleep .1;

// remember some trig calculations
_cosdir=cos(_areadir);
_sindir=sin(_areadir);

// minimum distance of new target position
_mindist=(_rangeX^2+_rangeY^2)/4;
if (_rangeX==0) exitWith {
	hintc format["Cannot patrol Sector: %1\nArea Marker doesn't exist",_areamarker]; 
};
//hint format["%1,%2,%3,%4",_areamarker,isNil ("_areamarker"),_rangeX,_rangeY];

// set first target to current position (so we'll generate a new one right away)
_currPos = getPosASL _npc;
_avoidPos = [0,0];
_flankPos = [0,0];
_attackPos = [0,0];

_dist = 0;
_lastdist = 0;
_lastmove1 = 0;
_lastmove2 = 0;
_maxmove=0;
_moved=0;

_damm=0;
_dammchg=0;
_lastdamm = 0;
_timeontarget = 0;
_waiting = 0;

_fightmode = "walk";
_fm=0;
_gothit = false;
_react = 99;
_lastdamage = 0;
_lastknown = 0;
_opfknowval = 0;

_sin90=1; _cos90=0;
_sin270=-1; _cos270=0;

// set target tolerance high for choppers & planes
if (_isplane) then {_closeenough=5000};

sleep .1;
// ***************************************** optional arguments *****************************************

// wait at patrol end points
_pause = if (((_this find "NOWAIT")!=-1) || ((_this find "nowait")!=-1)) then {"NOWAIT"} else {"WAIT"};

// drop units at random positions
_initpos = "ORIGINAL";
if (((_this find "RANDOM")!=-1) || ((_this find "random")!=-1)) then {_initpos = "RANDOM"};
if (((_this find "RANDOMUP")!=-1) || ((_this find "randomup")!=-1)) then {_initpos = "RANDOMUP"}; 
if (((_this find "RANDOMDN")!=-1) || ((_this find "randomdn")!=-1)) then {_initpos = "RANDOMDN"}; 
// don't position groups or vehicles on rooftops
if ((_initpos!="ORIGINAL") && ((!_isman) || (count _members)>1)) then {_initpos="RANDOMDN"};

// share enemy info 
_shareinfo = if (((_this find "NOSHARE")!=-1) || ((_this find "noshare")!=-1)) then {"NOSHARE"} else {"SHARE"};
_sharedist = 50*50;

// set behaviour modes (or not)
_noslow = if (((_this find "NOSLOW")!=-1) || ((_this find "noslow")!=-1)) then {"NOSLOW"} else {"SLOW"};
if (_noslow!="NOSLOW") then {_npc setbehaviour "safe"; _npc setspeedmode "limited";}; 
// remember the original speed
_defspeed = speedmode _npc;
sleep .1;

// make start position random 
_stayput=false;
if (_initpos!="ORIGINAL") then {
	// find a random position (try a max of 20 positions)
	_try=0;
	_bld=0;
	_bldpos=0;
	while {_try<20} do {
		_currPos=[_centerX,_centerY,_rangeX,_rangeY,_cosdir,_sindir,_areadir] call KRON_randomPos;
		_posinfo=[_currPos] call KRON_PosInfo;
		// _posinfo: [0,0]=no house near, [obj,-1]=house near, but no roof positions, [obj,pos]=house near, with roof pos
		_bld=_posinfo select 0;
		_bldpos=_posinfo select 1;
		if (_isplane || _isboat || !(surfaceiswater _currPos)) then {
			if (((_initpos=="RANDOM") || (_initpos=="RANDOMUP")) && (_bldpos>0)) then {_try=99};
			if (((_initpos=="RANDOM") || (_initpos=="RANDOMDN")) && (_bldpos==0)) then {_try=99};
		};
		_try=_try+1;
	};
	if (_bldpos==0) then {
		if (_isman) then {
			{_x setpos _currPos} foreach units _npc;
		} else {
			_npc setpos _currPos;
		};
	} else {
	// put the unit on top of a building
		_npc setPos (_bld buildingPos _bldpos-1); 
		_currPos = getPosASL _npc;
		_stayput=true; 
		if (KRON_UPS_Debug==3) then {player globalChat format["%1:%2",_bld,_bldpos-1]};
	};
};
sleep .1;

// "area cleared" trigger activator
_areatrigger = if (((_this find "TRIGGER")!=-1) || ((_this find "trigger")!=-1)) then {"TRIGGER"} else {"NOTRIGGER"};

// suppress fight behaviour
if (((_this find "NOAI")!=-1) || ((_this find "noai")!=-1)) then {_issoldier=false};

// adjust cycle delay 
_a=-1; _cycle=5;
{_a=_a+1; _v=format["%1",_this select _a]; if ((_v=="CYCLE:") || (_v=="cycle:")) then {_cycle=(_this select _a+1)}} foreach _this;

// how many group clones?
_a=-1; _mincopies=0;
{_a=_a+1; _v=format["%1",_this select _a]; if ((_v=="MIN:") || (_v=="min:")) then {_mincopies=(_this select _a+1)}} foreach _this;
_a=-1; _maxcopies=0;
{_a=_a+1; _v=format["%1",_this select _a]; if ((_v=="MAX:") || (_v=="max:")) then {_maxcopies=(_this select _a+1)}} foreach _this;
if (_mincopies>_maxcopies) then {_maxcopies=_mincopies};
if (_maxcopies>0) then {
	_copies=_mincopies+random (_maxcopies-_mincopies);
	// any init strings?
	_a=-1; _initstr="";
	{_a=_a+1; _v=format["%1",_this select _a]; if ((_v=="INIT:") || (_v=="init:")) then {_initstr=(_this select _a+1)}} foreach _this;
	
	// create the clones
	for "_grpcnt" from 1 to _copies do {
		//KRON_HQ globalChat format["creating clone %1 of %2",_grpcnt,_copies];
		// copy groups
		if (isNil ("KRON_grpindex")) then {KRON_grpindex = 0}; 
		KRON_grpindex = KRON_grpindex+1;
		// copy group leader
		_unittype=typeof _npc;
		// make the clones civilians
		if ((_this find "CLONECIV")!=-1) then {_unittype="Citizen"};
		// use random Civilian models for single unit groups
		if ((_unittype=="Citizen") && (count _members==1)) then {_rnd=1+round(random 20); if (_rnd>1) then {_unittype=format["Civilian%1",_rnd]}};
		npc=_npc;
		call compile format["""%1"" createunit [getPosASL _npc,group npc,'grp%2=this;this setbehaviour behaviour npc;this setspeedmode speedmode npc;%3'];",_unittype,KRON_grpindex,_initstr];
		_lead=_npc; call compile format["_lead=grp%1",KRON_grpindex];
		[_lead] join grpNull; [_lead] join _lead;
		// copy team members (skip the leader)
		_c=0;
		{_c=_c+1;if (_c>1) then {(typeof _x) createunit [getPosASL _x,group _lead,_initstr,skill _x,"PRIVATE"]}} foreach _members;
		_nul=[_lead,_areamarker,_pause,_noslow,_initpos,_areatrigger,_track,_showmarker,_shareinfo] execVM "ups-f.sqf";
		sleep .1;
	};
};
sleep .1;

// create area trigger
_trgside = switch (side _npc) do { case west: {"WEST"}; case east: {"EAST"}; case resistance: {"GUER"}; case civilian: {"CIV"};};
_trgname="KRON_Trig_"+_areamarker;
_flgname="KRON_Cleared_"+_areamarker;
// has the trigger been created already?
KRON_TRGFlag=-1;
call compile format["%1=false",_flgname];
call compile format["KRON_TRGFlag=%1",_trgname];
if (isNil ("KRON_TRGFlag")) then {
	// trigger doesn't exist yet, so create one (make it a bit bigger than the marker, to catch path finding 'excursions' and flanking moves)
	call compile format["%1=createTrigger[""EmptyDetector"",_centerpos]",_trgname];
	call compile format["%1 setTriggerArea[_rangeX*1.5,_rangeY*1.5,_areadir,true]",_trgname];
	call compile format["%1 setTriggerActivation[_trgside,""NOT PRESENT"",true]",_trgname];
	call compile format["%1 setEffectCondition ""true""",_trgname];
	if (_areatrigger!="NOTRIGGER") then {
		call compile format["%1 setTriggerStatements[""this"", ""titletext [""""SECTOR <%2> CLEARED"""",""""PLAIN""""];""""%2"""" setmarkerpos [-%4,-%5];%3=true;"", ""titletext [""""SECTOR <%2> HAS BEEN RE-OCCUPIED"""",""""PLAIN""""];""""%2"""" setmarkerpos [%4,%5];%3=false;""]", _trgname,_areamarker,_flgname,_centerX,_centerY];
	} else {
		call compile format["%1 setTriggerStatements[""this"", ""%2=true;"", ""%2=false;""]", _trgname,_flgname];
	};
};
sleep .1;

// track unit
_track = 	if (((_this find "TRACK")!=-1) || ((_this find "track")!=-1) || (KRON_UPS_Debug>0)) then {"TRACK"} else {"NOTRACK"};
_trackername = "";
_destname = "";
if (_track=="TRACK") then {
	_track = "TRACK";
	_trackername=format["trk_%1",_grpidx];
	_markerobj = createMarker[_trackername,[0,0]];
	_markerobj setMarkerShape "ICON";
	_trackername setMarkerType "WTF_DOT";
	_markercolor = switch (side _npc) do {
		case west: {"ColorGreen"};
		case east: {"ColorRed"};
		case resistance: {"ColorBlue"};
		default {"ColorBlack"};
	};
	_trackername setMarkerColor _markercolor;
	_trackername setMarkerText format["%1",_grpidx];
	_trackername setmarkerpos _currPos; 
	
	_destname=format["dest_%1",_grpidx];
	_markerobj = createMarker[_destname,[0,0]];
	_markerobj setMarkerShape "ICON";
	_destname setMarkerType "WTF_FLAG";
	_destname setMarkerColor _markercolor;
	_destname setMarkerText format["%1",_grpidx];
	_destname setMarkerSize [.5,.5];
};	
sleep .1;

// init done
_makenewtarget=true;
_newpos=false;
_targetPos = _currPos;

// unit is on roof - don't patrol
if (_stayput) then {_exit=true};

// exit if something went wrong during initialization
if (_exit) exitWith {};

// ***********************************************************************************************************
// ************************************************ MAIN LOOP ************************************************

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do {
	sleep .1;
	_timeontarget=_timeontarget+_cycle;
	_react=_react+_cycle;
	//KRON_HQ globalChat format["loop: %1",round(time)];
			
	// current position
	_currPos = getPosASL _npc; _currX = _currPos select 0; _currY = _currPos select 1;
	if (_track=="TRACK") then { _trackername setmarkerpos _currPos; };
	
		
	// did anybody get hit in the opfor group?
	_newdamage=0; 
	{
		if((damage _x)>0.2) then {
			_newdamage=_newdamage+(damage _x); 
			// damage has increased since last round
			if (_newdamage>_lastdamage) then {
				_lastdamage=_newdamage; 
				_gothit=true;
			};
			_hitPos=getPosASL _x; 
			if (!alive _x) then {
				_members=_members-[_x]; 
				_friends=_friends-[_x]; 
				KRON_AllTroops=KRON_AllTroops-[_x];
			};
		};
	} foreach _members;
	sleep .1;
	
	// nobody left alive, exit routine
	if (count _members==0) then {_exit=true};
	// did the leader die?
	if (!alive _npc) then {
		_npc = _members select 0; 
		if (isPlayer _npc) then {_exit=true};
	};
	
	// if the group is a civilian we don't have to bother checking for enemy encounters
	if ((_issoldier) && ((count _enemies)>0)) then {

		_hitPos=[0,0,0];
		// if the leader comes across another unit that's either injured, dead or in combat mode, go into combat mode as well. If the other person is still alive, share enemy information.
		if ((_shareinfo=="SHARE") && (behaviour _npc=="SAFE")) then {
			_others=_friends-_members;
			{
				if ((_npc knowsabout _x>3) && (_npc countEnemy [_x]>0)) then {
					if ((damage _x>.5) || (behaviour _x!="SAFE")) then {
						_npc setbehaviour "combat"; 
						_gothit=true; 
						_hitPos=getPosASL _x; 
						if (alive _x) then {_npc reveal KRON_KnownEnemy}; 
					};
				};
			} foreach _others;
		};
		sleep .1;
			
		// did the group spot an enemy?
		KRON_KnownEnemy=_npc; 
		_lastknown=_opfknowval;
		_opfknowval=0; 
		_maxknowledge=0;
		{
			_knows=_npc knowsabout _x; 
			if((alive _x) && (_knows>0.2) && (_npc countEnemy [_x]>0)) then {
				KRON_KnownEnemy=_x; 
				_opfknowval=_opfknowval+_knows; 
				if (_knows>_maxknowledge) then {_maxknowledge=_knows};
			};
			if (!alive _x) then {_enemies=_enemies-[_x]};
		} foreach _enemies;
		//player globalChat format["%1:%2",_npc,count _enemies];
		sleep .1;
		
		_pursue=false;
		// opfor spotted an enemy or got shot, so start pursuit
		if (_opfknowval>_lastknown || _gothit) then {_pursue=true};
		// don't react to new fatalities if less than 60 seconds have passed since the last one
		if ((_react<60) && (_fightmode!="walk")) then {_pursue=false};

		if (KRON_UPS_Debug==3) then {KRON_HQ globalChat format["%1: knowledge:%2, gothit:%3",_npc,_opfknowval,_gothit]};
	
		if (_pursue) then	{
				if (KRON_UPS_Debug==3) then {KRON_HQ globalChat format["%1 target contact",_npc]};

			// make the exactness of the target dependend on the knowledge about the shooter
			_accuracy=16-(_maxknowledge^2);
			// even though opfor got hit, he sometimes doesn't get the shooter info right away, so we'll just assume that it was the player
			if (KRON_KnownEnemy==_npc) then {KRON_KnownEnemy=player; _accuracy=100};
			_offsx=_accuracy/2-random _accuracy; _offsY=_accuracy/2-random _accuracy;
			
			// get position of spotted unit in player group, and watch that spot
			_bluPos = [(getPosASL KRON_KnownEnemy select 0) + _offsX, (getPosASL KRON_KnownEnemy select 1) + _offsY];
			_bluX = _bluPos select 0; _bluY = _bluPos select 1;
			{_x dowatch _bluPos} foreach units _npc;
			sleep .1;			

			// also go into "combat mode"
			_npc setspeedmode "full"; _npc setbehaviour "combat";
			_pause="NOWAIT";
			_waiting=0;
			
			// angle from unit to target
			_dir1 = [_currPos,_bluPos] call VBS_getDirPos;
			// angle from target to unit
			_dir2 = if (_dir1>180) then {_dir1-180} else {_dir1+180};
			// angle from fatality to target
			_dir3 = if (_hitPos select 0!=0) then {[_hitPos,_targetPos] call VBS_getDirPos} else {_dir1};
			_dd=(_dir3-_dir1);
			
			// unit position offset straight towards target
			_relUX = sin(_dir1)*_safedist; _relUY = cos(_dir1)*_safedist;
			// target position offset straight towards unit
			_relTX = sin(_dir2)*_safedist; _relTY = cos(_dir2)*_safedist;
			// go either left or right (depending on location of fatality - or randomly if no fatality)
			_sinU=_sin90; _cosU=_cos90; _sinT=_sin270; _cosT=_cos270;
			if ((_dd<0 && _dd>-180) || (_dd==0 && (random 1)>.5)) then {_sinU=_sin270; _cosU=_cos270; _sinT=_sin90; _cosT=_cos90};
			
			// avoidance position (right or left of unit)
			_avoidX = _currX + _cosU*_relUX - _sinU*_relUY;
			_avoidY = _currY + _sinU*_relUX + _cosU*_relUY;
			_avoidPos = [_avoidX,_avoidY];
			// flanking position (right or left of target)
			_flankX = _bluX + _cosT*_relTX - _sinT*_relTY;
			_flankY = _bluY + _sinT*_relTX + _cosT*_relTY;
			_flankPos = [_flankX,_flankY];
			// final target position
			_attackPos = _bluPos;
			// for now we're stepping a bit to the side
			_targetPos = _avoidPos;
			
			_react=0;
			_fightmode="fight";
			_fm=1;
			if (KRON_UPS_Debug==3) then {
				KRON_HQ globalChat format["%1 approaching target",_npc];
				"dead" setmarkerpos _hitPos; "avoid" setmarkerpos _avoidPos; "flank" setmarkerpos _flankPos; "target" setmarkerpos _bluPos;
			};
			_newpos=true;
		};
	}; 
	sleep .1;
	
	if !(_newpos) then {
		// calculate new distance
		// if we're waiting at a waypoint, no calculating necessary
		if (_waiting<=0) then {
			// distance to target
			_dist = [_currPos,_targetPos] call VBS_distancePosSqr;
			if (KRON_UPS_Debug==1) then {KRON_HQ globalChat format["[%1] dist:%2, lastd:%3, moved:%4, lastm1:%5, lastm2:%6, mode:%7",_grpidx,round(_dist),round(_lastdist),round(_moved),round(_lastmove1),round(_lastmove2),_fightmode];};
			if (_lastdist==0) then {_lastdist=_dist};
			_moved = abs(_dist-_lastdist);
			// adjust the target tolerance for fast moving vehicles
			if (_moved>_maxmove) then {_maxmove=_moved; if ((_maxmove/40) > _closeenough) then {_closeenough=_maxmove/40}};
			if (KRON_UPS_Debug==2) then {KRON_HQ globalChat format["[%1] dist:%2, moved:%3, tol:%4, mode:%5",_grpidx,_dist,_maxmove,_closeenough,_fightmode];};
			// how much did we move in the last three cycles?
			_totmove=_moved+_lastmove1+_lastmove2;
			_damm = damage _npc;
			// is our damage changing (increasing)?
			_dammchg = abs(_damm - _lastdamm);
			
			// we're either close enough, seem to be stuck, or are getting damaged, so find a new target 
			if ((_dist<=_closeenough) || (_totmove<.2) || (_dammchg>0.01) || (_timeontarget>180)) then {_makenewtarget=true;};

			// in 'attack (approach) mode', so follow the flanking path (don't make it too predictable though)
			if ((_fightmode!="walk") && (_dist<=_closeenough)) then {
				if ((random 1)<.95) then {
					if (_flankPos select 0!=0) then {
						_targetPos=_flankPos; _flankPos=[0,0]; _makenewtarget=false; _newpos=true;
						if (KRON_UPS_Debug==1) then {KRON_HQ globalChat format ["[%1] flanking",_grpidx]};
						_fm=1;
					} else {
						if (_attackPos select 0!=0) then {
							_targetPos=_attackPos; _attackPos=[0,0]; _makenewtarget=false; _newpos=true;
							if (KRON_UPS_Debug==1) then {KRON_HQ globalChat format ["[%1] attacking",_grpidx]};
							_fm=2;
						};
					};
				};
			};
			sleep .1;

			// make new target
			if (_makenewtarget) then {
				if (KRON_UPS_Debug==1) then {KRON_HQ globalChat format["[%1] new target (%2)",_grpidx,_waiting];};
				// re-read marker position/size
				_centerpos = getMarkerPos _areamarker; _centerX = abs(_centerpos select 0); _centerY = abs(_centerpos select 1);
				_areasize = getMarkerSize _areamarker; _rangeX = _areasize select 0; _rangeY = _areasize select 1;
				// find a new target that's not too close to the current position
				_targetPos=_currPos;
				_tries=0;
				while {((([_currPos,_targetPos] call VBS_distancePosSqr) < _mindist)) && (_tries<20)} do {
					_tries=_tries+1;
					// generate new target position (on the road)
					_road=0;
					while {_road<20} do {
						_targetPos=[_centerX,_centerY,_rangeX,_rangeY,_cosdir,_sindir,_areadir] call KRON_randomPos; 
						_road=[_targetPos,_road] call KRON_OnRoad;
						sleep .1;			
					};
					if (KRON_UPS_Debug==1) then {KRON_HQ globalChat format["[%1] new pos:%2,%3, dist:%4 (%5)",_grpidx,_road,_targetPos,([_currPos,_targetPos] call VBS_distancePosSqr),_mindist];};
				};
				_avoidPos = [0,0]; _flankPos = [0,0]; _attackPos = [0,0];
				_gothit=false;
				_fightmode="walk";
				_fm=0;
				_npc setspeedmode _defspeed;
				_newpos=true;

				// if we're waiting at patrol end points then don't create a new target right away. Keep cycling though to check for enemy encounters
				if ((_pause!="NOWAIT") && (_waiting<0)) then {_waiting = (15 + random 20)};
			};
		};
	};
	sleep .1;
	
	_waiting = _waiting - _cycle;
	if ((_waiting<=0) && _newpos) then {
		if (KRON_UPS_Debug==1) then {
			KRON_HQ globalChat format["[%1] move to new position",_grpidx];
			//mrk setPos _targetPos;
		};
		// tell unit about new target position
		//if (_fightmode=="walk") then {{_x move _targetPos} foreach _members} else {{_x domove _targetPos} foreach _members};
		if (_fightmode=="walk") then {_npc move _targetPos} else {_npc domove _targetPos};
		if (_track=="TRACK") then { 
			switch (_fm) do {
				case 1: 
					{_destname setmarkerSize [.4,.4]};
				case 2: 
					{_destname setmarkerSize [.6,.6]};
				default
					{_destname setmarkerSize [.5,.5]};
			};
			_destname setMarkerPos _targetPos;
		};
		_dist=0; _moved=0; _lastmove1=10; _timeontarget=0; _waiting=-1; 
		_newpos=false;
	};
	
	// move on
	_lastdist = _dist; _lastmove2 = _lastmove1; _lastmove1 = _moved; _lastdamm = _damm;

	// check external loop switch
	_cont = (call compile format ["KRON_UPS_%1",_npcname]);
	if (_cont==0) then {_exit=true};
	
	_makenewtarget=false;
	if ((_exit) || (isNil("_npc"))) then {
		_loop=1;
	} else {
		sleep _cycle;
	};
};

if !(isNil("_npc")) then {
	{doStop _x; _x domove getPosASL _x; _x move getPosASL _x} forEach _members;
};

if (KRON_UPS_Debug>0) then { KRON_HQ globalChat format["%1 (%3) exited (%2th)",_npc,KRON_UPS_Exited,_grpname];};

KRON_UPS_Exited=KRON_UPS_Exited+1;
if (_track=="TRACK") then {
	_trackername setMarkerType "WTF_Dotbluforkill";
	_destname setMarkerType "Empty";
};
_friends=nil;
_enemies=nil;
