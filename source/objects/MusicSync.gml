#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
BGM=""
frames=0
length=0
lenframe=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(song[0])
sound_stop(song[1])
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!sound_isplaying(song[0]) || !sound_isplaying(song[1])) {
    instance_destroy()
    exit
}

frames+=1
musframes=sound_get_pos(song[cursong])*lenframe

if (abs(musframes-frames)>5) {
    cursong=!cursong
    sound_set_pos(song[cursong],frames/lenframe)
}

curvol=inch(curvol,cursong,0.2)

sound_volume(song[0],1-curvol)
sound_volume(song[1],curvol)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
    this will play when the room is entered, and will try to
    keep it synced to the game speed.
*/

//field BGM: string

sound_kind_stop(1)
global.music_instance=noone
global.music=""

if (BGM=="") {
    instance_destroy()
    exit
}

song[0]=sound_play_ex_layer("layer1_"+BGM,0)
song[1]=sound_play_ex_layer("layer2_"+BGM,0)

cursong=0
curvol=0

length=sound_get_length("layer1_"+BGM)

lenframe=length*50
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.test_run) {
    draw_text_outline(100,100,
        "frames: "+string(frames)+"#"+
        "frametime: "+string_format(frames/50,2,2)+"#"+
        "songtime:  "+string_format(sound_get_pos(song)*length,2,2)+"#"+
        "curvol: "+string_format(curvol,1,1)
    ,$ff00)
}
