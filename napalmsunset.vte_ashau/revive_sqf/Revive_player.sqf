/*
  REVIVE SCRIPT - AI disabled

  Creates playable units that fall unconcious when killed which can then be revived

  � JUNE 2007 - norrin (norrins_nook@iprimus.com.au)  

  Version:  Beta 9.0h (Revivable Players - AI disabled) - 28th June 2007	                     
*******************************************************************************************************
     
  Special thanks to HulkingUnicorn for his scripting advice, testing and many suggestions
  Many thanks also to satexas69, MCPXXL, SNKMAN and sickboy for all their suggestions, advice and support and to all at the BIS forums 
  Based on concepts by PRiMe, toadlife and Mongoose_84.  Also thanks to Chris'OFP editor.
  Some of the voice arrray stuff stolen with the permission of SNKMAN from ArmA Group Link II Plus! 

-------------------------------------------------------------------------------------------------------

  See release notes for details on incorporating revive scripts in your missions

********************************************************************************************************
Start Revive_player.sqf
*/

//Do not touch these variables

private ["_revives","_revives_remain","_no_revives","_respawn","_concious","_myaction","_c","_bonus","_revives_till_bonus","_hint","_name","_bee","_mrkr","_unconcious_voice","_body","_pos","_dir","_e","_reviver","_no_respawns","_respawns_left","_no_left","_d","_near_Objects","_respawn_at_base","_unit","_units","_max_respawns","_dead","_grp","_run","_can_revive","_can_be_revived"];
_unit = _this select 0;
_units = _this select 1;
_max_respawns = _this select 2;
_respawn = false;
_concious = false;
_dead = false;
_name = call compile format["%1",_unit];
_grp = group _name;
_c = 0;
_d = 0;
_run = true;
_can_revive = can_revive;
_can_be_revived = can_be_revived;
_respawn_at_base =false;
call compile format ["say_%1 = false", _name];
//_unconcious_voice = ceil (random 9);
_bonus = 0;

//Probably best not to play with the following code unless you know what you are doing
//Set current unit status, this section will need to be changed to reflect your unit names and public variable names given in status script
sleep 0.5;
	call compile format ["if (_max_respawns  < %1_revives) then {_dead = true}", _name];
	{call compile format ["if (_name == %1 && %1_a) then {_respawn = true; _concious = true};", _x];}forEach _units;
	{call compile format ["if (isplayer %1) then {%1_unconcious = false; publicVariable ""%1_unconcious"";};", _x];}forEach _units;
	{call compile format ["if (!isplayer %1) then {%1_unconcious = true; publicVariable ""%1_unconcious"";};", _x];}forEach _units;
	{call compile format ["if (animationState %1 == ""AmovPpneMstpSnonWnonDnon_healed"" || animationState %1 == ""AmovPpneMstpSnonWnonDnon"") then {%1_unconcious = true; publicVariable ""%1_unconcious"";};", _x];}forEach _units;		

//Get and set existing unconcious markers
call compile format ["if (%1_a && unconcious_markers == 1) then 
{
	_mrker_pos = getPosASL %1;
	_mrkr_ex = ""%2 is down""; 
	createMarker [_mrkr_ex, _mrker_pos];
	_mrkr_ex setMarkerColor ""ColorBlue"";
	_mrkr_ex setMarkerType ""Flag1"";
	_mrkr_ex setMarkerText ""%2 is down"";
	_mrkr_ex setMarkerSize [0.4, 0.4];
}", _name, name _name];


//Prompt joining player the no revives remaining
if (local _name) then
{
	_revives = call compile format ["%1_revives", _name];
	_revives_remain = _max_respawns - _revives;
	_no_revives = format ["Revives remaining: %1 out of %2", _revives_remain, _max_respawns];
	hint _no_revives;
};

//initialise team kill function
if (team_kill_function == 1) then
{
	_name addeventhandler ["killed", {_this execVM "revive_sqf\team_killer.sqf"}];
};

//Body of the script
for [{}, {_run}, {_run}] do
{	
	if(!alive call compile format ["%1", _name]) then {_respawn = true; _concious = false;};
	if(!isplayer _name) exitWith {call compile format ["%1_revives = 0; publicVariable ""%1_revives""", _name]};
	
	//While player alive
	if (alive call compile format ["%1", _name] && !_respawn && !_concious && !_dead) then
	{
		_name = call compile format ["%1", _name];
		if(!isplayer _name) exitWith {call compile format ["%1_revives = 0; publicVariable ""%1_revives""", _name]};
						
		//add revive action for when player gets in range of unconcious unit
		if(_name == player && _c == 0) then
		{
			_myaction = player addAction ["Revive", "revive_sqf\heal.sqf","", 0, false, true]; 
			_c = _c + 1;
		};

		call compile format ["if (%1_killer == no_team_kills && team_kill_function == 1 && _name == player) then 
		{	_no_respawns = %1_revives + 1;
			_respawns_left = _max_respawns - _no_respawns;
			_no_left = ""You have lost a life for excessive team killing."";
			if (local _name) then {hint _no_left};
			%1_revives = _no_respawns; 
			publicVariable ""%1_revives"";
			%1_killer = 0;
			publicVariable ""%1_killer"";
		};", _name]; 
		
		//if respawn limit has been reached, define unit as dead
		call compile format ["if (_max_respawns  < %1_revives) then {_dead = true};", _name];
				
		//revive/reward function
		call compile format ["if (revive_%1 >= revives_required && reward_function ==1 && _name == player) then 
		{	_no_respawns = %1_revives - 1;
			_respawns_left = _max_respawns - _no_respawns;
			_no_left = ""You have received a bonus life for teamplay."";
			if (local _name) then {hint _no_left};
			%1_revives = _no_respawns; 
			publicVariable ""%1_revives"";
			revive_%1 = 0;
			_bonus = 0;
			publicVariable ""revive_%1"";
		};", _name];

		//prompt the number of revives required for next bonus
		if (reward_function == 1 && _bonus != call compile format ["revive_%1", _name]) then 
		{	
			_bonus = call compile format ["revive_%1", _name];
			_revives_till_bonus = revives_required - _bonus;
			_hint = format ["Revives required for next bonus: %1", _revives_till_bonus];
			if (local _name) then {hint _hint};
		};
		
		sleep 0.5;
	};

	//if player is dead	
	if (_respawn && !_concious  && !_dead) then 
	{			
		_body = call compile format ["%1", _name];
		_pos = getPosASL _body;
		_dir = getDir _body;
		
		_body switchMove "AmovPpneMstpSnonWnonDnon_healed";

		//if respawn limit has been reached, define unit as dead
		call compile format ["if (_max_respawns  <= %1_revives) then {_dead = true};", _body];
		
		//If player is down start camera
			if (_body == player && !_dead) then 
		{	
			_bee = "butterfly" createVehicle _pos;
			[_bee, _pos, _can_be_revived] exec "revive_sqf\camera_follow.sqs";
			sleep 0.1;
		};
		
		//Set current unit status unconcious, thanks to HulkingUnicorn for this code
		{call compile format ["if (_body == %1) then {%1_a = true; publicVariable ""%1_a"";};", _x];}forEach _units;
		{call compile format ["if (_body == %1) then {%1_unconcious = true; publicVariable ""%1_unconcious"";};", _x];}forEach _units;

		{doStop _x}forEach units _grp;
		enableRadio false;		
		
		//create marker at scene of unconcious player
		if (unconcious_markers == 1) then
		{
			_mrkr = format["%1 is down", name _body]; 
			createMarker [_mrkr, _pos];
			_mrkr setMarkerColor "ColorBlue";
			_mrkr	setMarkerType "Flag1";
			_mrkr setMarkerText format["%1 is down", name _body]; 
			_mrkr setMarkerSize [0.4, 0.4];
		};	

		//move body
		_respawn = true;
		waitUntil{alive call compile format["%1",_name]};
		_name = call compile format["%1",_name];
		_name switchMove "AmovPpneMstpSnonWnonDnon_healed";
		_name setCaptive true;
		
		//initialise call-out function
		if (call_out_function == 1) then {call{[_name, _unconcious_voice] execVM "revive_sqf\call_out.sqf"}};
		
		sleep 0.05;
		if (!_dead) then {deleteVehicle _body};
		sleep 0.05;
		_name setDir _dir;
		{doStop _x}forEach units _grp;	
		sleep 0.05;					
		_concious = true;		
	};	

	//player unconcious
	while {alive _name && _respawn && _concious && !_dead && !_respawn_at_base} do
	{	
		if (isplayer _name) then {_name switchMove "AmovPpneMstpSnonWnonDnon"};
		if (!isplayer _name) then {_name switchMove "AmovPpneMstpSnonWnonDnon_healed"; sleep 4;};
		if(!isplayer _name) exitWith {call compile format ["%1_revives = 0; publicVariable ""%1_revives""", _name]};
		if(!alive call compile format ["%1", _name]) then {_respawn = true; _concious = false;};
		call compile format ["if (%1_respawn_at_base) then {_respawn_at_base = true}", _name];
		_name setdammage 0;
		
		//call-out while unconcious
		call compile format ["if (call_out_function == 1 && say_%1 && _d == 0) then {_d = 1; _name say comment_%1}", _name]; 
		call compile format ["if (call_out_function == 1 && !say_%1) then {_d = 0}", _name];
		
		sleep 0.2;
			
		//reviver is within the revive radius and is reviving - unit revived
		if (alive _name && count (nearestObjects [_name, [_can_be_revived], 3]) > 1) then
		{		
			if (isplayer _name) then {_name switchMove "AmovPpneMstpSnonWnonDnon"};
			if(!isplayer _name) exitWith {call compile format ["%1_revives = 0; publicVariable ""%1_revives""", _name]};
			if(!alive call compile format ["%1", _name]) then {_respawn = true; _concious = false;};
			call compile format ["if (%1_respawn_at_base) then {_respawn_at_base = true}", _name];
			_name setdammage 0;			

			_near_Objects = nearestObjects [_name, [_can_be_revived], 3];
			_e = 0;
			{if(animationState _x == "AinvPknlMstpSlayWrflDnon_medic")then {_e = _e + 1}}forEach _near_Objects;
			if (_e >= 1) then
			{	
				sleep 1;
				_name playMove "AmovPpneMstpSnonWnonDnon_healed";
				
				_reviver = nearestObjects [_name, [_can_be_revived], 3] select 1;
				if (animationState _reviver != "AinvPknlMstpSlayWrflDnon_medic") then {_reviver = nearestObjects [_name, [_can_be_revived], 3] select 2};
				if (animationState _reviver != "AinvPknlMstpSlayWrflDnon_medic") then {_reviver = nearestObjects [_name, [_can_be_revived], 3] select 3};

				if (local _name && reward_function == 1) then 
				{
					call compile format ["revive_%1 = revive_%1 + 1; publicVariable ""revive_%1""", _reviver];
				}; 				
			
				//Set current unit status unconcious, thanks to HulkingUnicorn for this code
				{call compile format ["if (_name == %1) then {%1_a = false; publicVariable ""%1_a"";};", _x];}forEach _units;
				{call compile format ["if (_name == %1) then {%1_unconcious = false; publicVariable ""%1_unconcious"";};", _x];}forEach _units;			

				if (unconcious_markers == 1) then {deleteMarker format["%1 is down", name _name]};
				enableRadio true;
				_name setCaptive false;
				_name selectweapon primaryweapon _name;
				
				sleep 1;

				//increment respawn counter
				if (local _name) then
				{
					_no_respawns = call compile format ["%1_revives", _name] + 1;
					_respawns_left = _max_respawns - _no_respawns;
					_no_left = format ["Revives remaining: %1", _respawns_left];
					hint _no_left;
					call compile format ["%1_revives = _no_respawns; publicVariable ""%1_revives""", _name];
				};			

				//reset variables
				_respawn = false;
				_concious = false;
				_c = 0;
				_d = 0;
				sleep 1;
			};
		sleep 0.2;
		};
	};
	if (alive _name && _respawn && _concious && !_dead && _respawn_at_base) then
	{	
		sleep 0.2;
		_name playMove "AmovPercMstpSnonWnonDnon";
					
		//Set current unit status unconcious, thanks to HulkingUnicorn for this code
		{call compile format ["if (_name == %1) then {%1_a = false; publicVariable ""%1_a"";};", _x];}forEach _units;
		{call compile format ["if (_name == %1) then {%1_unconcious = false; publicVariable ""%1_unconcious"";};", _x];}forEach _units;			

		if (unconcious_markers == 1) then {deleteMarker format["%1 is down", name _name]};
		enableRadio true;
		_name setCaptive false;
		_name selectweapon primaryweapon _name;
				
		sleep 0.2;

		//increment respawn counter
		if (local _name) then
		{
			_no_respawns = call compile format ["%1_revives", _name] + 1;
			_respawns_left = _max_respawns - _no_respawns;
			_no_left = format ["Revives remaining: %1", _respawns_left];
			hint _no_left;
			call compile format ["%1_revives = _no_respawns; publicVariable ""%1_revives""", _name];
		};			

		//reset variables
		call compile format ["%1_respawn_at_base = false; publicVariable ""%1_respawn_at_base""", _name];
		_respawn = false;
		_concious = false;
		_c = 0;
		_d = 0;
		_respawn_at_base = false;
		sleep 0.2;
	};

	sleep 1;
	_respawn = false;
	_concious = false;

	//if the unit is dead prompt player revive limit has been reached and select another slot
	if (_dead) exitWith
	{	
		_body = call compile format ["%1", _name];
		_pos = getPosASL _body;

		if (unconcious_markers == 1) then {deleteMarker format["%1 is down", name _body]};
		call compile format ["revive_%1 = 0; publicVariable ""revive_%1""", _body];
		call compile format ["%1_killer = 0; publicVariable ""%1_killer""", _body];		
				
		call compile format ["
		[%1] join grpNull;
		waitUntil{alive call compile format[""%1"",_name]};
		_name = call compile format[""%1"",_name];
		if (_name distance getMarkerPos ""Boot_Hill"" > 50) then {_name setpos getMarkerPos ""Boot_Hill""};
		
		sleep 0.5;
		%1_unconcious = true; publicVariable ""%1_unconcious"";
		if (_name == player) then {titleText [""This unit's revive limit has been reached. Please press escape, return to the unit selection menu and choose another playable unit"", ""BLACK"", 10]};
		[_name] join grpNull;
		sleep 1;
		if(!isplayer _name) exitWith {%1_revives = 0; publicVariable ""%1_revives"";};
		if (_c == 0) then {hint ""%1 is dead""};
		%1_revives = 0;
		publicVariable ""%1_revives"";
		sleep 5;
		;", _name];		
	};
};
	
