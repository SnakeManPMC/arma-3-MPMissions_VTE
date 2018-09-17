// camera basic initialization
private _camera = "camera" camCreate [0,0,0];
_camera camSetTarget [0,0,0];
_camera cameraEffect ["internal","back"];
_camera camSetFOV 0.700;

//=== 15:21:56
_camera camSetTarget usa
_camera camSetRelPos [0,10,4];

_camera camCommit 0;
waitUntil { (camCommitted _camera); };

playmusic ["VTE_bird",0];

titlecut ["","BLACK IN",2];
sleep 3;

//=== 15:21:56
_camera camSetTarget usa;
_camera camSetRelPos [10,20,4];

_camera camCommit 7;
waitUntil { (camCommitted _camera); };
sleep 3;

//=== 15:21:56
_camera camSetTarget hoss;
_camera camSetRelPos [20,20,3];

_camera camCommit 0;
waitUntil { (camCommitted _camera); };
sleep 1;
//=== 15:21:56
_camera camSetTarget hoss;
_camera camSetRelPos [2,15,.2];

_camera camCommit 5;
waitUntil { (camCommitted _camera); };
sleep 3;

//=== 15:21:56
_camera camSetTarget helo1;
_camera camSetRelPos [10,30,10];

_camera camCommit 0;
waitUntil { (camCommitted _camera); };
sleep 1;
//=== 15:21:56
_camera camSetTarget helo1;
_camera camSetRelPos [-10,20,3];

_camera camCommit 7;
waitUntil { (camCommitted _camera); };
sleep 2;


//=== 15:21:56
_camera camSetTarget helo2;
_camera camSetRelPos [-10,20,10];

_camera camCommit 0;
waitUntil { (camCommitted _camera); };
sleep 1;
//=== 15:21:56
_camera camSetTarget helo2;
_camera camSetRelPos [10,5,5];

_camera camCommit 7;
waitUntil { (camCommitted _camera); };
sleep 2;


//=== 15:21:56
_camera camSetTarget leader assault1;
_camera camSetRelPos [0,5,2];

_camera camCommit 0;
waitUntil { (camCommitted _camera); };
sleep 1;
//=== 15:21:56
_camera camSetTarget leader assault1;
_camera camSetRelPos [-2,10,2];

_camera camCommit 7;
waitUntil { (camCommitted _camera); };
sleep 3;

playmusic ["VTE_wooly",0];

//=== 15:21:56
_camera camSetTarget leader assault2
_camera camSetRelPos [1,6,1.7];

_camera camCommit 0;
waitUntil { (camCommitted _camera); };
sleep 1;
//=== 15:21:56
_camera camSetTarget leader assault2;
_camera camSetRelPos [-3,3,1];

_camera camCommit 5;
waitUntil { (camCommitted _camera); };
sleep 3;

//=== 15:21:56
_camera camSetTarget nvabase;
_camera camSetRelPos [0,500,100];

_camera camCommit 0;
waitUntil { (camCommitted _camera); };
//=== 15:21:56
_camera camSetTarget nvabase;
_camera camSetRelPos [50,70,10];

_camera camCommit 20;
waitUntil { (camCommitted _camera); };
sleep 3;
//=== 15:21:56
_camera camSetTarget nvabase;
_camera camSetRelPos [70,70,10];

_camera camCommit 3;
waitUntil { (camCommitted _camera); };
//=== 15:21:56
_camera camSetTarget nvabase;
_camera camSetRelPos [70,-70,10];

_camera camCommit 11;
waitUntil { (camCommitted _camera); };
//=== 15:21:56
_camera camSetTarget nvabase;
_camera camSetRelPos [-70,-70,10];

_camera camCommit 11;
waitUntil { (camCommitted _camera); };
sleep 3;

titlecut ["","BLACK OUT",3];
4 fademusic 0;
sleep 3;

// destroy camera - if we use mission cutscene
_camera cameraEffect ["terminate","back"];

// Destroy the camera
camDestroy _camera;

// end the intro
endcut = true;
