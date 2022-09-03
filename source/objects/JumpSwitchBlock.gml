#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
singlejump=true
doublejump=true
switchto=JumpSwitchBlockOff

ready=0
alarm[0]=5
check_crush()
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ready=1
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (ready && singlejump) {
    instance_create(x,y,switchto)
    instance_destroy()
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (ready && doublejump) {
    instance_create(x,y,switchto)
    instance_destroy()
}
