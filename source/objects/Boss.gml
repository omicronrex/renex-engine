#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!variable_local_exists("boss_script")) {
    show_error("Error initializing engine boss child: "+object_get_name(object_index)+chr_crlf+chr_crlf+"variable boss_script not set to a script index.",0)
    instance_destroy()
    exit
}

if (!script_exists(boss_script)) {
    show_error("Error initializing engine boss child: "+object_get_name(object_index)+chr_crlf+chr_crlf+"variable boss_script set to a nonexisting script index.",0)
    instance_destroy()
    exit
}

if (savedata("boss"+object_get_name(object_index))) {
    cleanup=true
    instance_destroy()
} else {
    cleanup=false

    boss_time=0
    vulnerable=false

    script_execute(boss_script)

    maxhp=hp

    o=instance_create(x,y,BossIntroduction)
    o.owner=id
    o.str=name
    o.str2=subtitle
}
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (boss_script!=noone) {
    if (!cleanup) savedata("boss"+object_get_name(object_index),true)
    script_execute(boss_script)
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
boss_time+=1
script_execute(boss_script)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
script_execute(boss_script)
event_step()
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (boss_script!=noone) {
    cleanup=true
    instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
script_execute(boss_script)
