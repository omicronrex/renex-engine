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
    if (roomTo!=room) {
        if (warpX==noone && warpY==noone) {
            warp_to(roomTo)
        } else {
            warp_to(roomTo,warpX,warpY)
        }
        global.warp_id=warpid
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field roomTo: room
//field warpCoord: xy
//field warpid: string

warpX=warpCoord[0]
warpY=warpCoord[1]
