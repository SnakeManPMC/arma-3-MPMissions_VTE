

private [];
[] execVM "briefing.sqf";

enableSaving [ false, false ];

setViewDistance 900;

0 setfog 0.9;
0 fademusic 0.35;

if (alive W1) then {W1t = true};
if (alive W2) then {W2t = true};
if (alive W3) then {W3t = true};
if (alive W4) then {W4t = true};
if (alive W5) then {W5t = true};
if (alive W6) then {W6t = true};
if (alive W7) then {W7t = true};
if (alive W8) then {W8t = true};
if (alive W9) then {W9t = true};
if (alive W10) then {W10t = true};
if (alive W11) then {W11t = true};
if (alive W12) then {W12t = true};
if (alive W13) then {W13t = true};
if (alive W14) then {W14t = true};
if (alive W15) then {W15t = true};
if (alive W16) then {W16t = true};

gameRun = true;

[] execVM "flarepop.sqf";
[] execVM "hecklering.sqf";
[] execVM "randomWeather.sqf";

sleep 3;
playMusic "vte_bird";
