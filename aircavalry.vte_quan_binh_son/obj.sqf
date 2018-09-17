
hint "Good Job Boys!!! QUAN BINH SON Is Clear Of VC And The Remnants Of The NVA Regiment Have Fled The Area .Head Back To Base For Some Well Earned  Beer And BBQ.";

private _trig = createTrigger ["EmptyDetector",getmarkerpos "base"];
_trig setTriggerArea[600,600,0,false];
_trig setTriggerActivation ["west", "PRESENT", false];
_trig setTriggerTimeout [540, 540, 540, false ];
_trig setTriggerType "END1";
