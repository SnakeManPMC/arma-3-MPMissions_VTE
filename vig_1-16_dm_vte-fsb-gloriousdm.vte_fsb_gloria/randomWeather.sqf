
// init vars
ranRainTimer = 0;
ranRainDensity = 0;
mainWeatherSleep = 0;

publicVariable "ranRainTimer";
publicVariable "ranRainDensity";
publicVariable "mainWeatherSleep";

// start settings
if (isServer) then 
{
	ranRainTimer = 25 + ((random 30)-(random 30));
	ranRainDensity = 0.15 + ((random 0.85)-(random 0.85));

	mainWeatherSleep = 35 + ((random 120)+(random 120));

	publicVariable "ranRainTimer";
	publicVariable "ranRainDensity";
	publicVariable "mainWeatherSleep";
};

// loop
while {(gameRun)} do
{
	ranRainTimer setOverCast ranRainDensity;
	ranRainTimer setRain ranRainDensity;

sleep (2 + ranRainTimer);

	if (isServer) then 
	{
		ranRainTimer = 25 + ((random 30)-(random 30));
		ranRainDensity = 0.15 + ((random 0.85)-(random 0.5));

		mainWeatherSleep = 35 + ((random 120)+(random 120));
	
		publicVariable "ranRainTimer";
		publicVariable "ranRainDensity";
		publicVariable "mainWeatherSleep";
	};

	mainWeatherSleep setFog ranRainDensity;

sleep (2 + mainWeatherSleep);
};