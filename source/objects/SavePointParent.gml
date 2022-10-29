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

//used when global.press_shoot_saves
notice=0
font=fntSignpost
color=$ffffff
msg=key_get_name(key_shoot)+lang("presstosave")

if (difficulty>mydifficulty) {
    instance_destroy()
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///save

//we save on begin step to make sure the player isn't stuck somewhere
if (save) {
    save=0
    savedata_save(false,name)
    
    if (global.centered_saving) {
        savedatap("x",x+17)
        if (global.save_valign && settings("valign")) savedatap("y",y+16+7*Player.vflip)
        else savedatap("y",floor(y+16+7*Player.vflip))    
    }
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.contact_saves) {
    event_user(0)
} else if (global.press_shoot_saves) {
    notice=1
}
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!global.contact_saves && !global.press_shoot_saves && !other.dead) event_user(0)
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
///schedule save
if (image_index==0) {
    with (Player) if (instance_place(x,y,AntiSoftlockBlock)) exit
    if ((Player.vflip==1 && (image_angle<45 || image_angle>315)) || (Player.vflip==-1 && abs(image_angle-180)<45) || global.flip_saves) {
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
draw_self()

if (notice) {
    draw_sign_text(x+16,y-10,font,color,msg,false)
    notice=0
}
