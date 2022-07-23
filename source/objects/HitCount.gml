#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions

/*
    when placed in a room, player will count hits instead of dying when damaged.
    this object will store the number of hits in the "hits" variable.

    please note that HitCount and HPMode do not work together.
*/

hits=0             //number of hits the player has endured
iframes=room_speed //time granted invincible after a hit (1 second by default)
sound="sndBossHit" //sound to play when player is damaged
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=no draw
*/
#define Trigger_Draw GUI
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_font(fntSignpost)
draw_text(40,40,lang("hitcount")+string(hits))
