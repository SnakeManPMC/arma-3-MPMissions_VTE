
private _mode = _this select 1;
private _chopper = _this select 0;
//;Find out who's in the chopper.
private _choppercrew = crew _chopper;
private _counter = 0;
private _count = 0;
private _max = count _choppercrew;
/*
; Start chopper problems
;_chopper SetFuel 0.00001
; make the chopper smoke
;smoke setpos getpos _chopper
;smoke inflame true
;~2
;_chopper SetFuel 0.5
;huey1 action ["engine ON", huey1]
;~4
;[[0,0,0], [0,0,1], 100, 10, _chopper] exec "firesource.sqs"
;~2
;_chopper SetFuel 0.00001
;~3
;_chopper SetFuel 0.8
;huey1 action ["engine ON", huey1]
*/
huey1 FlyInHeight 25;
//;huey2 FlyInHeight 25

//; make the chopper fall
_chopper flyinheight 1;
//; Spin the chopper.
//;_chopper SetDir _chopperdir
//;smoke setpos [(getpos _chopper select 0), (getpos _chopper select 1), (getpos _chopper select 2) + 2.1]

unassignVehicle w1;
w1 action ["EJECT", huey1];
sleep 1.5;
unassignVehicle w2;
w2 action ["EJECT", huey1];
sleep 1.5;
unassignVehicle w3;
w3 action ["EJECT", huey1];
sleep 1.5;
unassignVehicle w4;
w4 action ["EJECT", huey1];
sleep 1.5;
unassignVehicle w5;
w5 action ["EJECT", huey1];
sleep 1.5;
unassignVehicle w6;
w6 action ["EJECT", huey1];
sleep 1.5;
unassignVehicle w7;
w7 action ["EJECT", huey1];
sleep 1.5;
unassignVehicle w8;
w8 action ["EJECT", huey1];
sleep 1.5;
unassignVehicle w9;
w9 action ["EJECT", huey1];
sleep 1.5;
/*
;[[0,0,0], [0,0,1], 100, 10, _chopper] exec "firesource.sqs"
;smoke setpos [(getpos _chopper select 0), (getpos _chopper select 1), (getpos _chopper select 2) - 1]
;_chopper setfuel 0
;~random 45
;_chopper setdammage 0
*/
