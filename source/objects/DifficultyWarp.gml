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
    savedata_newgame(settings("lastfile"),diff)
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field diff: number - use -1 for the "load game" warp

if (diff<global.num_difficulties) {
    if (diff=-1) name=lang("filecontinue")
    else name=global.name_difficulties[diff]
} else instance_destroy()
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
