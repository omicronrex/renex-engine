#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=0
f=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go) {
    f=min(1,f+0.02*dt)
    a=cosine(180,360,f)
    camera_angle(a)
    if (a>270) flip_player(1)

    if (f==1) {
        go=0
        f=0
        frozen=false
    }
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) if (!frozen) {
    if (vflip==-1 || camera_angle()==180) {
        speed=0
        djump=1
        sound_play_auto("sndBlockChange")
        if (camera_angle()!=0) {
            frozen=true
            other.go=1
        } else flip_player(1)
    }
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
