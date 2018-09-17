/*
;
; make two triggers, one for east one for west
; activation by sidethingy and activation field "eastunits = thislist;"
;
*/
private _elist=count eastlist;
private _wlist=count westlist;

//; "Tank" countType list triggerOne
private _etank= ("Tank" counttype eastlist);
private _wtank= ("Tank" counttype westlist);
private _eapc= ("APC" counttype eastlist);
private _eman= ("Man" counttype eastlist);
private _wman= ("Man" counttype westlist);
private _all=(count eastlist + count westlist);

hint format ["East: %1, West: %2\nEtank: %3, Wtank: %4\nEAPC: %5\nEman: %6, Wman: %7\nALL: %8",_elist,_wlist,_etank,_wtank,_eapc,_eman,_wman,_all];
