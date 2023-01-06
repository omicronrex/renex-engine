#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
delay=2*room_speed
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (first) {
    if (instance_place(x,y,Player)) {
        if (!active) {
            with (first) go=1
        }
        active=1
    } else {
        if (active) {
            with (ActualYokuBlock) {
                go=0
                timer=0
            }
            sound_play("sndBlockChange")
        }
        active=0
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
This object is used to group a selection of Yoku Blocks.
Placing it in a room will activate any blocks inside of it,
when the Player object of the engine enters it.
*/
//field delay: number - frames, default is 2x room speed

var count,last;

first=noone

with (ActualYokuBlock) if (instance_place(x,y,other.id)) {
    mygroup=other.id
    if (first) other.first=id
    if (next==noone) next=other.first
    image_index=6.5
}

active=0
