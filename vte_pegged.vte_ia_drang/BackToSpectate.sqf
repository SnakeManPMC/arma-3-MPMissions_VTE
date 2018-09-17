/*; 
; Script for the spectating script by Kegetys <Kegetys@raketti.net> 
; http://www.ofp.kege.cjb.net
;
*/
DeathCam cameraEffect ["internal","front"];
_ok = createDialog "DlgSpectateDeath";
DeathCam1stPerson = false;
(vehicle DeathCamCurTarget) removeAction DeathCamSpecMenuAction;
