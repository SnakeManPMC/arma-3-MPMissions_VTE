// camera basic initialization
private _camera = "camera" camCreate [0,0,0];
_camera camSetTarget [0,0,0];
_camera cameraEffect ["internal","back"];
_camera camSetFOV 0.700;

//=== 21:40:36
_camera camSetTarget [-797.00,100084.66,-15677.57];
_camera camSetPos [4866.05,1490.83,15.75];

_camera camCommit 0;
waitUntil { (camCommitted _camera); };

playmusic ["VTE_paintitblack",0];

titlecut ["","BLACK IN",2];
sleep 3;
//=== 21:40:39
_camera camSetTarget [-86770.61,39982.46,-10961.21];
_camera camSetPos [4866.05,1490.83,15.75];

_camera camCommit 10;
waitUntil { (camCommitted _camera); };
//=== 21:40:49
_camera camSetTarget [-78937.76,55101.34,-10971.08];
_camera camSetPos [4785.11,1535.93,10.83];

_camera camCommit 10;
waitUntil { (camCommitted _camera); };
sleep 1;

// leader assault1
_camera camSetTarget leader assault1;
_camera camSetRelPos [5,30,5];

_camera camCommit 0;
waitUntil { (camCommitted _camera); };
_camera camSetTarget leader assault1;
_camera camSetRelPos [0,1,1.5];

_camera camCommit 10;
waitUntil { (camCommitted _camera); };
sleep 3;

titlecut ["","BLACK OUT",3];
3 fademusic 0;
sleep 3;

// destroy camera - if we use mission cutscene the end
_camera cameraEffect ["terminate","back"];

// Destroy the camera
camDestroy _camera;

// end the intro
endcut = true;
