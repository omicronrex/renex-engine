#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
blood=settings("blood")
if (!blood) {
    bleeding=0
    alarm[1]=room_speed/2
    if (instance_exists(Player)) {
        sprite_index=Player.sprite_index
        image_index=Player.image_index
        image_xscale=Player.image_xscale
        image_yscale=Player.vflip
        image_angle=Player.drawangle
        image_blend=Player.image_blend
        image_alpha=Player.image_alpha
        if (Player.bow) {
            i=instance_create(x,y,GibParticle) i.sprite_index=sprBow i.gravity=(0.1+random(0.2))*sign(Player.gravity)
        }
    } else {
        sprite_index=sprPlayerIdle
        image_index=floor(image_index)
    }
    exit
}

gravity=0.4*dt*dt
bleeding=1
alarm[0]=10*blood

if (instance_exists(Player)) {
    hspeed=Player.hspeed/2
    vspeed=Player.vspeed/3
    gravity=Player.baseGrav*Player.vflip*dt*dt
    if (Player.bow) {
        i=instance_create(x,y,GibParticle) i.sprite_index=sprBow i.image_xscale=Player.facing
    }
}

if (blood==3) {
    i=instance_create(x,y-15,GibParticle) i.sprite_index=sprGibsHead
    i=instance_create(x,y-10,GibParticle) i.sprite_index=sprGibsBody
    i=instance_create(x,y-10,GibParticle) i.sprite_index=sprGibsArm
    i=instance_create(x,y-10,GibParticle) i.sprite_index=sprGibsArm
    i=instance_create(x,y,GibParticle) i.sprite_index=sprGibsFoot
    i=instance_create(x,y,GibParticle) i.sprite_index=sprGibsFoot
}

grav=sign(gravity)

with (GibParticle) {
    if (sprite_index!=sprBow) {
        image_index=irandom(image_number-1)
    }
    gravity=(0.1+random(0.2))*other.grav
    direction=irandom(35)*10
    speed=random(2*dt)
    if (instance_exists(Player)) {
        hspeed+=Player.hspeed*dt
        vspeed+=Player.vspeed*dt/2-1
    }
}

gravity*=0.5
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bleeding=0
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (bleeding) {
    emit_blood(10*blood)
}

if (!place_free(x,y)) {
    x-=hspeed
    y-=vspeed
    speed=0
    gravity=0
}

if (alarm[1]) visible=(alarm[1] mod 5)<3
#define Collision_PlayerKiller
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.solid) {
    speed=0
    gravity=0
}
