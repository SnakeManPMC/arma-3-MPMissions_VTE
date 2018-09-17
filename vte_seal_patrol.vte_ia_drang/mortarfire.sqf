/*
; SEAL PATROL
; SEB NAM Mission
; by Nagual 2002
; mortarfire.sqs - NVA 60mm
*/
private _mortar = _this select 0;

while {true} do
{
	_mortar fire "sebm19mortar60"
	sleep 15;
	_mortar fire "sebm19mortar60"
	sleep 25;
	_mortar fire "sebm19mortar60"
	sleep 35;
	_mortar fire "sebm19mortar60"
	sleep 15;
	_mortar fire "sebm19mortar60"
	sleep 25;
	_mortar fire "sebm19mortar60"
	sleep 5;
	_mortar fire "sebm19mortar60"
	sleep 45;
	_mortar fire "sebm19mortar60"
	sleep 35;
	_mortar fire "sebm19mortar60"
	sleep 25;
	_mortar fire "sebm19mortar60"
	sleep 65;
	_mortar fire "sebm19mortar60"
	sleep 35;
	_mortar fire "sebm19mortar60"
	sleep 25;
	_mortar addmagazine "sebmortar60HE"
};
