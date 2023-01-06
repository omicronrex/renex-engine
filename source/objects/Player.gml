#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///player properties

jump=8.5
jump2=7

maxjumps=2

maxSpeedDefault=3
baseGravDefault=0.4
maxVspeed=9

slomo=1

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
//you usually don't need to touch any of these

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

dead=false
activated=true

oldslomo=-1

coyoteTime=0
jump_timer=0

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

afkk=0

memplat=noone

deathlist=0
flashing=0
iframes=0

input_h=0 input_v=0

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

*/

//slow down music
if (slomo!=oldslomo)
    sound_kind_pitch(1,slomo)
oldslomo=slomo

updating=0
if (!frozen) {
    //add how much time has passed since last frame
    stepcount+=50/room_speed*slomo
    stepcount=floor(stepcount*100000)/100000
    //is another frame in order?
    if (stepcount>=1) {
        stepcount=stepcount mod 1
        updating=1
    }
    //calculate sprite smoothing factor
    framefac=stepcount+0.5
}

//don't smooth if the room speed is 50
if (global.game_speed==50 && slomo==1) framefac=2

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
if (global.a_d_trick) {
    if (keyboard_check_pressed(ord("A"))) move_player(x-1,y,1)
    if (keyboard_check_pressed(ord("D"))) move_player(x+1,y,1)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///speed fields or beams

maxSpeed = maxSpeedDefault
baseGrav = baseGravDefault

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
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///skin mask
script_execute(global.player_skin,"mask")
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///ladders

if (input_v!=0 && !ladder) if (instance_place(x,y,Ladder)) {
    ladder=true
    djump=1
}

if (ladder) {
    if (!instance_place(x,y,Ladder) || (onGround && key[pick(!vflip,key_down,key_up)])) {
        ladder=false
    } else {
        if (input_v!=0) {if (place_free(x,y+maxSpeed*input_v)) {
            vspeed=maxSpeed*input_v
            gravity=0
        }} else vspeed=0
        if (key_pressed[key_jump]) {
            ladderjump=true
            ladder=false
        }
    }
}

if (!ladder) {
    gravity=baseGrav*vflip
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///movement

if (!frozen) {
    if (!inside_view()) instance_activate_around_player()

    if (jump_timer) jump_timer-=1

    if (walljumpboost) {
        input_h=walljumpdir
        walljumpboost-=1
    }

    //ice
    slipper=instance_place(x,y+4*vflip,SlipBlock)

    //move horizontally
    if (walljumpboost<0) {
        //caution strip boosting
        facing=walljumpdir
        if (!walljump) {
            altj+=1
            if (altj>=10) {
                hspeed-=sign(hspeed)
                altj=0
            }
            vspeed+=0.5-gravity
            if (abs(hspeed)<4) walljumpboost=0
        }
    } else {
        ///vine checks
        onVineL=false
        onVineR=false
        if (!onPlatform) {
            onVineType="normal"
            if (instance_place(x-1,y,WallJumpL)) onVineL=true
            if (instance_place(x+1,y,WallJumpR)) onVineR=true
            if (instance_place(x-1,y,CautionStripL)) {onVineL=true onVineType="caution"}
            if (instance_place(x+1,y,CautionStripR)) {onVineR=true onVineType="caution"}
            if (instance_place(x-1,y,CautionFastL)) {onVineL=true onVineType="cautionfast"}
            if (instance_place(x+1,y,CautionFastR)) {onVineR=true onVineType="cautionfast"}
        }

        if (input_h!=0 && input_h!=onVineL-onVineR) {
            if (walljumpboost!=0) {
                hspeed=(maxSpeed+1)*input_h
            } else {
                if (slipper) {
                    hspeed=inch(hspeed,maxSpeed*input_h,slipper.slip)
                } else {
                    if (global.use_momentum_values && !ladder) {
                        if (onPlatform) hspeed+=input_h*mm_ground_accel
                        else hspeed+=input_h*mm_air_accel
                    } else {
                        hspeed=maxSpeed*input_h
                    }
                }
            }
        } else {
            if (slipper) {
                hspeed=inch(hspeed,0,slipper.slip)
            } else {
                if (global.use_momentum_values && !ladder) {
                    if (onPlatform) hspeed=inch(hspeed,0,mm_ground_fric)
                    else hspeed=inch(hspeed,0,mm_air_fric)
                } else {
                    hspeed=0
                }
            }
        }
        if (!onVineR && !onVineL) hspeed=median(-maxSpeed,hspeed,maxSpeed)
        if (hspeed=0) x=round(x)
    }

    if (vflip==-1) vspeed=max(-maxVspeed,vspeed)
    else if (vflip==1) vspeed=min(vspeed,maxVspeed)

    if (!cutscene) {
        afkk=(afkk+1) mod 4
        if (key_pressed[key_shoot] || (key[key_shoot] && global.debug_autofire && !afkk)) {
            player_shoot()
        }
        if (key_released_early[key_jump]) {
            if (vspeed*vflip<0) vspeed*=0.45
        }
        if (key_pressed[key_jump]) {
            player_jump()
        }
        if (key_released[key_jump]) {
            if (vspeed*vflip<0) vspeed*=0.45
        }
        if (key_pressed[key_die]) {
            kill_player()
        }
    }

    if (onPlatform) {
        if (!instance_place(x,y+4*vflip,Platform) && !coyoteTime) {
            onPlatform=false
        }
    }
    if (onGround) {
        if (place_free(x,y+vflip) && !coyoteTime) {
            onGround=false
        }
    }

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
///walljumps

//onVineL and onVineR are set in the movement block for consistency with Studio engines

hang=false
if (!vvvvvv) if (!onPlatform) {
    if (onVineL || onVineR) {
        hang=true
        facing=esign(onVineL-onVineR,1)

        vspeed = 2 * vflip;

        //pressed away from the vine
        if (
            (onVineL && key_pressed[key_right])
        ||  (onVineR && key_pressed[key_left ])
        ||  (key_pressed[key_jump] && global.maker_vines)
        ) {
            hang=false
            onVineL=false
            onVineR=false
            if (key[key_jump]) {
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
            } else {
                //moving off vine
                hspeed=3*facing
            }
        }
    }

    if (hang) {
        //eat djump when not maker vines
        if (key_pressed[key_jump] && !global.maker_vines) {
            if (onPlatform) {
                djump=1
                walljump=2
            } else if (djump<maxjumps) {
                djump+=1
                walljump=-2
            }
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///gimmicks

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

//various water types
if (instance_place(x,y,GuyWater)) {
    if (vspeed*vflip>gravity) vspeed=gravity*vflip
    djump=maxjumps
    onfire=false
}
if (instance_place(x,y,Water1) || instance_place(x,y,Water3)) {
    if (vspeed*vflip>2) vspeed=2*vflip
    djump=1
}
if (instance_place(x,y,Water2) || instance_place(x,y,NekoronWater) || instance_place(x,y,CatharsisWater)) {
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
    //optimization: short circuit
    if (!was_on_slope) is_going_into_slope=instance_place(x+hspeed,y+2*vflip*!dotkid,SlopeParent)
    if (was_on_slope || is_going_into_slope) {
        x+=hspeed
        if (place_free(x,y)) {
            if (was_on_slope) if (instance_place(x,y+8*vflip,Block)) {
                //land on slope or blocks moving down
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
    onGround=true
    player_land(vspeed)
    vspeed=0
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
var land,a,s,oldvsp;

if (dotkid) {
    image_xscale=1
} else if (walljumpboost<=0) {
    image_xscale=abs(image_xscale)*facing
}

//we add gravity because this is supposed to happen after movement update
vspeed+=gravity

if (!place_free(x+hspeed,y+vspeed)) {
    if (!place_free(x+hspeed,y)) {
        if (hspeed>=0) x=floor(x)
        else x=ceil(x)
        a=ceil(abs(hspeed))
        s=sign(hspeed)
        repeat (a+1) {
            x+=s
            if (!place_free(x,y)) {x-=s player_hitwall(hspeed) hspeed=0 break}
        }
        x-=hspeed
        walljumpboost=0
    }

    if (!place_free(x,y+vspeed)) {
        a=ceil(abs(vspeed))
        s=sign(vspeed)
        oldvsp=vspeed
        vspeed=0

        repeat (a+1) {
            y+=s
            if (!place_free(x,y)) {
                y-=s
                if (s==vflip) {
                    player_land(oldvsp)
                    onGround=true
                } else {
                    player_hitceiling(oldvsp)
                }
                break
            }
        }
        y-=vspeed
    }

    if (!place_free(x+hspeed,y+vspeed)) {
        hspeed=0
    }
}

vsplatform=0
//we subtract gravity because we added it before
//collision shenanigans, just trust me on this one
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

if (key_pressed[key_jump]) if (instance_place(x,y+1*vflip,NekoronAir) && !onPlatform) {
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
    flashing=iframes
    iframes-=1
} else {
    with (instance_place(x,y,PlayerKiller)) {
        kill_player()
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

    if (onfire && onPlatform) kill_player()
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///sprite smoothing
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
    if (walljump>0) repeat (2) sound_play_slomo("sndJump")
    else repeat (2) sound_play_slomo("sndDJump")
    walljump=inch(walljump,0,1)
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
    if (object_other_is_child_of(LiftBlock)) {
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

    onPlatform=true

    if (vflip==1) {
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

        if (y-vspeed/2-8*dotkid<=ytop) {
            if (other.snap || vspeed-other.vspeed>=0) {
                y=ytop-9+8*dotkid
                if (!place_free(x,y)) {
                    if (other.vspeed<0) {
                        if (global.platform_crush_behavior==1) check_crush()
                        if (global.platform_crush_behavior==2) move_outside_solid(270,20)
                    } else y=oy
                } else {
                    oldvspeed=vspeed
                    vspeed=max(0,other.vspeed/dt/slomo)
                    player_land(oldvspeed)
                    with (other) event_trigger(tr_platland)
                    onGround=true
                    djump=true
                }
            }
            vsplatform=max(0,other.vspeed)
            walljumpboost=0
        }
    } else {
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

        if (y-vspeed/2+7*dotkid>=ytop) {
            if (other.snap || vspeed-other.vspeed<=0) {
                y=ytop+9-7*dotkid
                if (!place_free(x,y)) {
                    if (other.vspeed>0) {
                        if (global.platform_crush_behavior==1) check_crush()
                        if (global.platform_crush_behavior==2) move_outside_solid(270,20)
                    } else y=oy
                } else {
                    oldvspeed=vspeed
                    vspeed=min(0,other.vspeed/dt/slomo)
                    player_land(oldvspeed)
                    with (other) event_trigger(tr_platland)
                    onGround=true
                    djump=true
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
            if (warpX==noone && warpY==noone && roomTo=room) {
                instance_destroy()
            } else if (roomTo!=room) {
                input_clear()
                if (autosave) autosave_asap()
                if (warpX==noone && warpY==noone) {
                    warp_to(roomTo)
                } else {
                    warp_to(roomTo,warpX,warpY)
                }
                global.warp_id=warpid
            }
        }
    } else {
        if (global.die_outside_room || instance_place(x,y,DieOutside)) kill_player()
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//room start
if (!is_ingame()) {
    sound_kind_pitch(1,1)
    instance_destroy()
}

//fix dotkid sprite on first frame when reloading
if (dotkid) {
    sprite_index=sprDotKid
    mask_index=-1
}

//fix sprite for first frame
script_execute(global.player_skin,"step")
oldspr=sprite_index
newspr=oldspr

//debug stuff
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

if (framefac==2) {
    //immediate mode for 50hz
    drawx=x
    drawy=y
    drawspr=sprite_index
    drawframe=image_index
    drawangle=image_angle+sprite_angle
    bowx=newbowx
    bowy=newbowy
} else {
    drawx=lerp(oldx,newx,framefac)
    drawy=lerp(oldy,newy,framefac)
    drawspr=oldspr
    drawframe=oldfr
    drawangle=lerp(oldangle,newangle,framefac)
    bowx=lerp(oldbowx,newbowx,framefac)
    bowy=lerp(oldbowy,newbowy,framefac)
}

if (vflip==1) drawy=floor(drawy)
else drawy=ceil(drawy)-1
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

    if (flashing) {
        flashing-=1
        if (flashing mod 5 > 2) exit
    }

    script_execute(global.player_skin,"draw")

    if (global.debug_god) draw_sprite_ext(sprBow,1,floor(bowx),floor(bowy+abs(lengthdir_y(2,sprite_angle))*vflip+(vflip==-1)),facing,vflip,drawangle,image_blend,image_alpha)
    if (global.debug_jump) draw_sprite_ext(sprBow,2,floor(bowx),floor(bowy+abs(lengthdir_y(2,sprite_angle))*vflip+(vflip==-1)),facing,vflip,drawangle,image_blend,image_alpha)

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
