#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=will move when stood on
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
active=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) if (distance_to_object(Player)<2) {
    active=true
    hspeed=hsp
    vspeed=vsp
}

event_inherited()
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field path: path
//field speed
//field path_action: enum(path_action_continue,path_action_restart,path_action_reverse,path_action_stop)
//field path_relative: bool
//field snap: bool
//field hspeed
//field vspeed

hsp=hspeed
vsp=vspeed
speed=0
