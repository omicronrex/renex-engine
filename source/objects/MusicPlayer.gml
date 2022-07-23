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

play_bg_music(BGM,loop)
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
//field loop: bool

alarm[0]=1
