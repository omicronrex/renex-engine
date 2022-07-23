#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
effect = false
xs = 1
ys = 1
aa = 1
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if other.maxjumps != 2 {
    if (other.maxjumps<2) sound_play("sndGainStar")
    else sound_play("sndLoseStar")
    other.maxjumps = 2
    effect = true
    xs = 1
    ys = 1
    aa = 1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,image_index,x,y)
if effect {
    aa -= .04
    xs += .05
    ys += .05
    draw_sprite_ext(sprite_index,image_index,x+16-16*xs,y+16-16*ys,xs,ys,0,c_white,aa)
    if aa <= 0 effect = false
}
