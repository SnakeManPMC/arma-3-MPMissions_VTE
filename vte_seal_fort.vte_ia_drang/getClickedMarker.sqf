private ["_x","_y","_markers","_ID","_minDist","_N","_i","_markerPos","_dist","_threshold"];

_x = (_this select 0) select 0;
_y = (_this select 0) select 1;
_threshold = _this select 1;
_threshold = _threshold ^ 2;
_markers = _this select 2;

_ID = -1;
_minDist = _threshold;
_N = count _markers;
_i = 0;

while {_i < _N} do
{
	_markerPos = getMarkerPos (_markers select _i);
	_dist = (_x - (_markerPos select 0))^2 + (_y - (_markerPos select 1))^2;
	if (_dist < _threshold) then
	{
		if (_dist < _minDist) then
		{
			_minDist = _dist;
			_ID = _i;
		};
	};
	_i = _i + 1;
};

_ID;
