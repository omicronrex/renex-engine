#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
warpCoord[0]=x+16
warpCoord[1]=y+16

image_speed=0
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (warpCoord[0]!=noone && warpCoord[1]!=noone && !other.dead) {
    move_player(warpCoord[0],warpCoord[1],0)
    sound_play_slomo("sndTeleport")
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field warpCoord: xy

/*preview
    if (FieldDefined("warpCoord"))
        draw_sprite(Sprite("sprTeleporter",1),0,warpCoord[0]-16,warpCoord[1]-16)
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=500
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,1,warpCoord[0]-16,warpCoord[1]-16)
