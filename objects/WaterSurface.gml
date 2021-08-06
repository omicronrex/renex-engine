#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=use only one per water body
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
do {x+=32} until (!place_meeting(x,y,Water1) && !place_meeting(x,y,Water2)) w=x-xstart x=xstart
do {y+=32} until (!place_meeting(x,y,Water1) && !place_meeting(x,y,Water2)) h=y-ystart y=ystart

image_xscale=w/32
image_yscale=h/32

with (Water1) if (place_meeting(x,y,other.id)) visible=0
with (Water2) if (place_meeting(x,y,other.id)) visible=0

image_yscale=0.25

for (i=0;i<=w+1;i+=1) {s[i]=0 m[i]=0}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var sum,i;

if (inside_view()) {
    with (PushBlock) if (place_meeting(x,y,other.id)) with (other) event_user(0)
    with (PushBlockSave) if (place_meeting(x,y,other.id)) with (other) event_user(0)

    sum=0
    for (i=0;i<=w;i+=1) {
        s[i]=clamp(s[i]+m[i],-16,16)
        m[i]=clamp(m[i]*0.98+s[i]*-0.1,-2,2)
        sum+=s[i]
    }
    sum/=w

    for (i=1;i<w;i+=1) {
        s[i]=(s[i-1]+s[i]*2+s[i+1])/4
        m[i]-=(s[i]*2-s[i-1]-s[i+1])
        s[i]-=sum
    }
    visible=1
} else {
    visible=0
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Collision_PlayerKiller
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Collision_GibParticle
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Collision_LiftBlock
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Collision_Platform
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Collision_PatBall
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Collision_RenBoll
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i=max(0,other.bbox_left-x);i<=min(w,other.bbox_right-x);i+=1) {
    m[i]+=(other.y-other.yprevious)-abs(other.x-other.xprevious)/2
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(0.5)
draw_set_color($ff8000)
draw_primitive_begin(pr_trianglestrip)
for (i=0;i<=w;i+=2) {
    draw_vertex(x+i,y+(s[i]+s[i+1])/2)
    draw_vertex(x+i,y+h)
}
draw_primitive_end()
draw_set_alpha(1)
draw_set_color($ffffff)
