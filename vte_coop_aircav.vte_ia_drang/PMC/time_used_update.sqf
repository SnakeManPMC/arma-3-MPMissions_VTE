
PMC_Time_Used_Update =
{
	private
	[
		"_addZero",
		"_day",
		"_hrs",
		"_min",
		"_sec"
	];

	_addZero =
	{
		if (_this < 10) then
		{
			format["0%1", _this];
		}
		else
		{
			str _this;
		};
	};

	_day = floor (time / 86400);
	_hrs = floor ((time / 3600) mod 24);
	_min = floor ((time / 60) mod 60); // ((time / 60) - (_hrs * 60));
	_sec = floor (time mod 60); // (time - (_min * 60) - (_hrs * 3600));

	format["%1day %2hrs %3min %4sec", _day, _hrs call _addZero, _min call _addZero, _sec call _addZero];
};

/*
worth to try?
days = (time / 86400)
hours = (time / 3600) mod 24
minutes = (time / 60) mod 60
seconds = time mod 60
*/
