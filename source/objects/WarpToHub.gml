#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions

//this warp can be used to return to the hub room configured in the engine settings
//if a hub room isn't configured, it'll disappear

msg=lang("warptohub")

font=fntSignpost
color=$ffffff

active=0

if (!room_exists(global.hub_room)) instance_destroy()

event_step()
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
    warp_to(global.hub_room)
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field msg
//field font: font
//field color: color
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=500
invert=0
*/
#define Trigger_Draw End
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) draw_sign_text(x+16,y-10,font,color,msg,true)
