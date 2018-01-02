
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

[[
  ["PMC_objective1", "Kill NVA Colonel", "Find and kill NVA Colonel commanding the enemy forces", WEST, []],
  ["PMC_objective2", "Destroy US forces", "Seek and destroy all US forces in the AO.", EAST, []]
],[
  ["Mission", "US Headquarters is located at <marker name='start'>airbase</marker> where aircrafts are located.<br/><br/>US forces are to hunt down and kill the NVA forces and their Colonel commanding the NVA/VC forces somewhere in the area of operations."],
  ["Tips", "Viewdistance can be changed at the flag pole located in <marker name='start'>airbase</marker>.<br/><br/>"]
]] call compile preProcessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
