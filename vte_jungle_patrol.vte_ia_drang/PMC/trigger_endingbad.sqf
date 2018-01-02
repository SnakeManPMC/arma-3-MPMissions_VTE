leader assault1 sideChat "Alpha black to papa bear. We are getting too heavy casualties. Suggest you order a retreat. Over.";
sleep 15;

PAPABEAR sideChat "Papa bear to alpha black. Understood. All forces retreat immediately. Over.";
PMC_objective_blufor1 setTaskState "failed";
sleep 5;

mfailed = true;
publicVariable "mfailed";
hint "Get close to the US HQ base field hospital to complete the mission.";
