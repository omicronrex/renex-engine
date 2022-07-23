#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

snap=false
phase=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hspeed!=0 || vspeed!=0) {
    if (!phase) {
        if (hspeed!=0) if (!place_free(x+hspeed,y)) hspeed=-hspeed
        if (vspeed!=0) if (!place_free(x,y+vspeed)) vspeed=-vspeed
    }
    if (hspeed!=0) {
        //pushed
        if (instance_place(x+hspeed,y,Player)) {
            move_player(Player.x+hspeed,Player.y,0)
            check_crush()
        } else
        //riding
        if (instance_place(x+hspeed,y-2*Player.vflip,Player.id)) {
            move_player(Player.x+hspeed,Player.y,1)
        }
    }
    if (vspeed!=0) {
        //pushed
        if (instance_place(x,y+vspeed,Player)) {
            move_player(Player.x,Player.y+vspeed,0)
            check_crush()
        } else
        //riding
        if (instance_place(x,y-2*Player.vflip,Player.id)) {
            move_player(Player.x,Player.y+vspeed,1)
            check_crush()
        }
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field path: path
//field speed
//field path_action: enum(path_action_continue,path_action_restart,path_action_reverse,path_action_stop)
//field path_absolute: bool
//field snap: bool
//field hspeed
//field vspeed

event_inherited()
