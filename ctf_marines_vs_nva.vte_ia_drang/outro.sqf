
titleCut ["","BLACK OUT", 2];

private _camera = "camera" camCreate [8388.39,4348.80,0.74];
_camera cameraEffect ["internal","back"];
0 fadeMusic 0.3;
playMusic "vte_bird";

enableRadio false;
setaccTime 0.2;

titleCut ["","BLACK IN", 2];

//=== 21:39:59
_camera camSetTarget FlagE;
_camera camSetRelPos [-35.85,-26.87,17.09];
_camera camSetFOV 0.700;
_camera camCommit 0;
waitUntil { (camCommitted _camera); };

//=== 21:40:58
_camera camSetTarget FlagE;
_camera camSetRelPos [-0.76,-2.48,7.62];
_camera camSetFOV 0.286;
_camera camCommit 7;
waitUntil { (camCommitted _camera); };

titleCut ["","BLACK OUT", 1];
sleep 1;
titleCut ["","BLACK IN", 1];

//;=== 21:40:58
_camera camSetTarget FlagW;
_camera camSetRelPos [-0.76,-2.48,7.62];
_camera camSetFOV 0.286;
_camera camCommit 0;
waitUntil { (camCommitted _camera); };

_camera camSetTarget FlagW;
_camera camSetRelPos [-35.85,-26.87,17.09];
_camera camSetFOV 0.700;
_camera camCommit 7;
8 fadeMusic 0.0;
waitUntil { (camCommitted _camera); };

sleep 1;

setaccTime 1;

player cameraEffect ["terminate","back"];
camDestroy _camera;

Over = true;
