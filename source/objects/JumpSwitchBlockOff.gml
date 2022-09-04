#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
singlejump=true
doublejump=true
switchto=JumpSwitchBlock

ready=0
alarm[0]=5
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ready=1
#define Trigger_On Player Jump
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (ready && singlejump) {
    instance_create(x,y,switchto)
    instance_destroy()
}
#define Trigger_On Player Djump
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (ready && doublejump) {
    instance_create(x,y,switchto)
    instance_destroy()
}
