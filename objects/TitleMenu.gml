#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
c+=dt
if (c>1) {
    c-=1
    instance_create(global.width/2,global.height/2,TitleParticle)
}

if (input_anykey()) {
    if (room=rmTitle && keyboard_key!=vk_escape && keyboard_key!=vk_f11 && keyboard_key!=vk_escape && keyboard_key!=vk_alt) {
        room_goto_next()
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
c=0

repeat (80/dt) {
    c+=dt
    if (c>1) {
        c-=1
        instance_create(global.width/2,global.height/2,TitleParticle)
    }
    with (TitleParticle) {event_step() x+=hspeed y+=vspeed}
}
