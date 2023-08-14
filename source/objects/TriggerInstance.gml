#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mylock=noone
mytrig=noone
inst=noone

user_event=noone
trap_is_triggered=noone
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (user_event!=noone)
    with (inst) event_user(other.user_event)
else
    with (inst) event_trigger(ev_traptriggered)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field inst: instance
//field user_event: enum(trap_is_triggered,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)

/*desc
    This trigger object will activate a specific instance instead of TNT.
    You can choose between triggering user events, or by default the Trap
    is Triggered event is called.
*/
