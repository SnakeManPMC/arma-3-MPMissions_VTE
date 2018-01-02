
[] execVM "briefing.sqf";

enableSaving [ false, false ];

m1=false;
m2=false;
m3=false;
m4=false;
m5=false;
m6=false;
m7=false;
if(local server);exit;
onPlayerConnected "publicVariable ""m1"";publicVariable ""m2"";publicVariable ""m3"";publicVariable ""m4"";publicVariable ""m5"";publicVariable ""m6"";publicVariable ""m7""";

player addEventHandler ["killed", {handle = [(_this select 0)] execVM "bury.sqf"}];
