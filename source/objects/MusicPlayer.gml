#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
BGM=""
loop=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (MusicPlayerSection) if (inside_view()) {
    exit
}

sound_play_music(BGM,loop)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
    this will play when the room is entered
*/

//field BGM: string
//field loop: true

alarm[0]=1
