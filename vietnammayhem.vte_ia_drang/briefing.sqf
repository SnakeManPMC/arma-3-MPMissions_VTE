if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["credits","Credits"];
player createDiarySubject ["Mission","Mission Briefing"];

player createDiaryRecord ["credits", 
[
"", 
"
This mission created by Griffin of Devil Dog RPG <br/>
It is (c)2010 Devil Dog RPG and unpermitted use is prohibited <br/>


<br/>
Tested By the Devil Dog RPG DevelopMent TEAM <br/>
"
]
];

player createDiaryRecord ["Mission", 
[
"", 
"
You are a 4 man commando unit inserted remotely into the Jungles of Vietnam. <br/> 
Your mission is to clear all NVA Outposts and finally the NVA Military base <br/>
Failure is not an option! <br/>

(C)2010 DevilDog RPG
"
]
];