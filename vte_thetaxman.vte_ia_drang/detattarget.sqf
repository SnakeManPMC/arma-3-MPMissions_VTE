
//;Detection / Search and destroy script. This is executed by a sensor, which is triggered by the detection of a member of the player's group (id=0) from between 4-7 seconds.
//;First, all local groups are setbehaviour "AWARE" - The mission just got a hell of a lot harder.

tracker1 setbehaviour "AWARE";
tracker2 setbehaviour "AWARE";
tracker3 setbehaviour "AWARE";
tracker4 setbehaviour "AWARE";
tracker5 setbehaviour "AWARE";
Patrol1 setbehaviour "AWARE";
Patrol2 setbehaviour "AWARE";
Patrol3 setbehaviour "AWARE";
Sniper1 setbehaviour "AWARE";
Sniper2 setbehaviour "AWARE";
Sniper3 setbehaviour "AWARE";
Sniper4 setbehaviour "AWARE";

//;The player's current location is found.

private _aPlpos = getpos aP;
private _aPchx = _aPlpos select 0;
private _aPchy = _aPlpos select 1;
private _aPchz = _aPlpos select 2;

//;3 patrols immediately start searching the area around the player!

tracker1 move [_aPchx, _aPchy+50, 0];
tracker2 move [_aPchx+30, _aPchy+50, 0];
tracker3 move [_aPchx, _aPchy-10, 0];
tracker4 move [_aPchx+30, _aPchy+50, 0];
tracker5 move [_aPchx-30, _aPchy-50, 0];
sleep 10;

//;The snipers are turn to look at where the patrols are going..
Sniper1 dowatch [_aPchx, _aPchy, 0];
Sniper2 dowatch [_aPchx, _aPchy, 0];
Sniper3 dowatch [_aPchx, _aPchy, 0];
Sniper4 dowatch [_aPchx, _aPchy, 0];

//;Wait 50 seconds till the next player location update

sleep 50;

//;The player's current location is found.

_aPlpos = getpos aP;
_aPchx = _aPlpos select 0;
_aPchy = _aPlpos select 1;
_aPchz = _aPlpos select 2;

//;Assuming the player isn't dead already, the patrols move to a less concentrated search, and a few more join them.

tracker1 move [_aPchx+50, _aPchy, 0];
tracker2 move [_aPchx+70, _aPchy-40, 0];
tracker3 move [_aPchx+50, _aPchy-70, 0];
tracker4 move [_aPchx+40, _aPchy+60, 0];
tracker5 move [_aPchx+80, _aPchy+80, 0];


//;Wait 50 seconds till the next player location update

sleep 50;

//;The player's current location is found.

_aPlpos = getpos aP;
_aPchx = _aPlpos select 0;
_aPchy = _aPlpos select 1;
_aPchz = _aPlpos select 2;

//;The patrols move to an even less concentrated search.

tracker1 move [_aPchx+150, _aPchy, 0];
tracker2 move [_aPchx+20, _aPchy-130, 0];
tracker3 move [_aPchx+40, _aPchy-90, 0];
tracker4 move [_aPchx+40, _aPchy+90, 0];
tracker5 move [_aPchx+90, _aPchy+90, 0];

//;Script ends. The patrols will give up and move back to their previous patrols.

sleep 120;
