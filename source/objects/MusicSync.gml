#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
BGM=""
loop=1

realtime=current_time
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if 1% off of regular speed, pitch shift and warn
if (fps_fast) {
    if (abs(1-fps_fast/global.game_speed)>0.01) {
        sound_pitch(song,fps_fast/global.game_speed)
        sound_effect_options(effect,0,global.game_speed/fps_fast)
    } else {
        sound_pitch(song,1)
        sound_effect_options(effect,0,1)
    }
}

if (current_time>realtime+100) {
    //did we just have a massive lag spike? let's rewind our track
    sound_set_pos(song,(sound_get_pos(song)*length-(current_time-realtime)/1000)/length)
}
realtime=current_time
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
    this will play when the room is entered, and will try to keep it synced to the game speed
    so if the game slows down, it will also slow down the music
*/

//field BGM: string
//field loop: bool

song=play_bg_music(BGM,loop)

if (BGM="") {
    instance_destroy()
    exit
}

length=sound_get_length(BGM)

effect=sound_kind_effect(1,se_pitchshift)
sound_effect_options(effect,1,512)
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_effect_destroy(effect)
