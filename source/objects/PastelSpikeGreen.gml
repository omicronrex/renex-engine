#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
destroy=false //set to true in creation code for one-time use
waterSpeed=2  //how fast the water goes when it's created
image_speed=0
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
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field destroy: bool

image_index=destroy
