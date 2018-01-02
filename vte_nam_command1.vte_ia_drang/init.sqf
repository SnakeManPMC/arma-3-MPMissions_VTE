// if on server
if (isServer) then
{
	[] execVM "PMC\PMC_init.sqf";
}
else
{
	// set our weather using multiplayer parameter array
	[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";
	
	player setVariable ["BIS_noCoreConversations", true];
};

// setup briefing
[[
],[
	["Gen. Sitrep", "Enemy forces are holding the ground west of Plei Me SF base, they do not seem to have too much armor, just infantry mostly. Today our operation has several objects, but we must focus our effort to clean out the NVA/VC forces in the region."],
	["Intel", "We do not know the status of any of the LZ's unfortunately, we have suspicion of enemy AAA in the Chu Pong Massif area or nearby it, take care when operating helos in the area."],
	["Tactical", "Secure Landing Zones: <marker name='target1'>LZ Columbus</marker>, <marker name='target2'>LZ Albany</marker>, <marker name='target3'>LZ X-ray</marker>. Secure river crossings at map grids: <marker name='target4'>050077</marker>, <marker name='target5'>055086</marker> and <marker name='target6'>037087</marker>. Neutralize AA threat in the region of <marker name='target7'>Chu Pong Massif</marker> and around it.<br/>Capture the following villages: <marker name='target8'>Plei Ya Bo</marker>, <marker name='target9'>Plei Lao Tchin</marker>, <marker name='target10'>Plei The</marker> and <marker name='target11'>Plei Bi Yot</marker>. This operation is accomplished when these objectives are met."],
	["Orders", "Alpha team (HQ) <marker name='start'>start</marker> from US Army base. You must command your troops to defeat the VC/NVA forces in the region."],
	["Support", "Okay Mr General, this is the big one. You have some special stuff available which I lay out here. From the radio menu (use M map view to bring the big radio up, keyboard is lame) and there Special to access them. <br/><br/><b>Special -> Troop Loading</b> you can use to load 3 infantry squads to the nearby Hueys automatically. Make sure the helos are landed and the infantry squads are in the immediate vicinity (airbase area). <br/><br/><b>Special -> Airmobile Ops</b> is place where you use these Hueys. LZ Crew 1 means when you have troops loaded into the Huey, click lz crew 1 and then place in the MAP, the helo will automatically insert troops into this LZ marked on the map. Use it wisely, dont try to LZ place which is not safe. Same goes for Crew 2 and 3 where you can use what ever LZ position for these air crews (Hueys). <br/><br/><b>Special -> Sat View</b> this is satellite imagery, you can view 15sec of real time satellite feed from anywhere in region by clicking the map.<br/><br/><b>Special -> Spec Ops</b> Special Forces menu, Deploy SF 1 means you will deploy team 1 behind enemy lines (or anywhere you wish) with parachutes. You must have the team inside the airbase area so they can board C-130 for the airdrop. Same for SF 2. <br/><br/> Thats the bulk of the special stuff you have in your command. I suggest you use Sniper and Special Forces teams just for recon, you will learn that intel is vital in this war, you cannot kill the enemy if you do not SEE the enemy. Use your stand off weapon (Cobra) to take out as many enemies as possible. Good luck, I think you're going to need it."],
	["Diary", "Time to teach Charlie a lesson!"],
	["Credits", "Addons used: Vietnam: The Experience.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
