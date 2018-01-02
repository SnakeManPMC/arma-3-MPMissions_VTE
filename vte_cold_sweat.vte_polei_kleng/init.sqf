
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
  ["PMC_objective1", "Capture All Sectors", "Capture all sectors to accomplish your mission.", true, []],
  ["PMC_objective2", "Kill NVA Colonel", "Find and kill NVA Colonel who is commanding the forces in this area of operations.", west, []]
],[
  ["Mission", "US Headquarters is located at <marker name='start'>SF Base</marker> where aircrafts are located.<br/><br/>US forces are to hunt down and kill the NVA forces and their Colonel commanding the NVA/VC forces somewhere in the area of operations, while capturing all sectors.<br/><br/>Sectors are:<br/><marker name='north_west'>North West</marker><br/><marker name='north_east'>North East</marker><br/><marker name='south_west'>South West</marker><br/><marker name='south_east'>South East</marker><br/><br/>Move your forces into these sectors, eliminate all enemy forces there and hold all four sectors at one time to accomplish your mission."],
  ["Tips", "Viewdistance can be changed at the flag pole located in <marker name='start'>airbase</marker>.<br/><br/>"]
]] call compile preProcessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
