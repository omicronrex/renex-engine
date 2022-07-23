#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions

/*
    when placed in a room, player will only die once HP is depleted.
    this object will store the hp, and also handle drawing the healthbar.

    please note that HitCount and HPMode do not work together.
*/

hp=100             //number of hits the player can take
iframes=0          //time granted invincible after a hit (none by default)
sound="sndDeath"   //sound to play when player is damaged
mode=2             //mode 1 has the bar at the top, mode 2 puts it on the player
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
maxhp=hp

if (instance_exists(HitCount)) show_error("Room contains both an HPMode and HitCount tools. Player will not take damage correctly.",0)
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
if (mode==1) draw_healthbar(8,8,global.GUIwidth-8,24,(hp/maxhp)*100,0,$ff00,$ff00,0,1,1)
if (mode==2) with (Player) draw_healthbar(drawx-24,drawy-24,drawx+24,drawy-20,(other.hp/other.maxhp)*100,0,$ff00,$ff00,0,1,1)
