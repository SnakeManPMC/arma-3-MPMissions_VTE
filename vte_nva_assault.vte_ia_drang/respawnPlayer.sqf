waitUntil {alive player};
// human respawn bodies are removed also.
[player] execVM "PMC\PMC_killed.sqf";
// he has to pickup weapons after respawn. perhaps too much trouble?
removeAllWeapons player;

// mandoble CAS console for squad leader, rank captain.
//["Call CAS", {rank player == "CAPTAIN"}] execVM "mando_bombs\mando_giveme_console.sqf";

// strange way to count how any friendly KIAs?
PMC_PlayerRespawns = PMC_PlayerRespawns + 1;
publicVariable "PMC_PlayerRespawns";

hint format["You have respawned, your name is: %1\nAll player respawns: %2", player, PMC_PlayerRespawns];
