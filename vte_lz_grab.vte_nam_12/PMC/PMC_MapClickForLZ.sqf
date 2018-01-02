/*

	This script is run from radio 0-0-1 command.

*/

hint "Click map for LZ location.";

// should I put here !isServer exitwith to not run this on all clients?
// or put it actually on the PMC_lz_prepare :)
onMapSingleClick {PMC_Setup_My_LZ = _pos; publicVariable 'PMC_Setup_My_LZ'; onMapSingleClick {}; true;};
