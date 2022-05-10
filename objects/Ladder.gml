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
var yes;

vflip=1
if (instance_exists(Player)) {
    vflip=Player.vflip

    yes=!place_meeting(x,y-vflip,object_index)

    if (yes) with (Player) if (key[pick(!vflip,key_down,key_up)] || ladder || place_meeting(x,y-vflip,other.object_index)) yes=0
}

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
