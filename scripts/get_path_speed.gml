///get_path_speed()
//updates instance's speed and direction based on where it'll be next frame
var nextpos;

if (path_index!=-1) {
    nextpos=path_position+path_speed*(path_get_speed(path_index,path_position)/100)/(path_get_length(path_index)*path_scale)
    if (nextpos>1) {
        if (path_endaction=path_action_restart) nextpos-=1
        if (path_endaction=path_action_reverse) nextpos=2-nextpos
        if (path_endaction=path_action_stop) nextpos=1
    }
    if (nextpos<0) {
        if (path_endaction=path_action_restart) nextpos+=1
        if (path_endaction=path_action_reverse) nextpos=-nextpos
        if (path_endaction=path_action_stop) nextpos=0
    }
    hspeed=path_get_x(path_index,nextpos)-x
    vspeed=path_get_y(path_index,nextpos)-y
}
