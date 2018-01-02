
[] execVM "briefing.sqf";

if (isServer)then {
	
     []execVM "cleanup.sqf";
};

enableSaving [ false, false ];
