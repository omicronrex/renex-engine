#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!sound_isplaying(sound)) {
    instance_destroy()
    exit
}

if (instance_exists(owner)) {
    x=owner.x
    y=owner.y
    hspeed=owner.hspeed
    vspeed=owner.vspeed
}

sound_pan(sound,median(-1,(x-(view_xview+view_wview/2))/(view_wview/2),1))
sound_volume(sound,min(1,1+((view_wview*2/3)-point_distance(x,y,view_xview+view_wview/2,view_yview+view_hview/2))/(view_wview*2/3)))
