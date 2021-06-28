#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions
/*
    this will play when the room is entered
*/

BGM=""
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (BGM="") {
    sound_kind_stop(1)
} else {
    if (!sound_isplaying(BGM) || global.restarting_music) {
        sound_loop(BGM)
        global.music=BGM
    }
}
