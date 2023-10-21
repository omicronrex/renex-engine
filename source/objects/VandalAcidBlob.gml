#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var vflip;
vflip=Player.vflip

image_yscale=vflip
gravity=0.4*vflip
image_speed=0.4
#define Collision_PlayerKiller
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy_other()
instance_destroy()
#define Collision_DotKiller
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy_other()
instance_destroy()
#define Collision_WCSwitchSpikeParent
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.killer) {
    instance_destroy_other()
    instance_destroy()
}
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
