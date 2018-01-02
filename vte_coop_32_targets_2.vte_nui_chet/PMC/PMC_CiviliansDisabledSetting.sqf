
if ( (paramsarray select 5) == 0 ) then
{
	PMC_DisableCivilians = false;
}
else
{
	PMC_DisableCivilians = true;
};

diag_log format["PMC_DisableCivilians: %1", PMC_DisableCivilians];
