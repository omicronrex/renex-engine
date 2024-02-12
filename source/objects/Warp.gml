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
transparent=0
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (warpToPlayerstart) {
    if (warpsound!="") sound_play(warpsound)
    move_player(warpToPlayerstart.x+17,warpToPlayerstart.y+23,0)
    if (global.clear_inputs_on_warp) input_clear()
} else if (roomTo==room) {
    sound_play("sndBlockChange")
    instance_destroy()
} else {
    collect_items()
    if (warpsound!="") {
        persistent=1
    }
    if (warpCoord[0]==noone && warpCoord[1]==noone) {
        warp_to(roomTo)
    } else {
        warp_to(roomTo,warpCoord[0],warpCoord[1])
    }
    global.warp_id=warpid
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
//field transparent: bool

if (persistent && warpsound!="") {
    //we are coming from a previous room, and we have to play a sound
    sound_play(warpsound)
    instance_destroy()
} else {
    if (warpToPlayerstart)
        if (warpToPlayerstart.object_index!=PlayerStart)
            warpToPlayerstart=noone
}

if (transparent) sprite_index=sprWarpTransparent
