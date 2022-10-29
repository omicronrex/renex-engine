#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
warpCoord[0]=noone
warpCoord[1]=noone
warpToPlayerstart=noone
warpid=""
warpsound=""
autosave=false
roomTo=room
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (warpToPlayerstart) {
    if (warpsound!="") sound_play(warpsound)
    move_player(warpToPlayerstart.x+17,warpToPlayerstart.y+23,0)
} else if (warpX==noone && warpY==noone && roomTo=room) {
    sound_play("sndBlockChange")
    instance_destroy()
} else {
    collect_items()
    if (roomTo!=room) {
        if (warpsound!="") {
            persistent=1
        }
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
//field warpToPlayerstart: instance - (pick a PlayerStart)
//field warpsound: string

if (persistent && warpsound!="") {
    //we are coming from a previous room, and we have to play a sound
    sound_play(warpsound)
    instance_destroy()
} else {
    warpX=warpCoord[0]
    warpY=warpCoord[1]
    if (warpToPlayerstart)
        if (warpToPlayerstart.object_index!=PlayerStart)
            warpToPlayerstart=noone
}
