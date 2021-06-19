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
    if (instance_exists(Player)) {
        if (hspeed!=0) {
            //pushed
            if (place_meeting(x+hspeed,y,Player)) {
                move_player(Player.x+hspeed,Player.y,0)
                check_crush()
            } else
            //riding
            if (place_meeting(x+hspeed,y-2*Player.vflip,Player.id)) {
                move_player(Player.x+hspeed,Player.y,1)
            }
        }
        if (vspeed!=0) {
            //pushed
            if (place_meeting(x,y+vspeed,Player)) {
                move_player(Player.x,Player.y+vspeed,0)
                check_crush()
            } else
            //riding
            if (place_meeting(x,y-2*Player.vflip,Player.id)) {
                move_player(Player.x,Player.y+vspeed,1)
            }
        }
    }
}
