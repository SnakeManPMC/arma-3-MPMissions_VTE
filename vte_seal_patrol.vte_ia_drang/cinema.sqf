/*; SEAL PATROL
; SEB NAM Mission
; by Nagual 2002
; Cinematics

; =========================================================================================
*/
private _cameratype = _this select 1;
if (_cameratype == "Intro") then
{
	private _camera = "camera" camcreate [0,0,0];
	_camera cameraeffect ["internal", "back"];
	//;=== 0:45:15 - moon seal 1
	_camera camSetTarget [-84605.77,54155.94,6096.86];
	_camera camSetPos [3975.67,8153.92,0.58];
	_camera camSetFOV 0.054;
	_camera camCommit 0;
	waitUntil { (camCommitted _camera); };
	titlecut [" ","BLACK in",3];
	sleep 2;
	//;=== 0:45:49 -moon seal 2
	_camera camSetTarget [-84605.77,54155.94,6096.84];
	_camera camSetPos [3975.51,8153.61,0.57];
	_camera camSetFOV 0.054;
	_camera camCommit 2;
	waitUntil { (camCommitted _camera); };
	sleep 1;
	//;=== 0:42:22 river seal 1
	_camera camSetTarget [78774.23,74522.09,-2230.00];
	_camera camSetPos [3953.93,8212.59,0.07];
	_camera camSetFOV 0.193;
	_camera camCommit 0;
	waitUntil { (camCommitted _camera); };
	cutrsc ["start","plain down",2]
	//;=== 0:42:45 river seal 2
	_camera camSetTarget [78774.23,74522.09,-2229.71];
	_camera camSetPos [3955.01,8211.38,0.05];
	_camera camSetFOV 0.193;
	_camera camCommit 4;
	waitUntil { (camCommitted _camera); };
	sleep 1;
	//;=== 0:43:07 river seal 3
	_camera camSetTarget [52632.34,95469.67,-4060.03];
	_camera camSetPos [3955.64,8210.90,0.08];
	_camera camSetFOV 0.110;
	_camera camCommit 0;
	waitUntil { (camCommitted _camera); };
	sleep 3;
	_camera cameraeffect ["terminate", "back"];
	camdestroy _camera;
	deletevehicle camseal1;
	deletevehicle camseal2;
	titlecut [" ","BLACK in",4];
	sleep 4;
};

if (_cameratype == "OutroWin") then
{
	_camera = "camera" camcreate [0,0,0];
	_camera cameraeffect ["internal", "back"];
	
	//;=== 9:24:00
	_camera camSetTarget [85496.94,60639.30,-28977.57];
	_camera camSetPos [6015.91,7340.52,16.76];
	_camera camSetFOV 0.700;
	_camera camCommit 0;
	waitUntil { (camCommitted _camera); };
	
	titlecut [" ","BLACK in",2];
	sleep 2;
	//;=== 9:24:22
	_camera camSetTarget [85496.94,60639.30,-28977.55];
	_camera camSetPos [6138.66,7422.84,20.46];
	_camera camSetFOV 0.700;
	_camera camCommit 3;
	waitUntil { (camCommitted _camera); };
	sleep 0.05;
	//;===
	_camera camSetTarget cgc;
	_camera camSetRelPos [0,0,1];
	_camera camSetFOV 0.4;
	_camera camCommit 5;
	waitUntil { (camCommitted _camera); };
	sleep 3;
	//;=== 9:27:48
	_camera camSetTarget [-72427.01,69415.34,5344.10];
	_camera camSetPos [6001.82,7606.13,0.52];
	_camera camSetFOV 0.700;
	_camera camCommit 0;
	waitUntil { (camCommitted _camera); };
	sleep 0.5;
	//;=== 9:28:03
	_camera camSetTarget [-72172.09,69214.44,-9896.02];
	_camera camSetPos [5982.67,7623.49,0.67];
	_camera camSetFOV 0.700;
	_camera camCommit 3;
	waitUntil { (camCommitted _camera); };
	sleep 1;
	//;=== 9:30:53
	_camera camSetTarget leader ops;
	_camera camSetPos [11993.32,7844.71,5.22];
	_camera camSetFOV 0.794;
	_camera camCommit 0;
	waitUntil { (camCommitted _camera); };
	sleep 1;
	//;=== 9:31:23
	_camera camSetTarget leader ops;
	_camera camSetPos [11993.71,7847.16,4.98];
	_camera camSetFOV 0.794;
	_camera camCommit 3;
	waitUntil { (camCommitted _camera); };
	
	titlecut [" ","BLACK out",2];
	sleep 2;
	_camera cameraeffect ["terminate", "back"];
	camdestroy _camera;
	endwincamera=true;
	publicvariable "endwincamera";
};

if (_cameratype == "OutroLoose") then
{
	_camera = "camera" camcreate [0,0,0];
	_camera cameraeffect ["internal", "back"];
	
	//;===
	_camera camSetTarget leader ops;
	_camera camSetRelPos [0,0,2];
	_camera camSetFOV 0.4;
	_camera camCommit 0;
	waitUntil { (camCommitted _camera); };
	titlecut [" ","BLACK in",2];
	sleep 2;
	//;===
	_camera camSetTarget leader ops;
	_camera camSetRelPos [15,10,16];
	_camera camSetFOV 0.4;
	_camera camCommit 6;
	waitUntil { (camCommitted _camera); };
	sleep 1;
	titlecut [" ","BLACK out",2];
	sleep 2;
	_camera cameraeffect ["terminate", "back"];
	camdestroy _camera;
	endloosecamera=true;
	publicvariable "endloosecamera";
};
