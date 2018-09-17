
private _mode = _this select 1;
private _chopper = _this select 0;
//;Find out who's in the chopper.
private _choppercrew = crew _chopper;
private _counter = 0;
private _count = 0;
private _max = count _choppercrew;
/*; Start chopper problems
;_chopper SetFuel 0.00001
; make the chopper smoke
;smoke setpos getpos _chopper
;smoke inflame true
;~2
;_chopper SetFuel 0.5
;huey2 action ["engine ON", huey2]
;~4
;[[0,0,0], [0,0,1], 100, 10, _chopper] exec "firesource.sqs"
;~2
;_chopper SetFuel 0.00001
;~3
;_chopper SetFuel 0.8
;huey2 action ["engine ON", huey2]

;huey1 FlyInHeight 25
*/
huey2 FlyInHeight 25

//; make the chopper fall
_chopper flyinheight 1
//; Spin the chopper.
//;_chopper SetDir _chopperdir
//;smoke setpos [(getpos _chopper select 0), (getpos _chopper select 1), (getpos _chopper select 2) + 2.1]
sleep 0.01;

unassignVehicle w10;
w10 action ["EJECT", huey2];
sleep 1;
unassignVehicle w11;
w11 action ["EJECT", huey2];
sleep 1;
unassignVehicle w12;
w12 action ["EJECT", huey2];
sleep 1;
unassignVehicle w13;
w1 action ["EJECT", huey2];
sleep 1;
unassignVehicle w14;
w2 action ["EJECT", huey2];
sleep 1;
unassignVehicle w15;
w3 action ["EJECT", huey2];
sleep 1;
unassignVehicle w16;
w4 action ["EJECT", huey2];
sleep 1;
unassignVehicle w17;
w5 action ["EJECT", huey2];
sleep 1;
/*
;[[0,0,0], [0,0,1], 100, 10, _chopper] exec "firesource.sqs"
;smoke setpos [(getpos _chopper select 0), (getpos _chopper select 1), (getpos _chopper select 2) - 1]
;_chopper setfuel 0
;~random 45
;_chopper setdammage 0
*/
