#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time=0
count=0
__pc=0
__pco=pog
__pl=0

script=execute_string("return "+room_get_name(room)+"_avoidance")

bpm=100
bps=1000
oldbeat=1
beat=0
verse=0
sig=1
warn=0
framecount=0

script_execute(script)

length=sound_get_length(song)
inst=sound_loop(song)
bps=(60*8)/bpm

vsl=bps*round(frac(sig)*10)

i=instance_create(0,0,DepthBlender) i.depth=-999 i.mode=bm_add
i=instance_create(0,0,DepthBlender) i.depth=-1001 i.mode=bm_normal

if (global.avoidance_stretch) {
    effect=sound_kind_effect(1,se_pitchshift)
    sound_effect_options(effect,1,512)
}

time=0
pfps=global.game_speed
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
framecount+=1
if (framecount>=5) {
    framecount=0
    newtime=hrt_time_now()
    if (time) pfps=(pfps*2+5000000/(newtime-time))/3
    time=newtime
}

if (keyboard_check(vk_space)) pfps=40

//if 1% off of regular speed, pitch shift and warn
if (abs(1-pfps/room_speed)>0.01) {
    warn=1
    sound_pitch(inst,pfps/room_speed)
    if (global.avoidance_stretch) sound_effect_options(effect,0,room_speed/pfps)
} else {
    warn=0
    sound_pitch(inst,1)
    if (global.avoidance_stretch) sound_effect_options(effect,0,1)
}

__pl=0
__pco=__pc
__pc=sound_get_pos(inst)*length

oldbeat=beat
beat=round(__pc/bps*10000)/10000 mod 1

verse=1+round(__pc/vsl*10000)/10000

if (instance_exists(Player)) script_execute(script)
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.avoidance_stretch) {
    sound_effect_destroy(effect)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_font(fntFileSmall)
draw_line(x,y-20,x,y)
draw_line(x+200,y-20,x+200,y)
draw_line(x+100,y-10,x+100,y)
draw_line(x+50,y-5,x+50,y)
draw_line(x+150,y-5,x+150,y)
draw_healthbar(x,y,x+200,y+10,beat*100,0,$ff00,$ff00,0,0,0)
draw_text(x,y+20,"verse "+string(floor(verse))+", "+string(floor(frac(verse)*100))+"%")

draw_text(x,y+60,"speed: "+string(pfps)+" ("+string((pfps/room_speed)*100)+"%)"+pick(warn,""," lagging!"))
