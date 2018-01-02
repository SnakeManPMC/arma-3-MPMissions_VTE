
VCNum = 80;
TotalEastCount = 0;

// wait until the trigger list is up
sleep 1;
//player sidechat format["count eastlist: %1", (count eastlist)];
waitUntil
{
	((count eastlist) > 0);
};

// war is raging, we loop and wait
while {(TotalEastCount < 199)} do
{
	// unit creation loop
	while {(count eastlist) < VCNum} do
	{
		TotalEastCount = [TotalEastCount] call PMC_CreatorStart;
		//player sidechat format["TotalEastCount: %1, count eastlist: %2", TotalEastCount, (count eastlist)];
		sleep 10;
	};
	//player sidechat format["sleep 60sec because TotalEastCount: %1, count eastlist: %2", TotalEastCount, (count eastlist)];
	sleep 60;
};

// mission end
[] execVM "PMC\PMC_Ending.sqf";
