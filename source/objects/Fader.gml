#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//general purpose screen fade object
//you can change the unfade rate by changing unfaderate to anything above 0
alp=0
faderate=0.15
unfaderate=0
color=c_black
unfading=0

//this variable is used to control things for the fade warp
fadewarp=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alp+=faderate
if (fadewarp) {frozen=1 lock_controls()}
if (alp>=1) {
    if (!unfading) {
        alp=1
        if (unfaderate==0) faderate=-faderate
        else faderate=-unfaderate
        if (fadewarp) {
            with (owner) event_perform_object(Warp,ev_collision,Player)
        }
        unfading=1
    }
}
if (alp<=0) {
    if (fadewarp) {frozen=0 unlock_controls()}
    instance_destroy()
}
draw_set_alpha(alp)
draw_rectangle_color(-1,-1,room_width+1,room_height+1,color,color,color,color,0)
draw_reset()
