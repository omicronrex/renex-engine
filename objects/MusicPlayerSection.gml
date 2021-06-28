#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions
/*
    you can put this in a section of the room and it'll play music when it's onscreen
*/

BGM=""
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.music!=BGM) if (inside_view()) {
    if (BGM="") {
        sound_kind_stop(1)
    } else {
        if (!sound_isplaying(BGM) || global.restarting_music) {
            sound_loop(BGM)
            global.music=BGM
        }
    }
}
