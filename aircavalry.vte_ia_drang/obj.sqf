
hint "Well Done Men!!! The Ia Drang Valley Is Ours.....For Now Anyway.Head Back To Base For Some Well Earned  Beer And BBQ."

private _trig = createTrigger ["EmptyDetector",getmarkerpos "base"];
_trig setTriggerArea[600,600,0,false];
_trig setTriggerActivation ["west", "PRESENT", false];
_trig setTriggerTimeout [600, 600, 600, false ];
_trig setTriggerType "END1";
; 