#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
plat=noone
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var yes;yes=1

with (Player) if (key[key_down] || ladder || place_meeting(x,y,other.object_index)) yes=0

if (yes) plat.sprite_index=sprite_index
else plat.sprite_index=-1
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
plat=instance_create(x,y,JumpThrough)
plat.sprite_index=-1
