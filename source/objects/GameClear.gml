#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=sets the savedata to clear state
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!savedatap("clear")) {
    savedatap("clear",true)
    autosave_asap()
    savedata_write()
}
