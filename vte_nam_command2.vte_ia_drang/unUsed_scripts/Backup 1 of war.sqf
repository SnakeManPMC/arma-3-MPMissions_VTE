
VCNum=40;
USNum=40;
_LoopWait=300;
_LoopNum=0;
pmcdb=0;
_OldEastScore = 0;
_OldWestScore = 0;
ScoreHintNow = false;

MapPlaceArray = ["pmcmk_1","pmcmk_2","pmcmk_3","pmcmk_4","pmcmk_5","pmcmk_6","pmcmk_7","pmcmk_8","pmcmk_9","pmcmk_10","pmcmk_11","pmcmk_12","pmcmk_13","pmcmk_14","pmcmk_15","pmcmk_16","pmcmk_17","pmcmk_18","pmcmk_19","pmcmk_20","pmcmk_21","pmcmk_22","pmcmk_23","pmcmk_24","pmcmk_25","pmcmk_26","pmcmk_27","pmcmk_28","pmcmk_29","pmcmk_30"];
MapPlaceArray = MapPlaceArray + ["pmcmk_31","pmcmk_32","pmcmk_33","pmcmk_34","pmcmk_35","pmcmk_36","pmcmk_37","pmcmk_38","pmcmk_39","pmcmk_40","pmcmk_41","pmcmk_42","pmcmk_43","pmcmk_44","pmcmk_45","pmcmk_46","pmcmk_47","pmcmk_48","pmcmk_49","pmcmk_50","pmcmk_51","pmcmk_52","pmcmk_53","pmcmk_54","pmcmk_55","pmcmk_56","pmcmk_57","pmcmk_58","pmcmk_59","pmcmk_60"];
MapPlaceArray = MapPlaceArray + ["pmcmk_61","pmcmk_62","pmcmk_63","pmcmk_64","pmcmk_65","pmcmk_66","pmcmk_67","pmcmk_68","pmcmk_69","pmcmk_70"];

"_x setmarkertype ""empty""" foreach MapPlaceArray;

; this is all the US army soldiers to choose random team member.
_US_Army_Array = ["VTE_armyw","VTE_armywmedic","VTE_armywrto","VTE_armywgl","VTE_armywmg","VTE_armywmortar","VTE_armywlaw","VTE_armywat","VTE_armysniperw"];
_US_MC_Array = ["VTE_soldierwo","VTE_soldierwon","VTE_soldierw","VTE_soldierwm14","VTE_soldierwmedic","VTE_soldierwrto","VTE_soldierwgl","VTE_soldierwmg","VTE_soldierwlaw","VTE_soldierwat","VTE_soldierwmortar",VTE_sniperw];

; NVA/VC soldier name array
_NVA_Array = ["VTE_nvaa","VTE_nvengineer","VTE_nvmg","VTE_nvmedic","VTE_nvrecon","VTE_nvreconrto","VTE_nvmortar","VTE_nvrpg","VTE_nvat","VTE_nvrto","VTE_nvsapper","VTE_nvmark","VTE_nvsoldier"];
_VC_Array = ["VTE_vcsoldier3",VTE_vcengineer,"VTE_vcmg","VTE_vcmedic",VTE_vcrecon,"VTE_vcmortar",VTE_vcrpg,VTE_vcat,"VTE_vcsoldier4",VTE_vcsapper,"VTE_vcsoldier2","VTE_vcmark","VTE_vcsoldier"];

; group starting values in array
_Behaviour = ["SAFE","AWARE","COMBAT","STEALTH"];
_Formation = ["COLUMN","STAG COLUMN","WEDGE","ECH LEFT","ECH RIGHT","VEE","LINE"];
_SpeedMode = ["limited","normal","full"];
_CombatMode = ["GREEN","WHITE","YELLOW","RED"];

TotalEastorig = (count aieast);
_CreatorEast = 0;
TotalWestorig = (count aiwest);
_CreatorWest = 0;

#CreatorINIT
_CreatorEast=(count aieast);
_CreatorWest=(count aiwest);
_LoopNum=_LoopNum+1;


;-------------------------------- START ----------------------------------------------------------
#CreatorStart

#CreatorVC
_ran=0;
_ran=random(1);

e2=objnull;

"VTE_vcofficer" createunit [getpos VC_Start, vcinf1, "e2 = this", _ran, "SERGEANT"]
[e2] join grpnull
_vc1 = group e2;

_A=1;
_B=random(12);

#GroupLoop
_A=_A+1
_ran=0;
_ran=random(1);
_SoldierSelect = _VC_Array select random (count _VC_Array);

_SoldierSelect createunit [getpos VC_Start, vcinf1, "e1 = this", _ran, "CORPORAL"]
[e1] join grpnull;
[e1] join _vc1;

if (_A < _B) then { goto "GroupLoop"; };

;
; set some modes for these guys
;
_temp = _Behaviour select random (count _Behaviour);
_vc1 setbehaviour _temp;
_temp = _CombatMode select random (count _CombatMode);
_vc1 setcombatmode _temp;
_temp = _SpeedMode select random (count _SpeedMode);
_vc1 setspeedmode _temp;
_temp = _Formation select random (count _Formation);
_vc1 setformation _temp;

if (pmcdb == 1) then { player sidechat format["--- VC --- Created: %1 group: %2, east: %3",_B,_B+1,(count aieast)]; };
~.5




; NVA
e2=objnull;

_ran=0;
_ran=random(1);

"VTE_nvofficer" createunit [getpos VC_Start2, vcinf2, "e2 = this", _ran, "SERGEANT"]
[e2] join grpnull
_vc1 = group e2;

_A=1;
_B=random(12);

#GroupLoop2
_A=_A+1
_ran=0;
_ran=random(1);
_SoldierSelect = _NVA_Array select random (count _NVA_Array);

_SoldierSelect createunit [getpos VC_Start2, vcinf2, "e1 = this", _ran, "CORPORAL"]
[e1] join grpnull;
[e1] join _vc1;

if (_A < _B) then { goto "GroupLoop2"; };

_temp = _Behaviour select random (count _Behaviour);
_vc1 setbehaviour _temp;
_temp = _CombatMode select random (count _CombatMode);
_vc1 setcombatmode _temp;
_temp = _SpeedMode select random (count _SpeedMode);
_vc1 setspeedmode _temp;
_temp = _Formation select random (count _Formation);
_vc1 setformation _temp;

if (pmcdb ==1) then { player sidechat format["--- NVA --- Created: %1 group: %2, east: %3",_B,_B+1,(count aieast)]; };
~.5

goto "CreatorEND";










;--------------------------- US ----------------------------------------------------------------
#CreatorUS

; US Army
_ran=0;
_ran=random(1);

e2=objnull;

"VTE_armywo" createunit [getpos US_Start, usinf1, "e2 = this", _ran, "SERGEANT"]
[e2] join grpnull
_vc1 = group e2;

_A=1;
_B=random(12);

#GroupLoopWest
_A=_A+1
_ran=0;
_ran=random(1);
_SoldierSelect = _US_Army_Array select random (count _US_Army_Array);

_SoldierSelect createunit [getpos US_Start, usinf1, "e1 = this", _ran, "CORPORAL"]
[e1] join grpnull;
[e1] join _vc1;

if (_A < _B) then { goto "GroupLoopWest"; };

;
; set some modes for these guys
;
_temp = _Behaviour select random (count _Behaviour);
_vc1 setbehaviour _temp;
_temp = _CombatMode select random (count _CombatMode);
_vc1 setcombatmode _temp;
_temp = _SpeedMode select random (count _SpeedMode);
_vc1 setspeedmode _temp;
_temp = _Formation select random (count _Formation);
_vc1 setformation _temp;

if (pmcdb == 1) then { player sidechat format["--- US ARMY --- Created: %1 group: %2, west: %3",_B,_B+1,(count aiwest)]; };
~.5




; Marines
e2=objnull;

_ran=0;
_ran=random(1);

"VTE_soldierwo" createunit [getpos US_Start2, usinf2, "e2 = this", _ran, "SERGEANT"]
[e2] join grpnull
_vc1 = group e2;

_A=1;
_B=random(12);

#GroupLoop2West
_A=_A+1
_ran=0;
_ran=random(1);
_SoldierSelect = _US_MC_Array select random (count _US_MC_Array);

_SoldierSelect createunit [getpos US_Start2, usinf2, "e1 = this", _ran, "CORPORAL"]
[e1] join grpnull;
[e1] join _vc1;

if (_A < _B) then { goto "GroupLoop2West"; };

_temp = _Behaviour select random (count _Behaviour);
_vc1 setbehaviour _temp;
_temp = _CombatMode select random (count _CombatMode);
_vc1 setcombatmode _temp;
_temp = _SpeedMode select random (count _SpeedMode);
_vc1 setspeedmode _temp;
_temp = _Formation select random (count _Formation);
_vc1 setformation _temp;

if (pmcdb == 1) then { player sidechat format["--- MARINES --- Created: %1 group: %2, west: %3",_B,_B+1,(count aiwest)]; };
~.5



;---------------------------- CREATOR END -------------------------------------------------------
#CreatorEND

if (count aieast < VCNum) then { goto "CreatorVC"; };
;if (count aiwest < USNum) then { goto "CreatorUS"; };

_CreatorEast = ((count aieast) - _CreatorEast);
_CreatorWest = ((count aiwest) - _CreatorWest);

TotalEastorig = TotalEastorig + _CreatorEast;
TotalWestorig = TotalWestorig + _CreatorWest;

if (pmcdb == 1) then { player sidechat format["_creatoreast: %1, All: %2, Orig: %3, _creatorwest: %4, ALL: %5, Orig: %6",_CreatorEast,(count aieast),TotalEastorig,_CreatorWest,(count aiwest),TotalWestorig]; };
~5




;------------------------------------------------------------------------------------------------
#idle

_masterlist = []
_masterlist = aieast;

_cc=0
_cclimit = 0;
_cclimit = (count _masterlist)-1;

#cloop
groupE1=group (_masterlist select _cc)

if (("unitready _x" count units groupE1)==(count units groupE1)) then {goto "atvillage"};

#carryon
_cc=_cc + 1
?(_cc > _cclimit):goto "endcycle2"
goto "cloop"

#atvillage
_fish = MapPlaceArray select random (count MapPlaceArray -1);
move_pos = getmarkerpos _fish;
"vc1" setmarkerpos move_pos;

if (pmcdb == 1) then { player sidechat format["leader: %1, move_pos: %2",(leader groupE1),move_pos]; };
~1

[groupE1,0] setwppos move_pos;

"_x domove getwppos [groupE1,0] " foreach units groupE1;
units groupE1 Commandmove move_pos;
goto "carryon"

#endcycle2



;
; scores stuff, should we hint the players or not.
;
TotalEastCount = TotalEastorig - (count aieast);
TotalWestCount = TotalWestorig - (count aiwest);
publicvariable "TotalEastCount";
publicvariable "TotalWestCount";

; lets hint if the last score is different that in this loops score.
if (_OldEastScore < TotalEastCount OR _OldWestScore < TotalWestCount) then { ScoreHintNow=true; };
; this scorehint argh
;titleText [format["VC kills: %1\nUS kills: %2",TotalEastCount,TotalWestCount],"plain"]; hint format["VC kills: %1\nUS kills: %2",TotalEastCount,TotalWestCount];

; these are the old scores from last loop, update them.
_OldEastScore = TotalEastCount
_OldWestScore = TotalWestCount

if (pmcdb == 1) then { player sidechat format["waiting %1 sec... VC kills: %2, VC orig: %3, Westcount: %4, WestOrig: %5, ALL: %6, Deaths All: %7",_LoopWait,TotalEastCount,TotalEastorig,TotalWestCount,TotalWestorig,(count aieast + count aiwest),(TotalEastCount+TotalWestCount)]; };

~_LoopWait

_CreatorEast = 0;
_CreatorWest = 0;

if (TotalEastCount > 100) then { goto "Ending"; };
if (TotalWestCount > 100) then { goto "EndingBad"; };
if ( (count aieast < VCNum) OR (count aiwest < USNum) ) then { goto "CreatorINIT"; } else { goto "idle"; };


#Ending
~15
leader hqteam sideradio "MISSION ACCOMPLISHED. WE HAVE WON. OVER.";
~5

"1" objstatus "DONE";

mcomplete=true;
hint "Get close to the US HQ base field hospital to complete the mission.";

exit


#EndingBad
~15
leader hqteam sideradio "MISSION ACCOMPLISHED. WE LOST. OVER.";
~5

"1" objstatus "FAILED";

mfailed=true;
hint "Get close to the US HQ base field hospital to complete the mission.";

exit
