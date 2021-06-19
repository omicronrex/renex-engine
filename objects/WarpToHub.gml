#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
msg="UP to return"

font=fntSignpost
color=$ffffff

active=0

if (!room_exists(global.hub_room)) instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=median(0.5,1,1-distance_to_object(Player)/100)
active=0
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=1

if (global.key_pressed[key_up]) {
    instance_destroy_id(Player)
    room_goto(global.hub_room)
}
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
if (active) draw_sign_text(x+16,y-10,font,color,msg,true)
