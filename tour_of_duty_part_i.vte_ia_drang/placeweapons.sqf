/*
;************************************************************************************************************;
;                                                                                                            ;
; PLACE WEAPONS                                                                                              ;
;                                                                                                            ;
; Positions a number of weapons at a selected position                                                       ;
;                                                                                                            ;
; � 2006 - Kronzky (kronzky@gmail.com)                                                                       ;
;                                                                                                            ;
;************************************************************************************************************;
;                                                                                                            ;
; Call arguments: [place, height, direction, weapon, ammo, type, copies, distance]                           ;
;                                                                                                            ;
; place         = Object that defines the 2D-position of the placement (can be a game logic)                 ;
; height        = Distance from the ground for placement.                                                    ;
; direction     = Angle of weapons orientation.                                                              ;
; weapon        = Weapons name                                                                               ;
; ammo          = Ammo name                                                                                  ;
; type          = Specifies whether weapon is primary (1) or secondary (2) weapon.                           ; 
;                 (use 2 if weapon appears upright)                                                          ;
; copies        = How many copies of the weapon should be placed. (optional)                                 ;
; distance      = How far apart weapons copies should be placed (only required if <copies> is declared)      ;
;                                                                                                            ;
; [table1, 0.95, 0, "m16", "m16", 1, 5, 0.2] exec "placeweapons.sqs"                                         ;
; will place 5 M16s 20cm apart at the position of object 'table1', at a height of .95.                       ;
;                                                                                                            ;
; The names for weapons and ammo are available on the wiki: community.bistudio.com/wiki/Category:Weapons     ;
;                                                                                                            ;
;************************************************************************************************************;
*/
//how many magazines per weapon should be created?
private _magspergun = 5;
//should weapons be usable by player and AI?
private _usable = true;

private _place = _this select 0;
private _x = getpos _place select 0;
private _y = getpos _place select 1;
private _z = _this select 1;
private _dir = _this select 2;
private _weapon = _this select 3;
private _ammo = _this select 4;
private _type = _this select 5;
private _holdertype = if (_type==2) then {"secondaryweaponholder";} else {"weaponholder";};
private _copies=0;
private _dist=0;
if (format["%1",_this select 6]!="<null>") then
{
	_copies=(_this select 6)-1;
	_dist = _this select 7;
};

private _dx = sin(_dir)*_dist;
private _dy = cos(_dir)*_dist;

if (_copies>0) then
{
	_x=_x-(_copies/2)*_dx;
	_y=_y-(_copies/2)*_dy;
};

private _cnt=0;
while { (_cnt<=_copies) } do
{
	_holder = _holdertype createVehicle [0,0];
	if (_ammo!="") then
	{
		holder addmagazinecargo [_ammo,_magspergun];
	};
	
	if (_weapon!="") then
	{
		_holder addweaponCargo [_weapon,1];
	};
	
	_holder setdir _dir;
	_holder setpos [_x,_y,_z];
	if (_usable) then
	{
		player reveal _holder;
	};
	
	_x = _x + _dx;
	_y = _y + _dy;
	
	_cnt=_cnt+1;
};
