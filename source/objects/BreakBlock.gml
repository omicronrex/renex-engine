#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=deletes a tile, breaking animation
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tile=tile_find_anywhere(x,y)
if (!tile) {
    show_error("BreakBlock at "+string(x)+","+string(y)+" doesn't have a tile to destroy",0)
    instance_destroy()
}
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (tile) {
    i=instance_create(x+16,y+16,DestroyedBlock)
    i.bg=tile_get_background(tile)
    i.l=tile_get_left(tile)
    i.t=tile_get_top(tile)
    i.hspeed=hspeed+random(hspeed)
    i.vspeed=vspeed+random(vspeed)
    tile_delete(tile)
}

with (instance_place(x,y,WallJumpR)) instance_destroy()
with (instance_place(x,y,WallJumpL)) instance_destroy()
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(global.break_sfx)
hspeed=other.hspeed/2
vspeed=other.vspeed/2
instance_destroy()
