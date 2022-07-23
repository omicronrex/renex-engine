#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var l,t,r,b,group;

if (instance_place(x,y,TriggerLock)) exit

group=instance_place(x,y,TriggerGroup)

if (group) {
    l=group.bbox_left
    r=group.bbox_right
    t=group.bbox_top
    b=group.bbox_bottom
} else {
    //by default, triggers only work within the same screen.
    l=World.camera_l
    r=World.camera_r
    t=World.camera_t
    b=World.camera_b
}

//destroy same color triggerlocks
with (mylock)
    if (group==instance_place(x,y,TriggerGroup))
        if (x>=l && x<r && y>=t && y<b)
            instance_destroy()

//fire same color triggers
with (mytrig)
    if (group==instance_place(x,y,TriggerGroup))
        if (x>=l && x<r && y>=t && y<b)
            if (!instance_place(x,y,TriggerLock))
                instance_destroy()

//don't destroy button triggers!
if (!object_is_child_of(Button))
    with (object_index) if (group==instance_place(x,y,TriggerGroup))
        if (x>=l && x<r && y>=t && y<b)
            if (!instance_place(x,y,TriggerLock)) instance_destroy()
