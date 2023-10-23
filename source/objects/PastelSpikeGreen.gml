#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
destroy=false //set to true in fields for one-time use
waterSpeed=2  //how fast the water goes when it's created
image_speed=0
spike_return=false //turns back into a regular spike when true
my_spike=SpikeD //which spike to turn back into
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy_other()

a=instance_create(x,y,PastelWater2)
a.vspeed=waterSpeed

if (destroy) instance_destroy()
if (spike_return) {instance_create(x,y,my_spike) instance_destroy()}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field destroy: bool - destroys the spike when shot
//field spike_return: bool - turns back to a regular spike when shot

if (!spike_return) image_index=destroy
else image_blend=c_ltgray
