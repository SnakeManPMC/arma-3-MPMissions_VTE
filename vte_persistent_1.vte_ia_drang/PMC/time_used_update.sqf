
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
	
	_day = floor (time / 3600 / 24);
	_hrs = floor (time / 3600);
	_min = floor ((time / 60) - _hrs * 60);
	_sec = floor (time - _min * 60 - _hrs * 3600);
	
	format["%1day %2hrs %3min %4sec", _day call _addZero, _hrs call _addZero, _min call _addZero, _sec call _addZero];
};
