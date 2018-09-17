
0 FadeSound 0;
0 setfog 0.9;
0 setovercast 0.8;
forceWeatherChange;
private _camx = getpos Phan select 0;
private _camy = getpos Phan select 1;
private _camz = getpos Phan select 2;

//; Create a camera and place it 5 meters from the object 1 meter above the ground
private _cam = "camera" CamCreate [_camx-1,_camy-4,_camz+0];

//; Point the camera to the passed object
_cam CamSetTarget camtarget2;

//; Set an effect for the camera
_cam CameraEffect ["Internal","Back"];

//; Apply the changes!
_cam CamCommit 0;

//; start when camera is ready

playmusic "VTE_whodoyoulove";

//; fade in from black
titleCut ["THE TAXMAN","BLACK IN",12];
sleep 12;

waitUntil { (camCommitted _cam); };
_cam CamSetTarget camtarget2;
_cam camSetRelPos [8,8,0];
_cam camCommit 0;

titletext ["Mission Design by Ebud","PLAIN",7];

waitUntil { (camCommitted _cam); };
sleep 7;

_cam CamSetTarget camtarget3;
_cam camSetRelPos [3,-9,0];
_cam camCommit 0;

titletext ["1969. YEAR OF THE ROOSTER.","PLAIN DOWN",4];

waitUntil { (camCommitted _cam); };
sleep 9;

_cam CamSetTarget camtarget5;
_cam camSetRelPos [3,-6,0];
_cam camCommit 0;

titletext ["Gentlemen, our objective this evening is a man named Tu' Phan.","PLAIN DOWN",1];

waitUntil { (camCommitted _cam); };
sleep 9;

_cam CamSetTarget Phan;
_cam camSetRelPos [2,4,.4];
_cam camCommit 0;
waitUntil { (camCommitted _cam); };

titletext ["The local VCI Tax Collector.","PLAIN DOWN",2];
sleep 8;

_cam CamSetTarget camtarget7;
_cam camSetRelPos [4,9,.7];
_cam camCommit 0;
waitUntil { (camCommitted _cam); };

titletext ["He is the most ruthless man south of the DMZ.","PLAIN DOWN",2];
sleep 8;

_cam CamSetTarget Phan;
_cam camSetRelPos [3,-4,2];
_cam camCommit 0;
waitUntil { (camCommitted _cam); };

titletext ["He is brutal, cunning and merciless.","PLAIN DOWN",2];
sleep 5;

_cam CamSetTarget Phan2;
_cam camSetRelPos [3,2,.5];
_cam camCommit 0;
waitUntil { (camCommitted _cam); };

titletext ["He is reported to be traveling with several bodyguards.","PLAIN DOWN",2];
sleep 5;

_cam CamSetTarget Phan3;
_cam camSetRelPos [3,2,4];
_cam camCommit 3;
waitUntil { (camCommitted _cam); };

titletext ["If you spot these men, Tu' Phan will be close by.","PLAIN DOWN",2];
sleep 5;

_cam CamSetTarget camtarget6;
_cam camSetRelPos [4,8,.2];
_cam camCommit 0;
waitUntil { (camCommitted _cam); };

titletext ["Read your copies of the briefing and get some rest. It will be a long night.","PLAIN DOWN",2];
sleep 8;

3 fademusic 0;
titlecut [" ","BLACK out",3];
sleep 3;
_camera cameraeffect ["terminate", "back"];
camdestroy _camera;
endintro = true;
