#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path=noone
path_action=path_action_reverse
path_absolute=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (path_index!=-1 && path_speed!=0) {
    get_path_speed()
} else {
    if (hspeed!=0) if (!place_free(x+hspeed,y)) hspeed=-hspeed
    if (vspeed!=0) if (!place_free(x,y+vspeed)) vspeed=-vspeed
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field path: path
//field speed
//field path_action: enum(path_action_continue,path_action_restart,path_action_reverse,path_action_stop)
//field path_absolute: bool
//field snap: bool
//field hspeed
//field vspeed

if (path!=noone) {
    path_start(path,speed,path_action,path_absolute)
}
