#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
destroy=false //set to true in creation code for one-time use
waterSpeed=2  //how fast the water goes when it's created
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
