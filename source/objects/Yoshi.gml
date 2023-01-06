#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vflip=sign(image_yscale)

vspeed=-1.5*vflip
gravity=0.3*vflip

dead=0
lost=0
angle=0

onPlatform=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (lost) {
    //spent yoshi
    sprite_index=sprYoshiLost
    image_speed=1/25
    hspeed=0
} else if (dead) {
    //dead yoshi
    sprite_index=sprYoshiDead
    hspeed=0

    if (bleeding) {
        bleeding-=1
        y-=40
        x+=10*image_xscale
        emit_prop_blood(10*settings("blood"))
        y+=40
        x-=10*image_xscale
    }

    if (!place_free(x,y+vspeed)) {
        move_contact_solid(point_direction(0,0,0,gravity),abs(vspeed))
        gravity=0
        vspeed=0
    } else {
        gravity=0.4*vflip
    }

    angle=max(-20,angle-0.5)
} else if (active) {
    //yoshi is being ridden

    hspeed=global.input_h*4
    vspeed=min(vspeed,11)

    image_xscale=esign(global.input_h,image_xscale)

    image_speed=1/25
    if (abs(vspeed)>abs(gravity)) {
        sprite_index=sprYoshiJump
        image_index=vspeed*vflip>0
    } else if (hspeed!=0) {
        sprite_index=sprYoshiRunning
        image_speed=0.5
    } else sprite_index=sprYoshiStand

    if (global.key_pressed[key_jump]) {
        if (instance_place(x,y+1,Block)) vspeed=-11*vflip
    }
    if (global.key_released[key_jump]) {
        if (vspeed*vflip<0) vspeed*=0.45
    }

    if (global.key_pressed[key_shoot]) {
        //kill yoshi
        sound_play("sndShoot")
        sound_play("sndDeath")

        vehicle_dismount()
        passenger.y-=20*vflip
        passenger.vspeed=vspeed
        vspeed=0

        dead=1
        bleeding=10*settings("blood")
    }

    var land,store_y,was_on_slope,is_going_into_slope,grav_step;

    land=0
    was_on_slope=0
    is_going_into_slope=0
    grav_step=gravity
    if (gravity==0) grav_step=0.5

    if (esign(vspeed+gravity,vflip)==vflip) {
        was_on_slope=instance_place(x,y+2*vflip,SlopeParent)
        //optimization: short circuit
        if (!was_on_slope) is_going_into_slope=instance_place(x+hspeed,y+2*vflip,SlopeParent)
        if (was_on_slope || is_going_into_slope) {
            x+=hspeed
            if (place_free(x,y)) {
                if (was_on_slope) if (instance_place(x,y+8*vflip,Block)) {
                    //land on slope or blocks moving down
                    move_contact_solid(180+90*vflip,8*vflip)
                    //optimization: only check collision once it crosses pixel boundary
                    while (place_free(x,y+grav_step)) {store_y=round(y) do y+=grav_step until round(y)!=store_y} y-=grav_step
                    land=1
                }
            } else {
                //move up out of ground when walking up slope
                store_y=y
                move_outside_solid(180-90*vflip,6)
                if (!place_free(x,y)) {
                    //couldn't move out, so it's probably a wall
                    //move back down
                    y=store_y
                } else {
                    //land on slope or blocks moving up
                    y-=grav_step
                    land=1
                }
            }
            x-=hspeed
        }
    }

    if (land) {
        vspeed=0
    }

    vspeed+=gravity

    if (!place_free(x+hspeed,y+vspeed)) {
        if (!place_free(x+hspeed,y)) {
            a=ceil(abs(hspeed))
            s=sign(hspeed)
            repeat (a) {
                x+=s
                if (!place_free(x,y)) {x-=s hspeed=0 break}
            }
            x-=hspeed
        }

        if (!place_free(x,y+vspeed)) {
            a=ceil(abs(vspeed))
            s=sign(vspeed)

            vspeed=0

            repeat (a) {
                y+=s
                if (!place_free(x,y)) {
                    y-=s
                    break
                }
            }
        }
        if (!place_free(x+hspeed,y+vspeed)) {
            if (onPlatform) vspeed=0
            else hspeed=0
        }
    }

    vspeed-=gravity
} else {
    sprite_index=sprYoshiWait
    image_speed=1/25
    //idle yoshi routine
    if (instance_place(x,y+vspeed,Block)) {
        move_contact_solid(point_direction(0,0,0,gravity),abs(vspeed))
        vspeed=-1.5*vflip
    }

    image_xscale=esign(Player.x-x,image_xscale)
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///yoshi mount condition

if (!other.dotkid && other.vflip==vflip && other.vspeed*other.vflip>0 && !dead && !lost) {
    vehicle_mount()
}
#define Collision_PlayerKiller
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    if (other.object_index=SmwSaw) {
        if (y<=other.y-2) {
            sound_play("sndYoshiJump")
            if (global.key[key_jump])
                vspeed=-15
            else
                vspeed=-5
            exit
        }
    }

    sound_play("sndYoshi2")

    passenger.vspeed=vspeed

    lost=1
    vspeed=-8*vflip
    gravity=0.2*vflip

    vehicle_dismount()

    passenger.y -= 20
    passenger.iframes = 25
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,floor(image_index),x,y,image_xscale,image_yscale,angle,image_blend,image_alpha)
#define Trigger_Vehicle Mount
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play("sndYoshi")
