#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
lx=1 ly=0 lz=0
tx=0 ty=0 tz=-1

xd=x yd=y
xp=xd yp=yd
xdb=x ydb=y
rotsp=0
rot=0
bul=noone

dampmul=0.7
dampsub=0.1
dampfrc=0.01
radius=16

colrad=16+radius

mask_index=spr2x2
image_xscale=radius+2
image_yscale=radius+2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (abs(rotsp)<0.05) rotsp=0

vspeed+=0.2
rotsp=max(0,abs(rotsp*0.99-0.02))*sign(rotsp)
rot+=rotsp
speed=min(speed,radius-0.5)

event_user(1)

if (speed<0.05) speed=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xp=xd yp=yd
xd=(xd+x)/2
yd=(yd+y)/2
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var mydir, mytowmodule, histowmodule, midx, midy, dist,med;

dist=point_distance(x,y,other.x,other.y)

if (dist<=radius+5) {
    mydir=point_direction(x,y,other.x,other.y)
    hisdir=mydir+180

    dist*=0.5

    midx=x+lengthdir_x(dist,mydir)
    midy=y+lengthdir_y(dist,mydir)

    x=midx+lengthdir_x(radius+5,hisdir)
    y=midy+lengthdir_y(radius+5,hisdir)

    mytowmodule=cos(degtorad(direction-mydir))*speed
    histowmodule=cos(degtorad(other.direction-hisdir))*other.speed+2

    hspeed+=lengthdir_x((histowmodule+mytowmodule)*dampmul,hisdir)
    vspeed+=lengthdir_y((histowmodule+mytowmodule)*dampmul,hisdir)

    med=rotsp
    rotsp=(rotsp*4+med)/5

    event_user(1)
}
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (bul!=other.id) motion_add(point_direction(other.x,other.y,x,y),8)
bul=other.id
#define Collision_Water1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y>other.bbox_top) {
    vspeed-=0.3
    speed*=0.98
    rotsp*=0.98
}
#define Collision_Water2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y>other.bbox_top) {
    vspeed-=0.3
    speed*=0.98
    rotsp*=0.98
}
#define Collision_Platform
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var mydir, mytowmodule, histowmodule, midx, midy, dist,med;

dist=point_distance(x,y,other.x,other.y)

if (dist<=radius+8) {
    mydir=point_direction(x,y,other.x,other.y)
    hisdir=mydir+180

    dist*=0.5

    midx=x+lengthdir_x(dist,mydir)
    midy=y+lengthdir_y(dist,mydir)

    x=midx+lengthdir_x(radius+8,hisdir)
    y=midy+lengthdir_y(radius+8,hisdir)

    mytowmodule=cos(degtorad(direction-mydir))*speed
    histowmodule=cos(degtorad(other.direction-hisdir))*point_distance(other.x,other.y,other.xprevious,other.yprevious)

    hspeed+=lengthdir_x((histowmodule+mytowmodule)*dampmul,hisdir)
    vspeed+=lengthdir_y((histowmodule+mytowmodule)*dampmul,hisdir)

    med=rotsp
    rotsp=(rotsp*4+med)/5

    event_user(1)
}
#define Collision_PatBall
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var mydir, mytowmodule, histowmodule, midx, midy, dist,med;

dist=point_distance(x,y,other.x,other.y)

if (dist<=radius+16) {
    mydir=point_direction(x,y,other.x,other.y)
    hisdir=mydir+180

    dist*=0.5

    midx=x+lengthdir_x(dist,mydir)
    midy=y+lengthdir_y(dist,mydir)

    x=midx+lengthdir_x(radius,hisdir)
    y=midy+lengthdir_y(radius,hisdir)
    other.x=midx+lengthdir_x(radius,mydir)
    other.y=midy+lengthdir_y(radius,mydir)

    mytowmodule=cos(degtorad(direction-mydir))*speed
    histowmodule=cos(degtorad(other.direction-hisdir))*other.speed

    hspeed+=lengthdir_x((histowmodule+mytowmodule)*dampmul,hisdir)
    vspeed+=lengthdir_y((histowmodule+mytowmodule)*dampmul,hisdir)

    other.hspeed+=lengthdir_x((mytowmodule+histowmodule)*dampmul,mydir)
    other.vspeed+=lengthdir_y((mytowmodule+histowmodule)*dampmul,mydir)

    med=rotsp
    rotsp=(rotsp*4+med)/5

    event_user(1)
}
#define Collision_RenBoll
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var mydir, mytowmodule, histowmodule, midx, midy, dist,med;

if (id>other.id) exit

dist=point_distance(x,y,other.x,other.y)

if (dist<=radius+other.radius) {
    mydir=point_direction(x,y,other.x,other.y)
    hisdir=mydir+180

    dist*=0.5

    midx=x+lengthdir_x(dist,mydir)
    midy=y+lengthdir_y(dist,mydir)

    x=midx+lengthdir_x(radius,hisdir)
    y=midy+lengthdir_y(radius,hisdir)
    other.x=midx+lengthdir_x(radius,mydir)
    other.y=midy+lengthdir_y(radius,mydir)

    mytowmodule=cos(degtorad(direction-mydir))*speed
    histowmodule=cos(degtorad(other.direction-hisdir))*other.speed

    hspeed+=lengthdir_x((histowmodule+mytowmodule)*dampmul,hisdir)
    vspeed+=lengthdir_y((histowmodule+mytowmodule)*dampmul,hisdir)

    other.hspeed+=lengthdir_x((mytowmodule+histowmodule)*dampmul,mydir)
    other.vspeed+=lengthdir_y((mytowmodule+histowmodule)*dampmul,mydir)

    med=rotsp-other.rotsp
    rotsp=(rotsp*4+med)/5
    other.rotsp=(other.rotsp*4+med)/5

    event_user(1)
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///collision
var d;

if (point_distance(xc,yc,x,y)<=radius+0.4) {
    d=point_direction(xc,yc,x,y)

    //check if the ball is actually moving towards the surface normal
    if (abs(((((direction - d+180) mod 360) + 540) mod 360) - 180)<90) {
        //expulse
        x=xc+lengthdir_x(radius,d)
        y=yc+lengthdir_y(radius,d)

        //reflect
        xc=max(0,lengthdir_x(speed,180-direction+d)*dampmul-dampsub)
        yc=lengthdir_y(speed,180-direction+d)
        yc=max(0,abs(yc)-dampfrc)*sign(yc)
        speed=point_distance(0,0,xc,yc)
        direction=point_direction(0,0,xc,yc)+d

        rotsp=mean(rotsp,radtodeg(-yc/radius))
    }
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var cx,cy;

with (Block) if (solid) if (place_meeting(x,y,other.id)) {
    memcoll=1
    cx=(bbox_right+1+bbox_left)/2
    cy=(bbox_bottom+1+bbox_top)/2

    if (object_index==SlopeTL) {with (other) {
        if (y>(cy-(x-cx)) && x>cx-16 && y>cy-16) {//diagonal side
            xc=cx-(y-cy-(x-cx))/2 yc=cy-(xc-cx)
            if (xc=median(cx-16,xc,cx+16)) event_user(0)
        } else if (abs(y-cy)<=16) {//x wall
            if (x=median(cx-colrad,x,cx-16)) {xc=cx-16 yc=y event_user(0)}
        } else if (abs(x-cx)<=16) {//y wall
            if (y=median(cy-colrad,y,cy-16)) {xc=x yc=cy-16 event_user(0)}
        }
    }} else if (object_index==SlopeTR) {with (other) {
        if (y>=(cy+(x-cx)) && x<=cx+16 && y>=cy-16) {//diagonal side
            xc=cx+(y-cy+(x-cx))/2 yc=cy+(xc-cx)
            if (xc=median(cx-16,xc,cx+16)) event_user(0)
        } else if (abs(y-cy)<=16) {//x wall
            if (x=median(cx+16,x,cx+colrad)) {xc=cx+16 yc=y event_user(0)}
        } else if (abs(x-cx)<=16) {//y wall
            if (y=median(cy-colrad,y,cy-16)) {xc=x yc=cy-16 event_user(0)}
        }
    }} else if (object_index==SlopeBR) {with (other) {
       if (y<=(cy-(x-cx)) && x<=cx+16 && y<=cy+16) {//diagonal side
            xc=cx-(y-cy-(x-cx))/2 yc=cy-(xc-cx)
            if (xc=median(cx-16,xc,cx+16)) event_user(0)
        } else if (abs(y-cy)<=16) {//x wall
            if (x=median(cx+16,x,cx+colrad)) {xc=cx+16 yc=y event_user(0)}
        } else if (abs(x-cx)<=16) {//y wall
            if (y=median(cy+16,y,cy+colrad)) {xc=x yc=cy+16 event_user(0)}
        }
    }} else if (object_index==SlopeBL) {with (other) {
        if (y<=(cy+(x-cx)) && x>=cx-16 && y<=cy+16) {//diagonal side
            xc=cx+(y-cy+(x-cx))/2 yc=cy+(xc-cx)
            if (xc=median(cx-16,xc,cx+16)) event_user(0)
        } else if (abs(y-cy)<=16) {//x wall
            if (x=median(cx-colrad,x,cx-16)) {xc=cx-16 yc=y event_user(0)}
        } else if (abs(x-cx)<=16) {//y wall
            if (y=median(cy+16,y,cy+colrad)) {xc=x yc=cy+16 event_user(0)}
        }
    }} else with (other) {
        if (y>=other.bbox_top && y<=other.bbox_bottom+1) {//x wall
            xc=median(other.bbox_left,x,other.bbox_right+1) yc=y event_user(0)
        } else if (x>=other.bbox_left && x<=other.bbox_right+1) {//y wall
            xc=x yc=median(other.bbox_top,y,other.bbox_bottom+1) event_user(0)
        }
    }
} else memcoll=0

with (Block) if (solid) if (memcoll) {
    memcoll=0
    cx=(bbox_right+1+bbox_left)/2
    cy=(bbox_bottom+1+bbox_top)/2

    //corners
    if (object_index==SlopeTL) {with (other) {
        if (y>(cy-(x-cx)) && x>cx-16 && y>cy-16) {//diagonal side
            xc=median(cx-16,cx-(y-cy-(x-cx))/2,cx+16) yc=cy-(xc-cx) event_user(0)
        } else if (abs(y-cy)>16 && abs(x-cx)>16 && !(x>cx && y>cy)) {//corner hit
            if (x<cx) xc=cx-16 else xc=cx+16
            if (y<cy) yc=cy-16 else yc=cy+16
            event_user(0)
        }
    }} else if (object_index==SlopeTR) {with (other) {
        if (y>=(cy+(x-cx)) && x<=cx+16 && y>=cy-16) {//diagonal side
            xc=median(cx-16,cx+(y-cy+(x-cx))/2,cx+16) yc=cy+(xc-cx) event_user(0)
        } else if (abs(y-cy)>16 && abs(x-cx)>16 && !(x<cx && y>cy)) {//corner hit
            if (x<cx) xc=cx-16 else xc=cx+16
            if (y<cy) yc=cy-16 else yc=cy+16
            event_user(0)
        }
    }} else if (object_index==SlopeBR) {with (other) {
        if (y<=(cy-(x-cx)) && x<=cx+16 && y<=cy+16) {//diagonal side
            xc=median(cx-16,cx-(y-cy-(x-cx))/2,cx+16) yc=cy-(xc-cx) event_user(0)
        } else if (abs(y-cy)>16 && abs(x-cx)>16 && !(x<cx && y<cy)) {//corner hit
            if (x<cx) xc=cx-16 else xc=cx+16
            if (y<cy) yc=cy-16 else yc=cy+16
            event_user(0)
        }
    }} else if (object_index==SlopeBL) {with (other) {
        if (y<=(cy+(x-cx)) && x>=cx-16 && y<=cy+16) {//diagonal side
            xc=median(cx-16,cx+(y-cy+(x-cx))/2,cx+16) yc=cy+(xc-cx) event_user(0)
        } else if (abs(y-cy)>16 && abs(x-cx)>16 && !(x>cx && y<cy)) {//corner hit
            if (x<cx) xc=cx-16 else xc=cx+16
            if (y<cy) yc=cy-16 else yc=cy+16
            event_user(0)
        }
    }} else with (other) {
        if ((x<other.bbox_left || x>other.bbox_right+1) && (y<other.bbox_top || y>other.bbox_bottom+1)) {//corner hit
            xc=median(other.bbox_left,x,other.bbox_right+1)
            yc=median(other.bbox_top,y,other.bbox_bottom+1)
            event_user(0)
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,0,xd-0.5*dcos(rot)-0.5*dcos(rot-90),yd-0.5*dsin(rot)-0.5*dsin(rot-90),1,1,rot,$ffffff,1)
