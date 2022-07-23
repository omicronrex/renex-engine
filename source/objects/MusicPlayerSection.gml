#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions

BGM=""
loop=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.music!=BGM) if (inside_view()) {
    play_bg_music(BGM,loop)
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
you can put this in a section of the room and it'll play music when it's onscreen
*/

//field BGM: string
//field loop: bool
