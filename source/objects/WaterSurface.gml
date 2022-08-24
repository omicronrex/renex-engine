#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var sum,i;

if (inside_view()) {
    with (PushBlock) if (instance_place(x,y,other.id)) with (other) event_user(0)
    with (PushBlockSave) if (instance_place(x,y,other.id)) with (other) event_user(0)

    if (!sleeping) {
        sum=0
        sleeping=1
        for (i=0;i<=w;i+=1) {
            s[i]=clamp(s[i]+m[i],-16,16)
            m[i]=clamp(m[i]*0.98+s[i]*-0.1,-2,2)
            sum+=s[i]
            if (abs(s[i])>0.25 || abs(m[i]>0.25)) sleeping=0
        }
        if (sleeping) {
            for (i=0;i<=w;i+=1) s[i]=0
        } else {
            sum/=w
            for (i=1;i<w;i+=1) {
                s[i]=(s[i-1]+s[i]*2+s[i+1])/4
                m[i]-=(s[i]*2-s[i-1]-s[i+1])
                s[i]-=sum
            }
        }
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
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var ow,ww,dy,i;

if (abs(other.x-other.xprevious)>0 || abs(other.y-other.yprevious)>0) {
    ow=(other.bbox_right+1)-other.bbox_left
    ww=min(w,other.bbox_right-x)
    dy=(other.y-other.yprevious)
    for (i=max(0,other.bbox_left-x);i<=ww;i+=1) {
        m[i]+=(dy-abs(other.x-other.xprevious))*((ow-abs((i+x)-other.x))/ow)*0.5
    }
    sleeping=0
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sleeping) {
    draw_sprite_stretched(sprite,0,x,y,w,h)
    if (global.debug_hitbox) {
        draw_line(x,y,x+w,y+h)
        draw_line(x,y+h,x+w,y)
    }
} else {
    draw_primitive_begin_texture(pr_trianglestrip,tex)
    draw_vertex(x-0.5,y+s[0]-0.5)
    draw_vertex(x-0.5,y+h-0.5)
    for (i=8;i<=w;i+=8) {
        draw_vertex(x+i-0.5,y+s[i-4]-0.5)
        draw_vertex(x+i-0.5,y+h-0.5)
    }
    draw_primitive_end()
}
#define Trigger_Constructor
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///constructor: find (id)
sprite=sprWater1

//with (Water1) if (instance_place(x,y,other.id)) find=id
//with (Water2) if (instance_place(x,y,other.id)) find=id
//with (NekoronWater) if (instance_place(x,y,other.id)) find=id

sprite=find.sprite_index
find.visible=0

image_xscale=find.image_xscale
image_yscale=0.25

w=image_xscale*32
h=find.image_yscale*32

tex=sprite_get_texture(sprite,0)

for (i=0;i<=w+1;i+=1) {s[i]=0 m[i]=0}
sleeping=1
