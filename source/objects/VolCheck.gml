#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
view_wview=global.width
view_hview=global.height
view_wport=global.width
view_hport=global.height
view_visible=1
view_enabled=1
window_set_size(global.width,global.height)
window_set_region_size(global.width,global.height,1)
window_resize_buffer(global.width,global.height)
window_center()
room_speed=global.game_speed
alarm[0]=room_speed

fade=0
alpha=0

volumedelay=25
volumefpi=5
volumetimer=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=room_speed
sound_play("sndShoot")
effect_create_above(ef_ring,global.width/2,global.height/2,2,$808080)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
h=global.key[key_up]-global.key[key_down]

if (h!=0) {
    if (volumetimer>volumedelay || !(volumetimer mod volumefpi)) {
        settings("sfxvol",median(0,settings("sfxvol")+h*0.01,1))
    }
    volumetimer+=1
} else volumetimer=0

sound_set_sfx_volume(1)

if (global.key_pressed[key_jump] && !fade) {
    settings("volcheck",true)
    sound_play("sndDJump")
    settings("musvol",settings("sfxvol"))
    sound_kind_volume(3,settings("sfxvol"))
    sound_kind_volume(1,settings("musvol"))
    fade=1
    alarm[0]=-1
}

if (fade) {
    alpha=min(1.5,alpha+1/room_speed)
    if (alpha==1.5) {
        settings("musvol",settings("sfxvol"))
        room_goto_next()
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
room_caption=re_version
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_clear(0)
draw_set_font(fntFileBig)
draw_set_valign(2)
draw_set_halign(2)
draw_text(global.width-16,global.height-16,lang("volcheck")+"["+key_get_name(key_jump)+"]"+lang("volcheck2"))
draw_set_halign(0)
draw_text(16,global.height-16,lang("volcheckvol")+": "+string(round(settings("sfxvol")*100))+"%#"+lang("volcheck3")+"["+key_get_name(key_up)+"]"+lang("volcheck4")+"["+key_get_name(key_down)+"]")
draw_set_valign(0)

if (fade) rect(0,0,global.width,global.height,background_color,alpha)
