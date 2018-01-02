
player sideChat format
[
	"Sitrep; KIAs: %1, US: %2, NVA/VC: %3. Active enemy bases: %4. Groups: %5. US KIAS: %6. NVA/VC KIAS: %7",
	PMC_killedNum,
	PMC_blufor,
	PMC_opfor,
	PMC_NVA_Bases,
	PMC_grpNum,
	(PMC_blufor - count aiwest),
	(PMC_opfor - count aieast)
];
