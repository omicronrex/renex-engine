#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
snap_type=0
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
    snap types:
    0 - yuuutu - inconsistent snap, how it works in most engines
    1 - hard - always snap regardless of vertical movement, also snaps when near the top
    2 - light - snaps only when near the top
    3 - none - don't snap at all, act like one-way blocks
*/
//field snap_type: number
//field visible: bool
//field path: path
//field speed
//field path_action: enum(path_action_continue,path_action_restart,path_action_reverse,path_action_stop)
//field path_absolute: bool
//field phase: bool - lets the platform go through blocks
//field hspeed
//field vspeed

if (path!=noone) {
    path_start(path,speed,path_action,path_absolute)
}
