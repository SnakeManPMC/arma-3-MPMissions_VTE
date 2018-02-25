
[] execVM "PMC\PMC_init.sqf";

[[
	["PMC_objective1", "Capture", "Capture <marker name='target1'>Plei Me</marker> from enemy hands.", true, ["target1", getMarkerPos "target1"]],
	["PMC_objective2", "Kill", "Kill over 200 charlie! and then return to <marker name='start'>HQ</marker>.", true, []]
],[
	["Orders", "Your <marker name='start'>HQ</marker>. Proceed to capture Plei Me SF Base and then hunt and kill over 200 Charlie in the jungle. Return to HQ when done."],
	["Credits", "Addons used: VTE.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

/*
2018-02-25

this was previously in briefing.html, now... I have no clue if the above taskmaster briefing or this below html is the proper one, heh fucking hell! :)


<h2><a name="Main"></a></h2>
<! --- Notes section>
<h6>
<p>

VC, that freaking VC...
</h6>
</p>


<hr>
<! --- Briefing section>
<p><a name="plan"></a>
See <a href="#MySection">War Situation</a> for details.<br><br>

Alpha team <a href="marker:start">start</a> from airbase, hunt down and
kill all VC and NVA soldiers you can find.
</p>
<hr>

<h2><a name="MySection">PMC VC Jungle</a></h2>
<p>
<b>GEN SITREP</b><br>
Its tough fight here in southern Vietnam but we must keep pushing on the enemy. Enemy 
forces have taken SF firebase and now we must retake it from them.
<br><br>

<b>INTEL</b><br>
We have lot of enemy infantry hiding and operating in the jungle, they have no vehicles
at move. The target area is under enemy presence, they have machine gun emplacements there.
<br><br>

<b>ORDERS</b><br>
Alpha team <a href="marker:start">start</a> from airbase, hunt down and kill all VC and NVA 
soldiers you can find. Your secondary mission is to 
take <a href="marker:target1">SF Firebase</a> from the enemy and hold it.
<br><br>

<b>TACTICAL</b><br>
Watch out for the VC, they are very good lurking on the jungle.
<br><br>

<a href="#plan">Back to plan</a>
</p>
<hr>



<! ---THE FOLLOWING IS THE TEXT FOR THE FIRST SECTION ON THE OBJECTIVE LIST>
<p><a name = "OBJ_1"></a>Neutralize SF Firebase
</p>
<hr>

<p><a name = "OBJ_2"></a>Kill over 200 VC and NVA
*/
