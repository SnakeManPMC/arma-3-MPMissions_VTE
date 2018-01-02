
if ( (paramsarray select 4) == 0 ) then
{
	PMC_DisableSAMSites = false;
}
else
{
	PMC_DisableSAMSites = true;
};

diag_log format["PMC_DisableSAMSites: %1", PMC_DisableSAMSites];
