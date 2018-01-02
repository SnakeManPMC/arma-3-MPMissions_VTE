
[] execVM "PMC\PMC_init.sqf";

[[
	["PMC_objective1", "Capture", "Capture <marker name='target1'>Plei Me</marker> from enemy hands.", true, ["target1", getMarkerPos "target1"]],
	["PMC_objective2", "Kill", "Kill over 200 charlie! and then return to <marker name='start'>HQ</marker>.", true, []]
],[
	["Orders", "Your <marker name='start'>HQ</marker>. Proceed to capture Plei Me SF Base and then hunt and kill over 200 Charlie in the jungle. Return to HQ when done."],
	["Credits", "Addons used: VTE.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";
