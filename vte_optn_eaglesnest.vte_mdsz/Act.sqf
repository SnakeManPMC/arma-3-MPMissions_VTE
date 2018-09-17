
private _damap=_this select 0;
private _dude=_this select 1;
private _act=(_this select 3)select 0;

if (_act>10) then
{
	hint ("teleport malfunction");
};

private _s0="RZ"+str(_act);
private _pos=getMarkerPos _s0;
_dude setPos _pos;
if (_act<1) then
{
	hint("transferred to Airbase");
}
else
{
	hint("transferred to selected Zone"+str(_act));
};
