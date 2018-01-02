// if on server
if (isServer) then
{
	[] execVM "PMC\PMC_init.sqf";
}
else
{
	[] execVM "PMC\PMC_weather.sqf";
	player setVariable ["BIS_noCoreConversations", true];

	// set respawn point and put our player there
	"respawn_west" setMarkerPosLocal getPosASL pmc_teleportPole;
	player setPos getPosASL pmc_teleportPole;
};

[[
  ["PMC_open_plei_me_base","Open Plei Me SF base","You need to put boots on the ground on <marker name='markerPleiMe'>Plei Me SF base</marker> to open your respawn there.", true, ["markerPleiMe", getPosASL PMC_pleimeopen]],
  ["PMC_objective1","Capture objective 1","Capture <marker name='markerTask1'>objective 1</marker>.", true, ["markerTask1", getPosASL pmc_1]],
  ["PMC_objective2","Capture objective 2","Capture <marker name='markerTask2'>objective 2</marker>.", true, ["markerTask2", getPosASL pmc_2]],
  ["PMC_objective3","Capture objective 3","Capture <marker name='markerTask3'>objective 3</marker>.", true, ["markerTask3", getPosASL pmc_3]],
  ["PMC_objective4","Capture objective 4","Capture <marker name='markerTask4'>objective 4</marker>.", true, ["markerTask4", getPosASL pmc_4]],
  ["PMC_objective5","Capture objective 5","Capture <marker name='markerTask5'>objective 5</marker>.", true, ["markerTask5", getPosASL pmc_5]],
  ["PMC_objective6","Capture objective 6","Capture <marker name='markerTask6'>objective 6</marker>.", true, ["markerTask6", getPosASL pmc_6]],
  ["PMC_objective7","Capture objective 7","Capture <marker name='markerTask7'>objective 7</marker>.", true, ["markerTask7", getPosASL pmc_7]],
  ["PMC_objective8","Capture objective 8","Capture <marker name='markerTask8'>objective 8</marker>.", true, ["markerTask8", getPosASL pmc_8]],
  ["PMC_objective9","Capture objective 9","Capture <marker name='markerTask9'>objective 9</marker>.", true, ["markerTask9", getPosASL pmc_9]],
  ["PMC_objective10","Capture objective 10","Capture <marker name='markerTask10'>objective 10</marker>.", true, ["markerTask10", getPosASL pmc_10]],
  ["PMC_objective11","Capture objective 11","Capture <marker name='markerTask11'>objective 11</marker>.", true, ["markerTask11", getPosASL pmc_11]],
  ["PMC_objective12","Capture objective 12","Capture <marker name='markerTask12'>objective 12</marker>.", true, ["markerTask12", getPosASL pmc_12]],
  ["PMC_objective13","Capture objective 13","Capture <marker name='markerTask13'>objective 13</marker>.", true, ["markerTask13", getPosASL pmc_13]],
  ["PMC_objective14","Capture objective 14","Capture <marker name='markerTask14'>objective 14</marker>.", true, ["markerTask14", getPosASL pmc_14]],
  ["PMC_objective15","Capture objective 15","Capture <marker name='markerTask15'>objective 15</marker>.", true, ["markerTask15", getPosASL pmc_15]],
  ["PMC_objective16","Capture objective 16","Capture <marker name='markerTask16'>objective 16</marker>.", true, ["markerTask16", getPosASL pmc_16]],
  ["PMC_objective17","Capture objective 17","Capture <marker name='markerTask17'>objective 17</marker>.", true, ["markerTask17", getPosASL pmc_17]],
  ["PMC_objective18","Capture objective 18","Capture <marker name='markerTask18'>objective 18</marker>.", true, ["markerTask18", getPosASL pmc_18]],
  ["PMC_objective19","Capture objective 19","Capture <marker name='markerTask19'>objective 19</marker>.", true, ["markerTask19", getPosASL pmc_19]],
  ["PMC_objective20","Capture objective 20","Capture <marker name='markerTask20'>objective 20</marker>.", true, ["markerTask20", getPosASL pmc_20]],
  ["PMC_objective21","Capture objective 21","Capture <marker name='markerTask21'>objective 21</marker>.", true, ["markerTask21", getPosASL pmc_21]],
  ["PMC_objective22","Capture objective 22","Capture <marker name='markerTask22'>objective 22</marker>.", true, ["markerTask22", getPosASL pmc_22]],
  ["PMC_objective23","Capture objective 23","Capture <marker name='markerTask23'>objective 23</marker>.", true, ["markerTask23", getPosASL pmc_23]],
  ["PMC_objective24","Capture objective 24","Capture <marker name='markerTask24'>objective 24</marker>.", true, ["markerTask24", getPosASL pmc_24]],
  ["PMC_objective25","Capture objective 25","Capture <marker name='markerTask25'>objective 25</marker>.", true, ["markerTask25", getPosASL pmc_25]],
  ["PMC_objective26","Capture objective 26","Capture <marker name='markerTask26'>objective 26</marker>.", true, ["markerTask26", getPosASL pmc_26]],
  ["PMC_objective27","Capture objective 27","Capture <marker name='markerTask27'>objective 27</marker>.", true, ["markerTask27", getPosASL pmc_27]],
  ["PMC_objective28","Capture objective 28","Capture <marker name='markerTask28'>objective 28</marker>.", true, ["markerTask28", getPosASL pmc_28]],
  ["PMC_objective29","Capture objective 29","Capture <marker name='markerTask29'>objective 29</marker>.", true, ["markerTask29", getPosASL pmc_29]],
  ["PMC_objective30","Capture objective 30","Capture <marker name='markerTask30'>objective 30</marker>.", true, ["markerTask30", getPosASL pmc_30]],
  ["PMC_objective31","Capture objective 31","Capture <marker name='markerTask31'>objective 31</marker>.", true, ["markerTask31", getPosASL pmc_31]],
  ["PMC_objective32","Capture objective 32","Capture <marker name='markerTask32'>objective 32</marker>.", true, ["markerTask32", getPosASL pmc_32]]
],[
  ["Mission", "USMC Headquarters is located at <marker name='start'>airbase</marker> where aircrafts are located.<br/><br/>Small fleet to boats are located in the <marker name='docks'>docks</marker> for you to patrol the water ways.<br/><br/>M252 Mortars and M101 Artillery pieces are located in <marker name='artillery'>artillery range</marker> for you to blast the enemy.<br/><br/>USMC task is to clear out all the targets located in the map.<br/><br/>USS KittyHawk is stationed <marker name='kittyhawk'>north of airbase</marker> and is available for carrier operations."]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
