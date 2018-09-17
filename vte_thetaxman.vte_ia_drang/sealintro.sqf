
0 FadeSound 0;
private _camx = getpos LST select 0;
private _camy = getpos LST select 1;
private _camz = getpos LST select 2;

//; Create a camera and place it 5 meters from the object 1 meter above the ground
private _cam = "camera" CamCreate [_camx-1,_camy-4,_camz+25];

//; Point the camera to the passed object
_cam CamSetTarget camtarget2;

//; Set an effect for the camera
_cam CameraEffect ["Internal","Back"];

//; Apply the changes!
_cam CamCommit 0;

//; start when camera is ready

//; fade in from black
titleCut ["0530 - LST Folsum County ","BLACK IN",6];

sleep 9;

waitUntil { (camCommitted _cam); };
_cam CamSetTarget camtarget2;
_cam camSetRelPos [8,-8,0];
_cam camCommit 0;

titletext ["The bad weather has extended mission start by 3 hours.","PLAIN",7];

waitUntil { (camCommitted _cam); };

sleep 12;

_cam CamSetTarget camtarget3;
_cam camSetRelPos [3,-9,3];
_cam camCommit 0;

titletext ["We have lost much of our advantage of the night.","PLAIN DOWN",4];

waitUntil { (camCommitted _cam); };

sleep 8;

_cam CamSetTarget camtarget5;
_cam camSetRelPos [3,-7,.1];
_cam camCommit 0;

titletext ["Our objective is still the same.","PLAIN DOWN",1];

waitUntil { (camCommitted _cam); };

sleep 9;

_cam CamSetTarget village;
_cam camSetRelPos [5,25,70];
_cam camCommit 0;
waitUntil { (camCommitted _cam); };

titletext ["Patrol to the village.","PLAIN DOWN",2];

sleep 8;

_cam CamSetTarget VCI;
_cam camSetRelPos [1,1,2.5];
_cam camCommit 4;
waitUntil { (camCommitted _cam); };

titletext ["Locate the tax collector and eliminate him.","PLAIN DOWN",2];
sleep 8;

_cam CamSetTarget Extraction;
_cam camSetRelPos [20,40,50];
_cam camCommit 12;
waitUntil { (camCommitted _cam); };

titletext ["Then head to the extraction point.","PLAIN DOWN",2];
sleep 5;

_cam CamSetTarget lssc;
_cam camSetRelPos [30,20,80];
_cam camCommit 7;
waitUntil { (camCommitted _cam); };

titletext ["The LSSC will be waiting up-river for your signal.","PLAIN DOWN",2];
sleep 5;

_cam CamSetTarget aP4;
_cam camSetRelPos [1,1,2];
_cam camCommit 0;
waitUntil { (camCommitted _cam); };

titletext ["Your Radio is your lifeline. Keep it safe.","PLAIN DOWN",2];
sleep 5;

_cam CamSetTarget insertion;
_cam camSetRelPos [2,5,5];
_cam camCommit 0;
waitUntil { (camCommitted _cam); };

titletext ["Good luck.","PLAIN DOWN",2];
sleep 6;

_cam CameraEffect ["Terminate","Back"];
CamDestroy _cam;
sleep 4;
3 fademusic 0;
0 FadeSound 1;
savegame;
