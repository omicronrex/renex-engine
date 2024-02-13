#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///player properties


//jump vspeed values, and number of jumps
jump=8.5
jump2=7
maxjumps=2


//player simulation speed multiplier
//you can change this to make the player run slower
slomo=1


//these values are used to reset the player when disabling gimmicks such as beams and fields
maxSpeedDefault=3
baseGravDefault=0.4
maxVspeed=9


//turn on bow when difficulty is 0
bow=(difficulty==0)


//variables for optional player momentum system
//check engine_settings() for more information
mm_ground_fric=0.2
mm_air_fric=0
mm_ground_accel=0.3
mm_air_accel=0.2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///initialize variables
//you usually don't need to change any of these, they're mostly used for gimmicks

djump=1
ladder=false
onPlatform=false
onGround=false
ladderjump=false
hang=false
dot_hitbox=false
dotkid=false
shootkid=false
onfire=false
vvvvvv=false

cherried=false
cherried_antigrav=false
cherried_fireball=false

dead=false
activated=true

oldslomo=-1

coyoteTime=0
jump_timer=0
oneframe_buffer=0

beamstate=beam_normal

vflip=1
facing=1

h=0

maxSpeed=maxSpeedDefault
baseGrav=baseGravDefault

slope_angle=0
sprite_angle=0

image_speed=0.2
gravity=baseGrav
walljump=0
checkdeath=0
walljumpboost=0
vsplatform=0

oldx=x oldy=y
oldspr=sprite_index
oldfr=image_index
oldangle=image_angle
newx=x newy=y
newspr=sprite_index
newfr=image_index
newangle=image_angle

oldbowx=x oldbowy=y
newbowx=x newbowy=y

drawx=x drawy=y
drawangle=image_angle
bowx=x bowy=y

updating=0
stepcount=1
framefac=0

deathlist=0
flashing=0
iframes=0

input_h=0 input_v=0

drawhp=0
vineMap=ds_map_create()

input_clear()
input_consume()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///frame pacing

/*

    this engine runs a delta time system where the player is updated
    separately from the rest of the game, allowing the maker to choose
    to use any room speed they want while the player object will still
    only move in 3px increments and jump 4.5 blocks. this is achieved
    by freezing the player in place whenever not enough time has
    passed for a pal frame. you can also change the slomo multiplier
    to create a gimmick with a slowed down player.

    sprite smoothing is used to hide the jittery motion of a 50hz
    player, while the actual position of the object allows for needle
    tech such as aligns to work properly. moreover, since the player
    is only running every so often, a complex input system is in place
    that will collect inputs at room speed pace, and the player will
    then consume those stored inputs as soon as an update occurs.

    if unsure, you can always resort to using room speed 50, in which
    case the player will update every frame as normal. additionally,
    if the room speed is less than 50 or slomo is set to larger than 1,
    the player will not update multiple times per step, so be careful.

    and finally, a globalvar called "dt" is provided that gives you a
    factor between the selected game speed and 50hz, so you can multiply
    animation speeds or object speeds by dt to keep them consistent
    across different room speeds. an example is provided on Cherry.

    if the room/game speed is set to 50, sprite smoothing is disabled
    and if global.disable_delta_time is set to true,
    the delta time system is sidestepped entirely.

*/

//slow down music
if (slomo!=oldslomo)
    sound_kind_pitch(1,slomo)
oldslomo=slomo

updating=0
if (!frozen) {
    //add how much time has passed since last frame
    stepcount+=50/room_speed*slomo
    //is another frame in order?
    if (roundto(stepcount,0.00001)>=1) {
        updating=true
        stepcount=frac(stepcount)
    }
    //calculate sprite smoothing factor
    framefac=stepcount+0.5
}

//don't smooth if the room speed is 50
if (global.game_speed==50 && slomo==1) framefac=2

//disable delta time (but before dead check)
if (global.disable_delta_time) updating=1

//don't update while dead
if (dead || !activated) updating=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=updating
arg1=true
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///read controls

input_consume()

//align adjust keys
if ((global.a_d_trick && onGround) || global.test_run) {
    if (keyboard_check_pressed(ord("A"))) move_player(x-1,y,1)
    if (keyboard_check_pressed(ord("D"))) move_player(x+1,y,1)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///update collision mask

//execute the mask part of the current skin script
script_execute(global.player_skin,"mask")
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///gimmicks

if (!frozen) {
    //get on a ladder
    if (input_v!=0 && !ladder) if (instance_place(x,y,Ladder)) {
        ladder=true
        djump=1
    }

    if (ladder) {
        if (!instance_place(x,y,Ladder) || (onGround && macro_down_flip())) {
            //fall off
            ladder=false
        } else {
            //ride ladder
            if (input_v!=0) {if (place_free(x,y+maxSpeed*input_v)) {
                vspeed=maxSpeed*input_v
                gravity=0
            }} else vspeed=0

            //jump out of ladder
            if (key_jump(vi_pressed)) {
                ladderjump=true
                ladder=false
            }
        }
    }

    if (!ladder) {
        //normal gravity when not in a ladder
        gravity=baseGrav*vflip
    }

    //reset to default
    maxSpeed = maxSpeedDefault
    baseGrav = baseGravDefault

    //the beamstate variable contains a bitmask of what beams are currently active
    //check constants for the available beams, and the beam objects in gimmicks/see the moon
    if (instance_place(x,y,LowSpeedField)) {
        maxSpeed = 1
    } else if (instance_place(x,y,HighSpeedField) || beamstate&beam_highspeed) {
        maxSpeed = 6
    }

    if (instance_place(x,y,HighGravField) || beamstate&beam_highgrav) {
        baseGrav = 0.7
    } else if (instance_place(x,y,LowGravField) || beamstate&beam_lowgrav) {
        baseGrav = 0.2
    }

    //set vandal antigrav cherry gravity
    if (cherried_antigrav) {
        baseGrav = -0.1
    }

    //look for ice objects
    slipper=instance_place(x,y+4*vflip,SlipBlock)

    //refresh jump when touching a platform cherry
    if (instance_place(x,y,PlatformCherry)) {
        djump=1
    }

    if (walljumpboost>=0) {
        //set vars
        var i,vineMapSize;
        onVineL=false
        onVineR=false
        onVineType="normal"

        //update ds map
        ds_map_set(vineMap,0,instance_place(x-1,y,WallJumpL))
        ds_map_set(vineMap,1,instance_place(x+1,y,WallJumpR))
        ds_map_set(vineMap,2,instance_place(x-1,y,CautionStripL))
        ds_map_set(vineMap,3,instance_place(x+1,y,CautionStripR))
        ds_map_set(vineMap,4,instance_place(x-1,y,CautionFastL))
        ds_map_set(vineMap,5,instance_place(x+1,y,CautionFastR))
        //add your own vines here
        //don't forget to have L before R
        
        //update map size
        vineMapSize=ds_map_size(vineMap)+1
        
        if (!global.clean_vines) {
            //regular vines
            if (!onGround) {
                //check ds map when in the air
                for (i=0; i<vineMapSize; i+=1) {
                   if (ds_map_find_value(vineMap,i)) {
                        //set L or R
                        if (i mod 2==0) onVineL=true
                        else onVineR=true
                        
                        //set vine type
                        switch (i) {
                            case 0: onVineType="normal" break
                            case 1: onVineType="normal" break
                            case 2: onVineType="caution" break
                            case 3: onVineType="caution" break
                            case 4: onVineType="cautionfast" break
                            case 5: onVineType="cautionfast" break
                            //add your vine types here
                        }
                   }
                }
                //end of for loop 
            }
        } else {
            //clean vines
            if (!onPlatform && !onGround) {
                //check ds map when in the air
                for (i=0; i<vineMapSize; i+=1) {
                    //prevent air vines from working ------v
                    if (ds_map_find_value(vineMap,i)) if (ds_map_find_value(vineMap,i).active) {
                        //set L or R
                        if (i mod 2==0) onVineL=true
                        else onVineR=true
                        
                        //set vine type
                        switch (i) {
                            case 0: onVineType="normal" break
                            case 1: onVineType="normal" break
                            case 2: onVineType="caution" break
                            case 3: onVineType="caution" break
                            case 4: onVineType="cautionfast" break
                            case 5: onVineType="cautionfast" break
                            //add your vine types here
                        }
                    }
                }
                //end of for loop
            }
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///movement

if (!frozen) {
    if (!inside_view()) instance_activate_around(Player,64)

    //count down jump buffering
    if (jump_timer) jump_timer-=1

    if (walljumpboost) {
        //if you're boosting from a caution strip, lock controls
        input_h=walljumpdir
        walljumpboost-=1
    }

    //move horizontally
    if (walljumpboost<0) {
        //caution strip boosting
        facing=walljumpdir
        if (!walljump) {
            //high speed green caution strip (converted iwbtg code)
            altj+=1
            if (altj>=10) {
                hspeed-=sign(hspeed)
                altj=0
            }
            //guy gimmicks use custom gravity
            vspeed+=0.5-gravity
            if (abs(hspeed)<4) walljumpboost=0
        }
    } else {
        if (input_h!=0 && input_h!=onVineL-onVineR) {
            //if moving and not touching vines
            if (walljumpboost!=0) {
                //vine boost
                hspeed=(maxSpeed+1)*input_h
                facing=walljumpdir
            } else {
                if (slipper) {
                    //ice physics
                    hspeed=approach(hspeed,maxSpeed*input_h,slipper.slip)
                } else {
                    if (global.use_momentum_values && !ladder) {
                        //mario mode
                        if (onPlatform) hspeed+=input_h*mm_ground_accel
                        else hspeed+=input_h*mm_air_accel
                    } else {
                        //move normally
                        hspeed=maxSpeed*input_h
                    }
                }
            }
        } else {
            //the input is neutral
            if (slipper) {
                //slide to a stop
                hspeed=approach(hspeed,0,slipper.slip)
            } else {
                if (global.use_momentum_values && !ladder) {
                    //mario mode friction
                    if (onPlatform) hspeed=approach(hspeed,0,mm_ground_fric)
                    else hspeed=approach(hspeed,0,mm_air_fric)
                } else {
                    //stop moving
                    hspeed=0
                }
            }
        }
        //horizontal speed limit
        if (!onVineR && !onVineL) hspeed=median(-maxSpeed,hspeed,maxSpeed)
        
        //discard fractionary component of halign if not moving
        if (hspeed=0 && !global.allow_frac_x_coordinate) x=round(x)
    }

    //vertical speed limit
    if (vflip==-1) vspeed=max(-maxVspeed,vspeed)
    else if (vflip==1) vspeed=min(vspeed,maxVspeed)

    if (!cutscene) {
        //player actions
        
        if (key_shoot(vi_pressed) || (key_shoot() && global.debug_autofire_counter==1)) {
            player_shoot()
        }
        if (key_jump(vi_released_early) && !global.disable_cancels) {
            //this is used to cactus
            player_capjump()
        }
        if (key_jump(vi_pressed)) {
            player_jump()
        }
        if (oneframe_buffer) {
            //minimum jump is a 2f with cancels disabled
            player_capjump()
            oneframe_buffer=0
        } else if (key_jump(vi_released)) {
            if (global.disable_cancels && key_jump(vi_pressed)) oneframe_buffer=1
            else player_capjump()
        }
        if (key_die()) {
            kill_player()
        }
    }

    //update ground and platform detection
    if (onPlatform) {
        if (!instance_place(x,y+4*vflip+vspeed,Platform) && !coyoteTime) {
            onPlatform=false
        }
    }
    if (onGround) {
        if (place_free(x,y+vflip+vspeed) && !instance_place(x,y+4*vflip+vspeed,Platform) && !coyoteTime) {
            onGround=false
        }
    }

    //update coyote time
    if (coyoteTime!=0) {
        if (global.coyote_time_floating) vspeed-=gravity
        coyoteTime-=1
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///handle vines

//onVineL and onVineR are set in the movement block for consistency with Studio engines

//handled in the next code block
if (global.clean_vines) exit

hang=false
if (!vvvvvv) if (!onGround) {
    if (onVineL || onVineR) {
        //touching vine
        hang=true
        facing=esign(onVineL-onVineR,1)

        vspeed=2*vflip

        //eat djump when maker vines is disabled
        if (key_jump(vi_pressed) && !global.maker_vines) {
            if (onPlatform) {
                djump=1
                walljump=2
            } else if (djump<maxjumps) {
                djump+=1
                sound_play_slomo("sndDJump")
            }
        }

        //input away from the vine
        if (
            (onVineL && key_right(vi_pressed))
        ||  (onVineR && key_left(vi_pressed))
        ||  (key_jump(vi_pressed) && global.maker_vines)
        ) {
            hang=false
            onVineL=false
            onVineR=false
            if (key_jump()) {
                //jumping off vine
                walljump=2
                if (onVineType=="normal") {
                    hspeed=15*facing
                    vspeed=-9*vflip
                }
                if (onVineType=="caution") {
                    hspeed=15*facing
                    vspeed=-9*vflip
                    walljumpboost=24
                    walljumpdir=facing
                }
                if (onVineType=="cautionfast") {
                    hspeed=10*facing
                    vspeed=-10*vflip
                    altj=2
                    walljumpboost=-1
                    walljumpdir=facing
                }
                //add custom vines here
            } else {
                //just moving off vine
                hspeed=3*facing
            }
        } else if ((onVineL && key_right()) || (onVineR && key_left())) {
            //slide off of vine if holding the right direction, but not pressing it
            hspeed=3*facing
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///handle clean vines

//skedaddle out if the setting's off
if (!global.clean_vines) exit

hang=false
if (!vvvvvv) if (!onPlatform) {
    if (onVineL || onVineR) {
        //touching vine
        hang=true
        facing=esign(onVineL-onVineR,1)
        
        //set vspeed based on gravity
        //doesn't change if your vspeed is above the threshhold, like ice vines
        if (vflip==-1) vspeed=max(-2,vspeed)
        else if (vflip==1) vspeed=min(vspeed,2)

        if (key_jump(vi_pressed)) {
            //vine jump
            hang=false
            onVineL=false
            onVineR=false

            //play vine jump sound
            sound_play_slomo("sndJump")
            sound_play_slomo("sndDJump")

            //handle different vine types
            switch (onVineType) {
                case "normal": {
                    walljumpboost=5
                    walljumpdir=facing
                    hspeed=3*facing
                    vspeed=-jump*vflip
                }break
                case "caution": {
                    walljumpboost=24
                    walljumpdir=facing
                    hspeed=3*facing
                    vspeed=-jump*vflip
                }break
                case "cautionfast": {
                    walljumpboost=-1
                    walljumpdir=facing
                    altj=2
                    hspeed=10*facing
                    vspeed=-jump*vflip
                }break
            }
            //prevent 1fs from fulljumping
            if (key_jump(vi_released)) player_capjump()
        } else if ((key_left() && onVineR) || (key_right() && onVineL)) {
            //moving away from vine
            hang=false
            onVineL=false
            onVineR=false
            hspeed=3*facing
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///other gimmicks

//conveyor blocks
conveyor=instance_place(x,y+4*vflip,ConveyorLeft) if (conveyor) hspeed+=conveyor.spd
conveyor=instance_place(x,y+4*vflip,ConveyorRight) if (conveyor) hspeed+=conveyor.spd

//push blocks
with (PushBlock) if (vspeed=0) if (instance_place(x-sign(other.hspeed)*2,y,other.id)) {
    solid=0
    if (place_free(x+sign(other.hspeed)*push_speed,y)) {
        hspeed=sign(other.hspeed)*push_speed
    }
    solid=1
}

//get shape water type
var sw,swt;
sw=instance_place(x,y,ShapeWater)
if (sw) {
    swt=sw.water_type
} else swt=""

//various water types
if (instance_place(x,y,GuyWater)) {
    if (vspeed*vflip>gravity) vspeed=gravity*vflip
    djump=maxjumps
    onfire=false
}
if (instance_place(x,y,Water1) || instance_place(x,y,Water3) || swt=="Water1" || swt=="Water3") {
    if (vspeed*vflip>2) vspeed=2*vflip
    djump=1
}
if (instance_place(x,y,Water2) || instance_place(x,y,NekoronWater) || instance_place(x,y,CatharsisWater) || swt=="Water2" || swt=="CatharsisWater") {
    if (vspeed*vflip>2) vspeed=2*vflip
}

//one way gates
coll=instance_place(x+hspeed,y,GateLeft) if (coll) if (x+1-hspeed<=coll.bbox_left+2) {move_player(x+coll.bbox_left-(bbox_right+1),y,1) hspeed=0}
coll=instance_place(x+hspeed,y,GateRight) if (coll) if (x-hspeed>=coll.bbox_right-2) {move_player(x+coll.bbox_right-(bbox_left),y,1) hspeed=0}
coll=instance_place(x,y+vspeed,GateUp) if (coll) if (y+1-vspeed<=coll.bbox_top+2) {move_player(x,y+coll.bbox_top-(bbox_bottom+1)-gravity,1) vspeed=0}
coll=instance_place(x,y+vspeed,GateDown) if (coll) if (vspeed-coll.vspeed<0 && y-vspeed>=coll.bbox_bottom-2) {move_player(x,y+coll.bbox_bottom-(bbox_top)+1-gravity,1) vspeed=max(coll.vspeed,vspeed)}

//fire
if (onfire) {
    instance_create(x,y,FirePart)
}

if (vvvvvv) {
    if (vflip== 1 && vspeed!=0) vspeed= maxVspeed
    if (vflip==-1 && vspeed!=0) vspeed=-maxVspeed
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///slopes
var land,store_y,was_on_slope,is_going_into_slope,grav_step;

land=0
was_on_slope=0
is_going_into_slope=0
grav_step=gravity
if (gravity==0) grav_step=0.5*vflip

if (esign(vspeed+gravity,vflip)==vflip) {
    was_on_slope=instance_place(x,y+2*vflip,SlopeParent)
    if (!was_on_slope) is_going_into_slope=instance_place(x+hspeed,y+2*vflip*!dotkid,SlopeParent)
    if (was_on_slope || is_going_into_slope) {
        x+=hspeed
        if (place_free(x,y)) {
            if (was_on_slope) if (instance_place(x,y+8*vflip,Block)) {
                //land on solids moving down
                //optimization: only check collision once it crosses pixel boundary
                while (!instance_place(x,y+grav_step,Block)) {store_y=round(y) do y+=grav_step until round(y)!=store_y} y-=grav_step
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
    //successfully landed on/walked along a slope
    player_land(0)
    //discover surface angle using two binary search seekers
    var ly,ry,len,fl,fr;
    fl=0 fr=0
    ly=y+16*vflip
    ry=ly
    len=8*vflip
    repeat (4) {
        if (collision_line(bbox_left,y,bbox_left,ly,Block,1,0)) {ly-=len fl=1} else ly+=len
        if (collision_line(bbox_right,y,bbox_right,ry,Block,1,0)) {ry-=len fr=1} else ry+=len
        len/=2
    }
    if (fl && fr) slope_angle=angle_difference(0,point_direction(bbox_left,ly,bbox_right,ry))
} else slope_angle=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///solid collision
var land,a,s;

if (dotkid) {
    image_xscale=1
} else if (walljumpboost<=0) {
    image_xscale=abs(image_xscale)*facing
}

//technically, solid collision is supposed to happen after the step event -
//so we add gravity before checking for collisions
vspeed+=gravity

if (!place_free(x+hspeed,y+vspeed)) {
    //there is a collision
    if (!place_free(x+hspeed,y)) {
        //check for collision horizontally first
        if (hspeed>=0) x=floor(x)
        else x=ceil(x)
        a=ceil(abs(hspeed))
        s=sign(hspeed)
        repeat (a+1) {
            x+=s
            if (!place_free(x,y)) {
                x-=s
                player_hitwall()
            break}
        }
        x-=hspeed
        walljumpboost=0
    }

    if (!place_free(x,y+vspeed)) {
        //check for collision vertically
        a=ceil(abs(vspeed))
        s=sign(vspeed)

        repeat (a+1) {
            y+=s
            if (!place_free(x,y)) {
                y-=s
                if (s==vflip) {
                    player_land(0)
                } else {
                    player_hitceiling()
                }
                break
            }
        }
        y-=vspeed
    }

    if (!place_free(x+hspeed,y+vspeed)) {
        //if there's still a collision anyway, stop moving horizontally
        hspeed=0
    }
}

vsplatform=0
//we subtract gravity because we added it before  
vspeed-=gravity
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///chill
//makes the player stop moving when delta timing

//consume inputs while frozen so that you don't cancel when it's over
if (frozen) input_consume()

image_index-=image_speed
x-=hspeed
y-=vspeed
vspeed-=gravity
speed+=friction
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=updating
arg1=true
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///nekoron water bug

if (key_jump(vi_pressed)) if (instance_place(x,y+1*vflip,NekoronAir) && !onGround) {
    vspeed=-jump2*vflip
    repeat (choose(1,2,3)) sound_play_slomo("sndDJump")
    image_index=0
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///killer detection
//must be done after collision to ensure fairness

if (iframes) {
    //invincible
    flashing=iframes
    iframes-=1
} else {
    with (instance_place(x,y,PlayerKiller)) {
        kill_player()
    }
    with (instance_place(x,y,PlayerKillerActive)) {
        if (active) kill_player()
    }
    if (dot_hitbox) if (instance_place(x,y,WhiteDotKiller)) {
        kill_player()
    }
    if (dotkid) if (instance_place(x,y,DotkidKiller)) {
        kill_player()
    }
    if (instance_place(x,y,DotKiller)) {
        if (dot_hitbox) {
            tmp=mask_index
            mask_index=sprWhiteDot
            if (instance_place(x,y,DotKiller)) kill_player()
            mask_index=tmp
        } else kill_player()
    }

    if (onfire && onGround) kill_player()
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///update sprite
script_execute(global.player_skin,"step")

player_update_sprite()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///follow platforms correctly

//this is necessary because the player can't
//follow platforms during standstill frames

if (!global.pause) move_player(x,y+vsplatform,1)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///buggy walljump sound

if (walljump!=0) {
    repeat (2) {
        sound_play_slomo("sndJump")
    }
    walljump=approach(walljump,0,1)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///check autosave

autosave_do()
#define Collision_Platform
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!dead) {
    if (vflip==-1) platformOffset=sprite_get_yoffset(mask_index)
    else platformOffset=sprite_get_height(mask_index)-sprite_get_yoffset(mask_index)
    if (dotkid) checkOffset=-vspeed/2
    else checkOffset=0

    if (object_other_is_child_of(LiftBlock)) {
        //it's a solid lift block
        x-=hspeed
        y-=vspeed

        if (instance_place(x+hspeed,y,other.id)) {
            repeat (floor(abs(hspeed))) {if (instance_place(x+sign(hspeed),y,other.id)) break x+=sign(hspeed)}
            hspeed=0
            y+=vspeed
            break
        } else x+=hspeed

        if (vspeed<=other.vspeed) {if (instance_place(x,y+vspeed,other.id)) {
            repeat (floor(abs(vspeed))) {if (instance_place(x,y+sign(vspeed),other.id)) break y+=sign(vspeed)}
            vspeed=max(vspeed,other.vspeed)
        } else y+=vspeed} else y+=vspeed
    }

    if (global.platform_swimming) onPlatform=true

    if (vflip==1) {
        //platforms, normal gravity
        
        //find top of the platform using a binary search
        oy=y
        search=16
        repeat (5) {
            if (instance_place(x,y,other.id)) y-=search
            else y+=search
            search/=2
        }
        if (instance_place(x,y,other.id)) y-=1
        ytop=bbox_bottom+1
        y=oy
        
        //change snap type for CustomSnap platforms
        var snap_var;
        if (other.object_index==CustomSnap) snap_var=other.snap_type
        else snap_var=global.platform_snap_type
        
        //check platform snap type
        if (check_plat_snap(1,snap_var)) {
            if (snap_var!=2 || (snap_var!=3 && other.image_angle mod 90!=0) || vspeed-other.vspeed>=0) {
                y=ytop-platformOffset
                if (!place_free(x,y)) {
                    //crushed!
                    if (other.vspeed<0) {
                        if (global.platform_crush_behavior==1) check_crush()
                        if (global.platform_crush_behavior==2) move_outside_solid(270,20)
                    } else y=oy
                } else {
                    //land on it
                    vspeed=max(0,other.vspeed/dt/slomo)
                    player_land(1)
                    with (other) event_trigger(tr_platland)   
                }
            }
            vsplatform=max(0,other.vspeed)
            walljumpboost=0
        }
    } else {
        //upside down platforms
        
        //find bottom of the platform using a binary search
        oy=y
        search=-16
        repeat (5) {
            if (instance_place(x,y,other.id)) y-=search
            else y+=search
            search/=2
        }
        if (instance_place(x,y,other.id)) y+=1
        ytop=bbox_top
        y=oy
        
        //change snap type for CustomSnap platforms
        var snap_var;
        if (other.object_index==CustomSnap) snap_var=other.snap_type
        else snap_var=global.platform_snap_type
        
        //check platform snap type
        if (check_plat_snap(-1,snap_var)) {
            if (snap_var!=2 || (snap_var!=3 && other.image_angle mod 90!=0) || vspeed-other.vspeed<=0) {
                y=ytop+platformOffset
                if (!place_free(x,y)) {
                    //crushed!
                    if (other.vspeed>0) {
                        if (global.platform_crush_behavior==1) check_crush()
                        if (global.platform_crush_behavior==2) move_outside_solid(90,20)
                    } else y=oy
                } else {
                    //land on it
                    vspeed=min(0,other.vspeed/dt/slomo)
                    player_land(1)
                    with (other) event_trigger(tr_platland)   
                }
            }
            vsplatform=min(0,other.vspeed)
            walljumpboost=0
        }
    }
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///wrap around, or die trying

marginh=bbox_right-bbox_left+2
marginv=bbox_bottom-bbox_top+2

if (instance_place(x,y,ScreenWrap)) {
    if (hspeed>0 && x>room_width)  {if (!move_player(x-room_width-marginh,y ,1)) x-=hspeed}
    if (vspeed>0 && y>room_height) {if (!move_player(x,y-room_height-marginv,1)) y-=vspeed}
    if (hspeed<0 && x<0)           {if (!move_player(x+room_width+marginh,y ,1)) x-=hspeed}
    if (vspeed<0 && y<0)           {if (!move_player(x,y+room_height+marginv,1)) y-=vspeed}
} else {
    coll=instance_place(x,y,OutsideWarp)
    if (coll) {
        with (coll) {
            if (warpCoord[0]==noone && warpCoord[1]==noone && roomTo=room) {
                //warp isn't set up correctly
                instance_destroy()
            } else if (roomTo!=room) {
                //warp!
                input_clear()
                if (autosave) autosave_asap()
                if (warpCoord[0]==noone && warpCoord[1]==noone) {
                    warp_to(roomTo)
                } else {
                    warp_to(roomTo,warpCoord[0],warpCoord[1])
                }
                global.warp_id=warpid
            }
        }
    } else {
        //death.
        if (global.die_outside_room || instance_place(x,y,DieOutside)) kill_player()
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!is_ingame()) {
    //not in a game room!
    sound_kind_pitch(1,1)
    instance_destroy()
}

//fix dotkid sprite on first frame when reloading
if (dotkid) {
    sprite_index=sprDotKid
    mask_index=-1
}

//activate celeste cape & reset it if you change the variable state
if (global.celeste_cape && global.player_skin==global.player_default_skin) change_skin(skin_celeste_cape)
else if (!global.celeste_cape && global.player_skin==skin_celeste_cape) change_skin(global.player_default_skin)

//fix sprite for first frame
script_execute(global.player_skin,"step")
oldspr=sprite_index
newspr=oldspr

//some debug stuff
deathlist=0
flashing=0
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (dead) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///update sprite coordinates
player_update_sprite_coords()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///skin draw

if (!dead) {
    if (global.debug_god) {
        i=1
        //death list for godmode
        repeat (deathlist[0]) {
            draw_sprite_ext(mask_index,0,deathlist[i],deathlist[i+1],1,1,0,$ff,0.5)
            i+=2
        }
    }

    //don't draw player if flashing from iframes
    if (flashing) {
        flashing-=1
        if (flashing mod 5 > 2) exit
    }
    
    //don't draw player if a fireball is active
    if (cherried_fireball) exit

    script_execute(global.player_skin,"draw")

    //draw hp bar if the setting to draw it on the player is on
    if (drawhp && instance_exists(HPMode)) draw_healthbar(drawx-24,drawy-24,drawx+24,drawy-20,(HPMode.hp/HPMode.maxhp)*100,0,HPMode.mincol,HPMode.maxcol,0,1,1)

    //draw godmode & infjump special bows
    if (global.debug_god) draw_sprite_ext(sprBow,1,floor(bowx),floor(bowy+abs(lengthdir_y(2,sprite_angle))*vflip+(vflip==-1)),facing,vflip,drawangle,image_blend,image_alpha)
    if (global.debug_jump) draw_sprite_ext(sprBow,2,floor(bowx),floor(bowy+abs(lengthdir_y(2,sprite_angle))*vflip+(vflip==-1)),facing,vflip,drawangle,image_blend,image_alpha)

    //draw celeste bow
    if (bow && global.celeste_bow && djump>=maxjumps) draw_sprite_ext(sprBow,3,floor(bowx),floor(bowy+abs(lengthdir_y(2,sprite_angle))*vflip+(vflip==-1)),facing,vflip,drawangle,image_blend,image_alpha)

    if (global.debug_overlay) {
        draw_sprite_ext_fixed(mask_index,0,floor(x),floor(y)+(vflip==-1),image_xscale,image_yscale,image_angle,image_blend,image_alpha*0.5)
    }
}
#define Trigger_Draw End
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///draw slow motion effect
if (slomo<1) {
    draw_set_alpha(0.025+0.025*sin(global.increment/2))
    draw_rectangle_color(0,0,room_width,room_height,0,0,0,0,0)
    draw_set_alpha(1)
}
