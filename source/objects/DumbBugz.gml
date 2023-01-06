#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (inside_view()) {
    hspeed=choose(-2,2)
    vspeed=choose(-2,2)
}
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy_other()
sound_play("sndDeath")
instance_change(DeadBugz,1)
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=115
applies_to=self
invert=0
arg0=0
arg1=0
*/
