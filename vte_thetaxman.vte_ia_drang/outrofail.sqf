
0 FadeSound 0;
0 setfog 0.9;
0 setovercast 0.8;
forceWeatherChange;
private _camx = getpos Angel select 0;
private _camy = getpos Angel select 1;
private _camz = getpos Angel select 2;

//; Create a camera and place it 5 meters from the object 1 meter above the ground
_cam = "camera" CamCreate [_camx-1,_camy-8,_camz+12];

//; Point the camera to the passed object
_cam CamSetTarget Angel;

//; Set an effect for the camera
_cam CameraEffect ["Internal","Back"];

//; Apply the changes!
_cam CamCommit 0;

//; start when camera is ready

//; fade in from black
titleCut ["You have failed.","BLACK IN",12];

sleep 10;

waitUntil { (camCommitted _cam); };
_cam CamSetTarget camtarget2;
_cam camSetRelPos [1,3,20];
_cam camCommit 0;

titletext ["You let yourself and your men down.","PLAIN",4];

waitUntil { (camCommitted _cam); };

sleep 7;

_cam CamSetTarget camtarget3;
_cam camSetRelPos [3,10,2];
_cam camCommit 0;

titletext ["There is no room for error now.","PLAIN DOWN",4];

waitUntil { (camCommitted _cam); };

sleep 6;

_cam CamSetTarget angel;
_cam camSetRelPos [3,-6,2];
_cam camCommit 0;

titletext ["You aren't playing with amateurs anymore.","PLAIN",4];

waitUntil { (camCommitted _cam); };

sleep 9;

_cam CamSetTarget angel;
_cam camSetRelPos [30,-25,20];
_cam camCommit 0;
waitUntil { (camCommitted _cam); };

titletext ["In the north, death comes quickly.","PLAIN DOWN",2];

sleep 8;

_cam CamSetTarget angel;
_cam camSetRelPos [12,9,.7];
_cam camCommit 0;
waitUntil { (camCommitted _cam); };

titletext ["Next time. Do not fail.","BLACK OUT",2];
sleep 8;

3 fademusic 0;
titlecut [" ","BLACK out",3];
sleep 3;
_camera cameraeffect ["terminate", "back"];
camdestroy _camera;
endintro = true;
