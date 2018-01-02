/*
	Select BLUFOR start from PMC_BLUFOR_starts array

Syntax:
call compile preProcessFileLineNumbers "PMC\PMC_Select_BLUFOR_starts.sqf";
_gamelogic = call PMC_Select_BLUFOR_starts;

Requires:
[position array]

Returns:
location as game logic name

*/

PMC_Select_BLUFOR_starts =
{
	private
	[
		"_ran",
		"_tlogic"
	];
	_ran = (floor random (count PMC_blufor_starts));
	_tlogic = (PMC_blufor_starts select _ran);

	_tlogic
};
