// camera basic initialization
private _camera = "camera" camCreate [0,0,0];
_camera camPrepareTarget [0,0,0];
_camera cameraEffect ["internal","back"];
_camera camPrepareFOV 0.700;

// plei me base start
_camera camPrepareTarget [102002.17,-31044.21,-16856.12];
_camera camPreparePos [11602.44,8210.54,36.14];
_camera camCommitPrepared 0;
waitUntil { (camCommitted _camera); };

// run the constant flaing for movie duration.
[] execVM "PMC\movie_flares.sqf";

playmusic ["VTE_whodoyoulove",0];
titlecut ["","BLACK IN",2];
titleText ["Thank you for playing PMC NVA Assault!","plain down",3];
sleep 3;

//base E corner
_camera camPrepareTarget [39387.72,-87555.23,-7459.36];
_camera camPreparePos [11602.44,8210.54,36.14];
_camera camCommitPrepared 10;
waitUntil { (camCommitted _camera); };

titleText [format["Mission duration: %1 mins", (time/60)], "plain down", 3];

// base W edge.
_camera camPrepareTarget [-36613.61,-77546.39,-17831.87];
_camera camPreparePos [11602.44,8210.54,36.14];
_camera camCommitPrepared 10;
waitUntil { (camCommitted _camera); };
sleep 0.5;

// E corner view to N.
_camera camPrepareTarget [100066.88,47529.05,-22477.38];
_camera camPreparePos [11137.92,7750.97,46.93];
_camera camCommitPrepared 0;
waitUntil { (camCommitted _camera); };
sleep 0.5;
// turn to E.
_camera camPrepareTarget [105443.31,-20651.24,-17223.63];
_camera camPreparePos [11137.92,7750.97,46.93];
_camera camCommitPrepared 10;
waitUntil { (camCommitted _camera); };
sleep 0.5;

// airbase S
_camera camPrepareTarget [110041.84,11521.81,-16581.57];
_camera camPreparePos [11522.06,7580.06,53.54];
_camera camCommitPrepared 0;
waitUntil { (camCommitted _camera); };
sleep 0.5;

titleText [format["Friendly JIP joins %1", PMC_PlayerRespawns], "plain down", 3];

// base E
_camera camPrepareTarget [90542.93,68398.80,-7434.17];
_camera camPreparePos [11522.06,7580.06,53.54];
_camera camCommitPrepared 7;
waitUntil { (camCommitted _camera); };
// base middle 
_camera camPrepareTarget [33869.84,104759.23,-7433.87];
_camera camPreparePos [11522.06,7580.06,53.54];
_camera camCommitPrepared 7;
waitUntil { (camCommitted _camera); };

titleText ["Just awesome Vietnam: The Experience action!", "plain down", 3];

// W corner
_camera camPrepareTarget [-48959.38,85712.71,-15302.63];
_camera camPreparePos [11522.06,7580.06,53.54];
_camera camCommitPrepared 7;
waitUntil { (camCommitted _camera); };
sleep 0.5;

titleText [format["So much death and destruction...\nNVA/VC Killed: %1", PMC_opfor], "plain down", 3];
//[] execVM "PMC\PMC_Music_Jukebox_ArmA3_Default_Tracks.sqf";

// close E edge
_camera camPrepareTarget [31015.45,104699.58,-15357.44];
_camera camPreparePos [11758.21,7791.85,21.58];
_camera camCommitPrepared 0;
waitUntil { (camCommitted _camera); };
sleep 0.5;
// middle good view
_camera camPrepareTarget [-58317.62,78264.02,-11021.26];
_camera camPreparePos [11758.21,7791.85,21.58];
_camera camCommitPrepared 10;
waitUntil { (camCommitted _camera); };

titleText ["This mission was first introduced in OFP VTE.", "plain down", 3];

// S edge
_camera camPrepareTarget [-84206.52,14636.72,-27202.99];
_camera camPreparePos [11758.21,7791.85,21.58];
_camera camCommitPrepared 10;
waitUntil { (camCommitted _camera); };

titleText ["Mission design\nSnake Man.", "plain down", 3];

// first move downwards
_camera camPrepareTarget [-87226.42,10370.08,-14303.34];
_camera camPreparePos [11652.78,7796.26,7.61];
_camera camCommitPrepared 7;
waitUntil { (camCommitted _camera); };
// zooming along the edge towards W
_camera camPrepareTarget [-87343.73,7449.83,-14314.25];
_camera camPreparePos [11510.22,7796.13,7.61];
_camera camCommitPrepared 10;
waitUntil { (camCommitted _camera); };

titleText ["Scripts\nSnake Man,\nMandoble.", "plain down", 3];

// ending to the bunker
_camera camPrepareTarget [-86672.86,21158.61,-14348.07];
_camera camPreparePos [11358.50,7808.26,7.42];
_camera camCommitPrepared 10;
waitUntil { (camCommitted _camera); };
sleep 0.5;

// look to N from W edge
_camera camPrepareTarget [82346.38,76739.48,-14347.02];
_camera camPreparePos [11334.30,7821.61,12.29];
_camera camCommitPrepared 0;
waitUntil { (camCommitted _camera); };
sleep 0.5;
// zooming to N 
_camera camPrepareTarget [82346.38,76739.48,-14346.67];
_camera camPreparePos [11381.16,7875.48,11.92];
_camera camCommitPrepared 10;
waitUntil { (camCommitted _camera); };

titleText ["Greetings to all PMC Tactical dedicated server visitors\n ", "plain down", 3];

// last lap
_camera camPrepareTarget [82346.38,76739.48,-14346.71];
_camera camPreparePos [11469.71,7964.72,11.77];
_camera camCommitPrepared 10;
waitUntil { (camCommitted _camera); };
sleep 0.5;

// N edge
_camera camPrepareTarget [109609.28,18192.57,-16331.04];
_camera camPreparePos [11495.94,7958.61,21.15];
_camera camCommitPrepared 0;
waitUntil { (camCommitted _camera); };
sleep 0.5;

titleText ["Greetings to all PMC Tactical dedicated server visitors\nand PMC Tactical forum guys.", "plain down", 3];

// middle good view
_camera camPrepareTarget [99519.78,-38247.27,-10736.72];
_camera camPreparePos [11495.94,7958.61,21.15];
_camera camCommitPrepared 10;
waitUntil { (camCommitted _camera); };
// Western view
_camera camPrepareTarget [10200.40,-88075.30,-27781.93];
_camera camPreparePos [11495.94,7958.61,21.15];
_camera camCommitPrepared 10;
waitUntil { (camCommitted _camera); };
sleep 2;

// flag to base close grounds
_camera camPrepareTarget [-87935.98,12632.04,-8182.46];
_camera camPreparePos [11611.43,7891.67,4.27];
_camera camCommitPrepared 0;
waitUntil { (camCommitted _camera); };
sleep 1;

titleText ["PMC Tactical\nhttps://www.pmctactical.org", "plain down", 3];

//=== 18:52:46
_camera camPrepareTarget [-30042.21,92741.86,-32586.41];
_camera camPreparePos [11611.43,7891.67,4.27];
_camera camCommitPrepared 5;
waitUntil { (camCommitted _camera); };
//=== 18:52:51
_camera camPrepareTarget [37778.80,102417.81,-19441.80];
_camera camPreparePos [11611.43,7891.67,4.27];
_camera camCommitPrepared 5;
waitUntil { (camCommitted _camera); };
sleep 3;

// single shots
_camera camPrepareTarget [90590.04,-47714.71,-25755.56];
_camera camPreparePos [11608.40,7924.82,4.48];
_camera camCommitPrepared 0;
waitUntil { (camCommitted _camera); };
sleep 3;
//=== 18:55:08
_camera camPrepareTarget [56618.87,-77575.66,-25761.79];
_camera camPreparePos [11641.38,7926.33,3.71];
_camera camCommitPrepared 0;
waitUntil { (camCommitted _camera); };
sleep 3;
//=== 18:55:13
_camera camPrepareTarget [-53886.47,-63064.29,-25761.80];
_camera camPreparePos [11641.38,7926.33,3.71];
_camera camCommitPrepared 0;
waitUntil { (camCommitted _camera); };
sleep 3;
//=== 18:55:26
_camera camPrepareTarget [-65235.36,66412.32,-25767.91];
_camera camPreparePos [11639.37,7901.32,3.71];
_camera camCommitPrepared 0;
waitUntil { (camCommitted _camera); };

titleText ["See you soon, Yeeeaaaaaaahhh !", "plain down", 3];
sleep 3;

titlecut ["","BLACK OUT",3];
4 fademusic 0;
sleep 3;

// destroy camera ;)
_camera cameraEffect["terminate","BACK"];

// Destroy the camera
camDestroy _camera;

// end the intro
endcut = true
