#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_kind_stop(1)

if (savedata("boss"+object_get_name(object_index))) {
    script=noone
    instance_destroy()
} else {
    script=execute_string("return "+object_get_name(object_index)+"_boss")
    hp=50
    t=0
    flash=0
    vulnerable=false
    hitcount=0

    state="begin"

    event="create"
    script_execute(script)

    hp=maxhp

    o=instance_create(x,y,BossIntroduction)
    o.owner=id
    o.str=name
    o.str2=sur
}
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (script!=noone) {
    savedata("boss"+object_get_name(object_index),true)
    sound_kind_stop(1)
    event="destroy"
    script_execute(script)
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (Player.dead) state="won"
event="step"
script_execute(script)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event="step"
script_execute(script)
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event="destroy"
script_execute(script)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event="draw"
script_execute(script)
