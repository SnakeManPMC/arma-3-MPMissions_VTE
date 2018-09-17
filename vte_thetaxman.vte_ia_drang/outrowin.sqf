
0 FadeSound 0;
0 setfog 0.9;
0 setovercast 0.8;
forceWeatherChange;
private _camx = getpos Angel select 0;
private _camy = getpos Angel select 1;
private _camz = getpos Angel select 2;

//; Create a camera and place it 5 meters from the object 1 meter above the ground
private _cam = "camera" CamCreate [_camx-1,_camy-4,_camz+5];

//; Point the camera to the passed object
_cam CamSetTarget Angel;

//; Set an effect for the camera
_cam CameraEffect ["Internal","Back"];

//; Apply the changes!
_cam CamCommit 0;

//; start when camera is ready

//; fade in from black
titleCut ["You pulled it off.","BLACK IN",6];

sleep 7.5;

waitUntil { (camCommitted _cam); };
_cam CamSetTarget Angel;
_cam camSetRelPos [35,3,4];
_cam camCommit 0;

titletext ["Tu' Phan is dead.","PLAIN DOWN",4];

waitUntil { (camCommitted _cam); };

sleep 7;

_cam CamSetTarget camtarget2;
_cam camSetRelPos [23,20,10];
_cam camCommit 0;

titletext ["This is a great start,","PLAIN DOWN",4];

waitUntil { (camCommitted _cam); };

sleep 3;

_cam CamSetTarget camtarget3;
_cam camSetRelPos [23,-16,05];
_cam camCommit 0;

titletext ["but our work has just begun.","PLAIN DOWN",1];

waitUntil { (camCommitted _cam); };

sleep 7;

_cam CamSetTarget camtarget4;
_cam camSetRelPos [-15,7,15];
_cam camCommit 0;
waitUntil { (camCommitted _cam); };

titletext ["The next 6 months will be hell.","PLAIN DOWN",2];

sleep 6;

_cam CamSetTarget angel;
_cam camSetRelPos [22,-9,4];
_cam camCommit 0;
waitUntil { (camCommitted _cam); };

sleep 5;

3 fademusic 0;
titlecut [" ","BLACK out",3];
sleep 3;
_camera cameraeffect ["terminate", "back"];
camdestroy _camera;
endintro = true;
