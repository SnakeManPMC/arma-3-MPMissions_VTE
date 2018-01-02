
PAPABEAR = [ West, "HQ" ];

[] execVM "PMC\PMC_weather.sqf";

call compile preprocessFileLineNumbers "PMC\PMC_CreatorStart.sqf";
call compile preprocessFileLineNumbers "PMC\PMC_Random_Pos_SEBNam.sqf";

[] execVM "PMC\PMC_war.sqf";
