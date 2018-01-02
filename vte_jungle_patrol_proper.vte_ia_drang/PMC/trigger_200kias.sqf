leader assault1 sideChat "Alpha black to papa bear. We have now achieved over 200 enemy KIA's. Over.";
sleep 15;

PAPABEAR sideChat "Papa bear to alpha black. Roger that, good work. Return to base for debriefing. Over.";
PMC_objective_blufor1 setTaskState "succeeded";
sleep 5;

mcomplete = true;
publicVariable "mcomplete";
hint "Get close to the US HQ base field hospital to complete the mission.";
