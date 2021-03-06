// camera basic initialization
private _camera = "camera" camCreate [0,0,0];
_camera camSetTarget [0,0,0];
_camera cameraEffect ["internal","back"];
_camera camSetFOV 0.700;

//=== 4:17:48
_camera camSetTarget usa;
_camera camSetRelPos [200,200,30];

_camera camCommit 0;
waitUntil { (camCommitted _camera); };

playmusic ["VTE_paintitblack",0];

titlecut ["","BLACK IN",2];
sleep 5;

//=== 4:17:48
_camera camSetTarget usa;
_camera camSetRelPos [0,200,40];

_camera camCommit 10;
waitUntil { (camCommitted _camera); };
//=== 4:17:48
_camera camSetTarget usa;
_camera camSetRelPos [-200,200,30];

_camera camCommit 10;
waitUntil { (camCommitted _camera); };
sleep 0.5;

//=== 15:24:09
_camera camSetTarget [70224.51,-71146.41,-10458.89];
_camera camSetPos [10295.64,8215.81,12.86];

_camera camCommit 0;
waitUntil { (camCommitted _camera); };
//=== 15:24:20
_camera camSetTarget [67752.41,-71998.73,-16589.22];
_camera camSetPos [10384.62,8091.19,31.49];

_camera camCommit 5;
waitUntil { (camCommitted _camera); };
sleep 0.5;

//=== 15:25:19
_camera camSetTarget [-56112.62,83569.34,-21609.79];
_camera camSetPos [7116.22,9184.26,22.99];

_camera camCommit 0;
waitUntil { (camCommitted _camera); };
//=== 15:25:33
_camera camSetTarget [-22759.28,102216.05,-21626.27];
_camera camSetPos [7041.75,9382.01,23.33];

_camera camCommit 5;
waitUntil { (camCommitted _camera); };
sleep 0.5;

//=== 15:26:15
_camera camSetTarget [-34423.41,94215.99,-22868.75];
_camera camSetPos [6551.62,5925.12,42.45];

_camera camCommit 0;
waitUntil { (camCommitted _camera); };
//=== 15:26:27
_camera camSetTarget [-69148.41,65764.63,-26157.88];
_camera camSetPos [6551.62,5925.12,82.73];

_camera camCommit 7;
waitUntil { (camCommitted _camera); };
//=== 15:26:58
_camera camSetTarget [38749.52,91050.70,-41056.85];
_camera camSetPos [6182.50,5929.99,79.71];

_camera camCommit 10;
waitUntil { (camCommitted _camera); };
sleep 0.5;

//=== 15:27:51
_camera camSetTarget [76453.69,-56006.05,-24695.32];
_camera camSetPos [4603.08,8996.54,17.05];

_camera camCommit 0;
waitUntil { (camCommitted _camera); };
//=== 15:28:00
_camera camSetTarget [76453.69,-56006.05,-24695.36];
_camera camSetPos [4718.72,8932.59,26.57];

_camera camCommit 7;
waitUntil { (camCommitted _camera); };
sleep 0.5;

//=== 15:28:42
_camera camSetTarget [-92358.75,27588.84,20.47];
_camera camSetPos [5793.82,8555.91,4.33];

_camera camCommit 0;
waitUntil { (camCommitted _camera); };
//=== 15:28:50
_camera camSetTarget [-77739.17,54835.43,-29922.55];
_camera camSetPos [5696.97,8595.65,39.79];

_camera camCommit 7;
waitUntil { (camCommitted _camera); };
sleep 0.5;

//=== 15:29:27
_camera camSetTarget [99695.70,41834.95,-3422.23];
_camera camSetPos [5451.07,8575.50,6.93];

_camera camCommit 0;
waitUntil { (camCommitted _camera); };
sleep 5;

titlecut ["","BLACK OUT",3];
4 fademusic 0;
sleep 3;

// destroy camera - if we use mission cutscene
_camera cameraEffect ["terminate","back"];

// Destroy the camera
camDestroy _camera;

// end the intro
endcut = true;
