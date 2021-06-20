#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
ready=false
alarm[0]=5
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ready=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.key_pressed[key_shoot] && ready) {
    with (Player) if (place_meeting(x,y,other.id)) kill_player()
    i=instance_create(x,y,ToggleBlockOn)
    i.sprite_index=sprite_index
    i.image_index=sprite_index==sprToggleBlockOff
    instance_destroy()
}
