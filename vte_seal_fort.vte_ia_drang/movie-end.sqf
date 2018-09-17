// camera basic initialization
private _camera = "camera" camCreate [0,0,0];
_camera camSetTarget [0,0,0];
_camera cameraEffect ["internal","back"];
_camera camSetFOV 0.700;

//=== 11:13:07
_camera camSetTarget [103965.47,-30179.50,-2524.59];
_camera camSetPos [11507.16,7830.05,21.58];

_camera camCommit 0;
waitUntil { (camCommitted _camera); };

playmusic ["VTE_paintitblack",0];

titlecut ["","BLACK IN",2];
sleep 3;
//=== 11:13:08
_camera camSetTarget [-18606.76,-83095.63,-28663.89];
_camera camSetPos [11507.16,7830.05,21.58];

_camera camCommit 10;
waitUntil { (camCommitted _camera); };
//=== 11:13:10
_camera camSetTarget [-86836.53,-9942.19,-3488.48];
_camera camSetPos [11507.16,7830.05,21.58];

_camera camCommit 10;
waitUntil { (camCommitted _camera); };
//=== 11:13:12
_camera camSetTarget [-33790.57,93249.76,-25455.62];
_camera camSetPos [11507.16,7830.05,21.58];

_camera camCommit 10;
waitUntil { (camCommitted _camera); };
//=== 11:13:14
_camera camSetTarget [49977.80,99297.40,-12328.61];
_camera camSetPos [11507.16,7830.05,21.58];

_camera camCommit 10;
waitUntil { (camCommitted _camera); };
//=== 11:13:16
_camera camSetTarget [91577.77,59743.34,-29824.41];
_camera camSetPos [11507.16,7830.05,21.58];

_camera camCommit 10;
waitUntil { (camCommitted _camera); };
//=== 11:13:23
_camera camSetTarget [92843.52,64219.80,-14779.75];
_camera camSetPos [11577.80,7878.85,5.31];

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
