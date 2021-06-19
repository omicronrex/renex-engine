#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
slomo=1
gravity=0.4*dt*dt
bleeding=1
alarm[0]=20

if (instance_exists(Player)) {
    hspeed=Player.hspeed/2
    vspeed=Player.vspeed/3
    gravity=Player.gravity*dt*dt
    slomo=Player.slomo
    if (Player.bow) {
        i=instance_create(x,y,GibParticle) i.sprite_index=sprBow
    }
}

if (settings("gore")) {
    i=instance_create(x,y-15,GibParticle) i.sprite_index=sprGibsHead
    i=instance_create(x,y-10,GibParticle) i.sprite_index=sprGibsBody
    i=instance_create(x,y-10,GibParticle) i.sprite_index=sprGibsArm
    i=instance_create(x,y-10,GibParticle) i.sprite_index=sprGibsArm
    i=instance_create(x,y,GibParticle) i.sprite_index=sprGibsFoot
    i=instance_create(x,y,GibParticle) i.sprite_index=sprGibsFoot
}

grav=sign(gravity)

with (GibParticle) {
    image_speed=0
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

stepcount=0
updating=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bleeding=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (bleeding) repeat (30) {
    i=instance_create(x,y,Blood)
    i.direction=irandom(35)*10
    i.speed=random(8)*dt
    i.gravity=(0.2+random(0.2))*grav*dt*dt
    if (irandom(1)) {
        i.hspeed+=hspeed
        i.vspeed+=vspeed
    }
}

if (!place_free(x,y)) {
    x-=hspeed
    y-=vspeed
    speed=0
    gravity=0
}

stepcount+=50/room_speed*slomo

if (stepcount>=1) {
    stepcount=stepcount mod 1
    updating=1
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (updating) with (Blood) event_user(0)
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
