
call compile preProcessFileLineNumbers "PMC\time_used_update.sqf";

while {true} do
{
	if (PMC_debug) then
	{
		hintSilent format["NVA: %1\nUS: %2\nkilledNum: %3\ncorpses: %4\nopfor: %5\nblufor: %6\nPMC_mcomplete: %7\nTime used: %8", (EAST countSide (list pmc_opforunits)), (WEST countSide (list pmc_bluforunits)), PMC_killedNum, count PMC_corpses, PMC_opfor, PMC_blufor, PMC_mcomplete, call PMC_Time_Used_Update];
	};
	sleep 5;
};
