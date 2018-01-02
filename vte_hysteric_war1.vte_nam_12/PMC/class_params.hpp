
class Params
{
// (paramsarray select 0)
	class TimeOfDay
	{
		title = "Time of Day";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
		texts[] = {"0000","0100","0200","0300","0400","0500","0600","0700","0800","0900","1000","1100","1200","1300","1400","1500","1600","1700","1800","1900","2000","2100","2200","2300"};
		default = 8;
	};

// (paramsarray select 1)
	class PMC_WeatherSetting
	{
		title = "Weather setting";
		values[] = {1, 2, 3, 4, 5, 6};
		texts[] = {"Clear skies", "Overcast", "Cloudy", "Rain storm", "Rain storm with fog", "Random"};
		default = 6;
	};
/*
// (paramsarray select 2)
	class PMC_GunshipsDisabledSetting
	{
		title = "Disable Helicopter Gunships";
		values[] = {false, true};
		texts[] = {"No", "Yes"};
		default = 0;
	};

// (paramsarray select 3)
	class PMC_ObjectivesOccupiedByEnemy
	{
		title = "Number of objectives Occupied by the enemy";
		values[] = {3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32};
		texts[] = {"3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32"};
		default = 14;
	};

// (paramsarray select 4)
	class PMC_SAMSitesDisabledSetting
	{
		title = "Disable SA-2 SAM Sites (very bad news for aircrafts)";
		values[] = {false, true};
		texts[] = {"No", "Yes"};
		default = 0;
	};

// (paramsarray select 5)
	class PMC_CiviliansDisabledSetting
	{
		title = "Disable Civilians";
		values[] = {false, true};
		texts[] = {"No", "Yes"};
		default = 0;
	};
*/
};
