#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
c=0

repeat (50/dt) {
    c+=dt
    if (c>1) {
        c-=1
        instance_create(400,304,TitleParticle)
    }
    with (TitleParticle) {event_step() x+=hspeed y+=vspeed}
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
c+=dt
if (c>1) {
    c-=1
    instance_create(400,304,TitleParticle)
}

if (input_anykey()) {
    if (room=rmTitle && keyboard_key!=vk_escape && keyboard_key!=vk_f11 && keyboard_key!=vk_escape && keyboard_key!=vk_alt) {
        room_goto_next()
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (room=rmTitle) {
    draw_set_font(fntFileBig)
    draw_text(x,y,"RENEX ENGINE")
    draw_set_font(fntFileSmall)
    draw_set_valign(2)
    draw_text(40,608-40+2,re_version)
    draw_set_valign(0)
}
