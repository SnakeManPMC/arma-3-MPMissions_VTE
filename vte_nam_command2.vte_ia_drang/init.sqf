
// if on server
if (isServer) then
{
	[] execVM "PMC\PMC_init.sqf";
}
else
{
	// set our weather using multiplayer parameter array
	[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";
	
	player setVariable ["BIS_noCoreConversations", true];
};

// setup briefing
[[
	["PMC_objective1", "Obj1", "<marker name='target1'>Obj1</marker>", true, []],
	["PMC_objective2", "Obj2", "<marker name='target2'>Obj2</marker>", true, []]
],[
	["Gen. Sitrep", "Enemy has been patrolling in the region terrorizing the villagers lately. They enter into a village and take it over, anyone who attempts to stop them is killed along their family. This is their way demoralizing and causing fear to the population. We must put stop to it today."],
	["Intel", "We have detected only infantry patrols on the area, no vehicles present. They try to hide in the jungle from our recon choppers."],
	["Tactical", "I suggest you use Sniper and Special Forces teams just for recon, you will learn that intel is vital in this war, you cannot kill the enemy if you do not SEE the enemy. Use your stand off weapon (Arty and Cobra) to take  out as many enemies as possible. Goodspeed."],
	["Orders", "Alpha team (HQ) <marker name='start'>start</marker> from US Marine base. You must command your troops to get over 100 enemy KIAs. You must inflict over 100 enemy KIAs in the region to complete your objectives. Good luck."],
	["Diary", "Burden of Command."],
	["Credits", "Addons used:<br/>PMC 51km Desert by PMC.<br/>AGS Industrial by AGS/PMC.<br/>AGS Harbor / Port by AGS/PMC.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
