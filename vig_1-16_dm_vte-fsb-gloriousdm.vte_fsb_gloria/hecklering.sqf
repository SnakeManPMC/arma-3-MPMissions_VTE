private ["_hecklerPos","_hecklerLogicPos","_ranHecklerPos","_ranTargetPos","_fireVector","_scalarX","_scalarY","_scalarZ","_hecklerAmmo"];

_hecklerPos = 
[
	(getPosASL hecklerLogic_0),	
	(getPosASL hecklerLogic_1),	
	(getPosASL hecklerLogic_2),	
	(getPosASL hecklerLogic_3),	
	(getPosASL hecklerLogic_4),	
	(getPosASL hecklerLogic_5),	
	(getPosASL hecklerLogic_6),	
	(getPosASL hecklerLogic_7)	
];

_hecklerLogicPos = getPosASL hecklerLogic;

while {(gameRun)} do
{

	_ranHecklerPos = _hecklerPos select (abs(round(0+((random 9)-(random 9)))));
	_ranHecklerPos set [2,(8-(random 5)-(random 5))];

//hint format ["%1",_ranHecklerPos];


	_ranTargetPos = 
	[
		((_hecklerLogicPos select 0) - ((random 25)-(random 25))),
		((_hecklerLogicPos select 1) - ((random 25)-(random 25))),
		0
	];

	_fireVector = 
	[
		((_ranTargetPos select 0) - (_ranHecklerPos select 0)),
		((_ranTargetPos select 1) - (_ranHecklerPos select 1)),
		((_ranTargetPos select 2) - (_ranHecklerPos select 2))
	];

	_scalarX = ((_ranTargetPos select 0) * (_fireVector select 0))+((_ranTargetPos select 1) * 0)+((_ranTargetPos select 2) * 0);
	_scalarY = ((_ranTargetPos select 0) * 0)+((_ranTargetPos select 1) * (_fireVector select 1))+((_ranTargetPos select 2) * 0);
	_scalarZ = ((_ranTargetPos select 0) * 0)+((_ranTargetPos select 1) * 0)+((_ranTargetPos select 2) * (_fireVector select 2));

	_hecklerAmmo = "R_PG7V_AT" createVehicle _ranHecklerPos;
	_hecklerAmmo setVectorDir [_scalarX,_scalarY,_scalarZ];
//	_hecklerAmmo = "R_Hydra_HE" createVehicle _ranHecklerPos;
//	_hecklerAmmo setVelocity _fireVelo;


sleep (32 - ((random 11)-(random 11)));
};