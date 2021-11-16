#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
vflip=1
save=0
angle=0

name=room_get_name(room)+"@"+string(round(x))+"x"+string(round(y))

//used when global.press_s_saves
notice=0
font=fntSignpost
color=$ffffff
msg=key_get_name(key_shoot)+lang("presstosave")
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//we save on begin step to make sure the player isn't stuck somewhere
if (save) if (instance_exists(Player)) {
    save=0
    savedata_save(false,name)
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.flip_saves) {
    angle=-view_angle
    image_angle=roundto(angle,90)
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.contact_saves) {
    event_user(0)
} else if (global.press_s_saves) {
    notice=1
}
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!global.contact_saves && !global.press_s_saves) event_user(0)
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_index==0) if (instance_exists(Player)) {
    if (Player.vflip==vflip || global.flip_saves) {
        image_index=1
        image_speed=1/room_speed
        sound_play("sndSave")
        save=1
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,floor(image_index),x+16-lengthdir_x(16,angle)-lengthdir_x(16,angle-90),y+16-lengthdir_y(16,angle)-lengthdir_y(16,angle-90),1,1,angle,$ffffff,1)

if (notice) {
    draw_sign_text(x+16,y-10,font,color,msg,false)
    notice=0
}
