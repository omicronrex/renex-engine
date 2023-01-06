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
image_speed=0

go=0
timer=0

next=noone
first=false
mygroup=noone
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go) {
    timer+=1
    if (timer==1) sound_play("sndBlockChange")
    image_index=max(0,image_index-0.5)
    if (timer>=mygroup.delay) {
        go=0
        timer=0
        with (next) go=1
    }
} else {
    image_index=min(6.5,image_index+0.5)
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field next: instance
//field first: bool
