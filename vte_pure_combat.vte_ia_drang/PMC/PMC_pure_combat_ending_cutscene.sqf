// camera basic initialization

private ["_camera"];
_camera = "camera" camCreate [11711.76,7974.81,16.64];
//_camera camSetTarget [-87422.37,8640.46,-13043.38];
_camera camPrepareTarget [-87422.37,8640.46,-13043.38];
_camera cameraEffect ["internal","back"];
_camera camPrepareFOV 0.700;//camSetFOV

playMusic ["VTE_whodoyoulove", 0];

call compile preProcessFileLineNumbers "PMC\time_used_update.sqf";

titleText [format["Mission accomplished, congratulations!\nTotal KIA's: %1, mission time: %2\nHope you had a good time.", PMC_killedNum, call PMC_Time_Used_Update], "plain down", 2];

// opening in plei me sf base
_camera camPrepareTarget [-87422.37,8640.46,-13043.38];
_camera camPreparePos [11711.76,7974.81,16.64];
_camera camCommitPrepared 0;
sleep 5;
_camera camPrepareTarget [-57223.31,-63271.02,-13043.36];
_camera camPreparePos [11711.76,7974.81,16.64];
_camera camCommitPrepared 5;
waitUntil { camCommitted _camera; };
_camera camPrepareTarget [46588.50,-84824.03,-13043.16];
_camera camPreparePos [11711.76,7974.81,16.64];
_camera camCommitPrepared 5;
waitUntil { camCommitted _camera; };
_camera camPrepareTarget [104078.02,-28031.99,-13043.60];
_camera camPreparePos [11711.76,7974.81,16.64];
_camera camCommitPrepared 5;
waitUntil { camCommitted _camera; };
sleep 3;

titleText ["Vietnam: The Experience", "plain down", 2];

// near village pan
_camera camPrepareTarget [101488.99,44679.34,-16879.23];
_camera camPreparePos [10690.74,6355.75,26.46];
_camera camCommitPrepared 0;
waitUntil { camCommitted _camera; };
sleep 3;

_camera camPrepareTarget [47017.52,99191.67,-7804.05];
_camera camPreparePos [10690.74,6355.74,26.46];
_camera camCommitPrepared 5;
waitUntil { camCommitted _camera; };
_camera camPrepareTarget [-51583.02,84202.54,-7803.47];
_camera camPreparePos [10690.74,6355.74,26.46];
_camera camCommitPrepared 5;
waitUntil { camCommitted _camera; };
_camera camPrepareTarget [-87845.52,17063.25,-13203.86];
_camera camPreparePos [10690.74,6355.74,26.46];
_camera camCommitPrepared 5;
waitUntil { camCommitted _camera; };
sleep 1;

titleText ["PMC since 1984", "plain down", 2];

// lz columbus pan
_camera camPrepareTarget [-39590.55,-78175.61,-6062.33];
_camera camPreparePos [10382.16,8228.08,1.14];
_camera camCommitPrepared 0;
waitUntil { camCommitted _camera; };
sleep 3;

_camera camPrepareTarget [-20339.53,-85701.80,-15203.25];
_camera camPreparePos [10382.16,8228.08,42.31];
_camera camCommitPrepared 5;
waitUntil { camCommitted _camera; };
_camera camPrepareTarget [11964.30,-90577.37,-15200.15];
_camera camPreparePos [10382.16,8228.08,98.80];
_camera camCommitPrepared 5;
waitUntil { camCommitted _camera; };
_camera camPrepareTarget [90437.62,-48468.52,-19277.74];
_camera camPreparePos [10382.16,8228.08,98.80];
_camera camCommitPrepared 5;
waitUntil { camCommitted _camera; };
_camera camPrepareTarget [108332.37,13625.83,-19277.77];
_camera camPreparePos [10382.16,8228.08,98.80];
_camera camCommitPrepared 5;
waitUntil { camCommitted _camera; };
sleep 3;

titlecut ["","BLACK OUT",4];
4 fademusic 0;
sleep 4;

// Destroy the camera
_camera cameraeffect ["terminate", "back"];
camDestroy _camera;

// end the intro
PMC_Mission_Complete = true;
publicVariable "PMC_Mission_Complete";
