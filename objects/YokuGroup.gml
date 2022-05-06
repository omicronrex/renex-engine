#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (first) {
    if (place_meeting(x,y,Player)) {
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
var count,last;

first=noone

with (ActualYokuBlock) if (place_meeting(x,y,other.id)) {
    if (first) other.first=id
    if (next==noone) next=other.first
    image_index=6.5
}

active=0
