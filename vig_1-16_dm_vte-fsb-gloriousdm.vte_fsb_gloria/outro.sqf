
titleCut ["","BLACK OUT", 0.5];
sleep 0.5;

enableRadio false;

0 fadeMusic 0.3;

titleCut ["","BLACK IN", 0.5];
showcinemaborder false;
CamPos_1 = getpos cam1;
cmx_1 = CamPos_1 select 0;
cmy_1 = CamPos_1 select 1;
cmz_1 = CamPos_1 select 2;

CamTarget_1 = getpos target1;
cmx_2 = CamTarget_1 select 0;
cmy_2 = CamTarget_1 select 1;
cmz_2 = CamTarget_1 select 2;

private _camera = "camera" camCreate [cmx_1,cmy_1,cmz_1+20];
_camera cameraEffect ["internal","back"];

//;=== 21:37:55
_camera camSetTarget [cmx_2,cmy_2,cmz_2];
_camera camSetPos [cmx_1,cmy_1,cmz_1+20];
_camera camSetFOV 0.700;
_camera camCommit 0;
waitUntil { (camCommitted _camera); };

//;=== 21:38:33
_camera camSetTarget [cmx_2,cmy_2,cmz_2];
_camera camSetPos [cmx_1+30,cmy_1-70,cmz_1+20];
_camera camSetFOV 0.700;
_camera camCommit 8;
waitUntil { (camCommitted _camera); };
sleep 9;

titleCut ["","BLACK OUT", 1];

sleep 1;

5 fademusic 0;

_camera cameraEffect ["terminate","back"];
camDestroy _camera;
enableradio true;
titleCut ["","BLACK IN", 1];
sleep 1;

Over = true;
