#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
my_spike=SpikeR
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy_other()

a=instance_create(x,y,PastelWater)
a.hspeed=waterSpeed

if (destroy) instance_destroy()
if (spike_return) {instance_create(x,y,my_spike) instance_destroy()}
