#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//you can set those in creation code
path=noone
path_action=path_action_reverse
path_relative=true

snap=true

hdeficit=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var moveplayer;moveplayer=0

if (path_index!=-1 && path_speed!=0) {
    get_path_speed()
    moveplayer=1
} else if (hspeed!=0 || vspeed!=0) {
    if (hspeed!=0) if (!place_free(x+hspeed,y)) hspeed=-hspeed
    if (vspeed!=0) if (!place_free(x,y+vspeed)) vspeed=-vspeed
    moveplayer=1
}

if (moveplayer) {
    //due to player's rounding, it's impossible to move the player only part of a pixel
    //so we store and make use of deficit counters
    hspeed+=hdeficit
    hdeficit=hspeed-round(hspeed)
    with (Player) if (place_meeting(x,y+2*vflip,other.id)) {
        move_player(x+round(other.hspeed),y+other.vspeed,1)
    }
}
#define Collision_NiseBlock
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=113
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=114
applies_to=self
invert=0
*/
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field path: path
//field speed
//field path_action: enum(path_action_continue,path_action_restart,path_action_reverse,path_action_stop)
//field path_relative: bool
//field snap: bool
//field hspeed
//field vspeed

if (path!=noone) {
    path_start(path,speed,path_action,!path_relative)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index=sprDynamicPlatform && image_xscale!=1 && image_angle==0) {
    //i feel like renex has better things to do with their time than make an auto platform script that only like, 2 people will use for practical uses
    draw_sprite_part(sprite_index,0,0,0,10,16,x,y)
    for (i=x+10;i<bbox_right-9-12;i+=12) {
        draw_sprite_part(sprite_index,0,10,0,12,16,i,y)
    }
    draw_sprite_part(sprite_index,0,10,0,bbox_right-9-i,16,i,y)
    draw_sprite_part(sprite_index,0,22,0,10,16,bbox_right-9,y)
} else draw_self()
