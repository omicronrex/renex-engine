#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions

/*
    These warp objects are automatically assigned difficulties based on your engine settings.
    Simply place them in the room in the correct order.
*/

diff=-1
name=""
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (diff=-1) {
    savedata_select(settings("lastfile"))
    savedata_load()
} else {
    difficulty=diff
    savedata_newgame(settings("lastfile"),difficulty)
    warp_to(global.first_room)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()

draw_set_halign(1)
draw_text_outline(x+16,y-32,name,$ffff)
draw_set_halign(0)
