#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=3/50
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var yes;yes=0
with (Yoshi) if (active) {yes=1 break}

if (yes && !solid) {
    solid=1
    block=instance_create(x,y,Block)
}
if (!yes && solid) {
    solid=0
    instance_destroy_id(block)
}
