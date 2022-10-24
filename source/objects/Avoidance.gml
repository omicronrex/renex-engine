#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_bg_music("",0)

script_execute(script,"create")

increment=(beat*bpm)/(global.game_speed*60)

store=0
timer=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
store+=increment
inc=round(store)
store-=inc

oldtimer=timer
timer+=inc

current_timer=0
script_execute(script,"step")
