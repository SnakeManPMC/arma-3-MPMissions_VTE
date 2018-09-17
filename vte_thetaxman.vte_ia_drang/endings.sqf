/*
; Ballistic Addon Studio
; MH47E Special Operations Chinook
; Cinematics
;
; Modified by Ebud for The Taxman
; =========================================================================================
*/
private _endtype = _this select 1;

if (_endtype == "Win") then
{
	endwin=true;
	publicvariable "endwin";
};

if (_endtype == "Lose") then
{
	endlose=true;
	publicvariable "endlose";
};

if (_endtype == "Fail") then
{
	endfail=true;
	publicvariable "endfail";
};

if (_endtype == "Fail2") then
{
	endfail2=true;
	publicvariable "endfail2";
};
