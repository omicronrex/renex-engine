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
var yes;yes=0

vflip=Player.vflip

//check for other ladders above myself
yes=!instance_place(x,y-vflip,object_index)

//allow the player to come down from the top
if (yes) with (Player) if (key[pick(!vflip,key_down,key_up)] || ladder || instance_place(x,y-vflip,other.object_index)) yes=0

//add or remove collision accordingly
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
plat.image_xscale=image_xscale
plat.image_yscale=image_yscale
plat.image_angle=image_angle
