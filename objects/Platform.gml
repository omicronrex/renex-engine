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
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (path_index!=-1 && path_speed!=0) {
    get_path_speed()
    with (Player) if (place_meeting(x,y+2*vflip,other.id)) {
        move_player(x+other.hspeed,y+other.vspeed,1)
    }
} else if (hspeed!=0 || vspeed!=0) {
    if (hspeed!=0) if (!place_free(x+hspeed,y)) hspeed=-hspeed
    if (vspeed!=0) if (!place_free(x,y+vspeed)) vspeed=-vspeed
    with (Player) if (place_meeting(x,y+2*vflip,other.id)) {
        move_player(x+other.hspeed,y+other.vspeed,1)
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
    draw_sprite_part(sprite_index,0,10,0,bbox_right-8-i,16,i,y)
    draw_sprite_part(sprite_index,0,22,0,10,16,bbox_right-8,y)
} else draw_self()
