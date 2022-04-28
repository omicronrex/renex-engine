#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
warpCoord[0]=noone
warpCoord[1]=noone
roomTo=room
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (warpX==noone && warpY==noone && roomTo=room) {
    sound_play("sndBlockChange")
    instance_destroy()
} else {
    collect_items()
    if (warpX==noone && warpY==noone) {
        instance_destroy_id(Player)
    } else {
        move_player(warpX,warpY,0)
    }
    if (roomTo!=room) {input_clear() room_goto(roomTo)}
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field roomTo: room
//field warpCoord: xy

warpX=warpCoord[0]
warpY=warpCoord[1]
