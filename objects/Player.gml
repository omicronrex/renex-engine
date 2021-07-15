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

maxSpeed=3
baseGrav=0.4
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

skin=global.player_skin
weapon=global.player_weapon

djump=1
ladder=false
onPlatform=false
ladderjump=false
hang=false
dot_hitbox=false
dotkid=false
shootkid=false
onfire=false
vvvvvv=false

coyoteTime=0
jump_timer=0

beamstate=beam_normal

vflip=1
facing=1

h=0

angle=0
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

input_h=0 input_v=0
lrtype=settings("l+r behavior")
if (global.leftright_moonwalk) lrtype=lr_last

input_clear()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///check autosave
autosave_do()
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
sound_kind_pitch(1,slomo)

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

//don't smooth if it's turned off or the room speed is 50
if (!global.smooth_position || room_speed==50) framefac=1
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
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///speed fields or beams

maxSpeed = 3
baseGrav = 0.4

if (place_meeting(x,y,LowSpeedField)) {
    maxSpeed = 1
} else if (place_meeting(x,y,HighSpeedField) || beamstate&beam_highspeed) {
    maxSpeed = 6
}

if (place_meeting(x,y,HighGravField) || beamstate&beam_highgrav) {
    baseGrav = 0.7
} else if (place_meeting(x,y,LowGravField) || beamstate&beam_lowgrav) {
    baseGrav = 0.2
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///skin mask
script_execute(skin,"mask")
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///ladders

if (input_v!=0 && !ladder) if (place_meeting(x,y,Ladder)) {
    ladder=true
    djump=1
}

if (ladder) {
    if (!place_meeting(x,y,Ladder)) {
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
} else {
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

    if (!cutscene) {
        h=input_h
        //align adjust keys
        if (global.a_d_trick) {
            if (keyboard_check_pressed(ord("A"))) move_player(x-1,y,1)
            if (keyboard_check_pressed(ord("D"))) move_player(x+1,y,1)
        }
    }

    if (jump_timer) jump_timer-=1

    if (walljumpboost) {
        h=walljumpdir
        walljumpboost-=1
    }

    //ice
    slipper=instance_place(x,y+4*vflip,SlipBlock)

    //move horizontally
    if (walljumpboost<0) {
        if (!walljump) {
            //fortress & cart walljumps have different physics from yutu!
            altj+=1
            if (altj>=10) {
                hspeed-=sign(hspeed)
                altj=0
            }
            vspeed+=0.5-gravity
            if (abs(hspeed)<4) walljumpboost=0
        } else if (coyoteTime <= 0) vspeed-=gravity
    } else {
        if (h!=0) {
            if (!hang) {
                if (walljumpboost!=0) {
                    hspeed=(maxSpeed+1)*h
                } else {
                    if (slipper) {
                        hspeed=inch(hspeed,maxSpeed*h,slipper.slip)
                    } else {
                        if (global.use_momentum_values && !ladder) {
                            if (onPlatform) hspeed+=h*mm_ground_accel
                            else hspeed+=h*mm_air_accel
                            hspeed=median(-maxSpeed,hspeed,maxSpeed)
                        } else {
                            hspeed=maxSpeed*h
                        }
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
    }

    if (onPlatform || coyoteTime>0) {
        if (!place_meeting(x,y+4*vflip,Platform) && !place_meeting(x,y+vflip,Block)) {
            if (coyoteTime<=0) {
                onPlatform=false
            }
            coyoteTime-=1
        }
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
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///walljumps

hang=false
if (!vvvvvv) if (place_free(x,y+1*vflip)) {
    //vines
    if (distance_to_object(WallJumpL)<2) {
        hang=true vspeed=2*vflip facing=1
        if (key_pressed[key_right] || (key_pressed[key_jump] && global.vine_jumps)) {
            hang=false if (key[key_jump]) {vspeed=-9*vflip hspeed=15 walljump=2} else {hspeed=3}
        }
    }
    if (distance_to_object(WallJumpR)<2) {
        hang=true vspeed=2*vflip facing=-1
        if (key_pressed[key_left] || (key_pressed[key_jump] && global.vine_jumps)) {
            hang=false if (key[key_jump]) {vspeed=-9*vflip hspeed=-15 walljump=2} else {hspeed=-3}
        }
    }
    //caution strips
    if (distance_to_object(CautionStripL)<2) {
        hang=true vspeed=2*vflip facing=1
        if (key_pressed[key_right] || (key_pressed[key_jump] && global.vine_jumps)) {
            hang=false if (key[key_jump]) {vspeed=-9*vflip hspeed=15 walljumpboost=24 walljumpdir=1 walljump=2} else {hspeed=3}
        }
    }
    if (distance_to_object(CautionStripR)<2) {
        hang=true vspeed=2*vflip facing=-1
        if (key_pressed[key_left] || (key_pressed[key_jump] && global.vine_jumps)) {
            hang=false if (key[key_jump]) {vspeed=-9*vflip hspeed=-15 walljumpboost=24 walljumpdir=-1 walljump=2} else {hspeed=-3}
        }
    }
    //fast caution strips
    if (distance_to_object(CautionFastL)<2) {
        hang=true vspeed=2*vflip facing=1
        if (key_pressed[key_right] || (key_pressed[key_jump] && global.vine_jumps)) {
            hang=false if (key[key_jump]) {vspeed=-10*vflip hspeed=10 altj=2 walljumpboost=-1 walljump=2} else {hspeed=3}
        }
    }
    if (distance_to_object(CautionFastR)<2) {
        hang=true vspeed=2*vflip facing=-1
        if (key_pressed[key_left] || (key_pressed[key_jump] && global.vine_jumps)) {
            hang=false if (key[key_jump]) {vspeed=-10*vflip hspeed=-10 altj=2 walljumpboost=-1 walljump=2} else {hspeed=-3}
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
with (PushBlock) if (vspeed=0) if (place_meeting(x-sign(other.hspeed)*2,y,other.id)) {
    solid=0
    if (place_free(x+sign(other.hspeed)*push_speed,y)) {
        hspeed=sign(other.hspeed)*push_speed
    }
    solid=1
}

//various water types
if (place_meeting(x,y,GuyWater)) {
    if (vspeed*vflip>gravity) vspeed=gravity*vflip
    djump=maxjumps
    onfire=false
}
if (place_meeting(x,y,Water1) || place_meeting(x,y,Water3)) {
    if (vspeed*vflip>2) vspeed=2*vflip
    djump=1
}
if (place_meeting(x,y,Water2) || place_meeting(x,y,NekoronWater) || place_meeting(x,y,CatharsisWater)) {
    if (vspeed*vflip>2) vspeed=2*vflip
}

//one way gates

if (hspeed>0) {coll=instance_place(x+hspeed,y,GateLeft) if (coll) if (bbox_right+1-hspeed<=coll.bbox_left+2) hspeed=coll.bbox_left-(bbox_right+1)}
if (hspeed<0) {coll=instance_place(x+hspeed,y,GateRight) if (coll) if (bbox_left-hspeed>=coll.bbox_right-2) hspeed=coll.bbox_right-(bbox_left)}
if (vspeed>0) {coll=instance_place(x,y+vspeed,GateUp) if (coll) if (bbox_bottom+1-vspeed<=coll.bbox_top+2) {y+=coll.bbox_top-(bbox_bottom+1)-gravity vspeed=0}}
if (vspeed<0) {coll=instance_place(x,y+vspeed,GateDown) if (coll) if (bbox_top-vspeed>=coll.bbox_bottom-2) {y+=coll.bbox_bottom-(bbox_top)+1-gravity vspeed=0}}

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
var land;

angle=0

if (vspeed*vflip>=0) {
    if (global.angle_slopes) {
        if (vflip==1) {
            if (place_meeting(x-2,y,SlopeBL)) angle-=45
            if (place_meeting(x+2,y,SlopeBR)) angle+=45
        }
        if (vflip==-1) {
            if (place_meeting(x-2,y,SlopeTL)) angle+=45
            if (place_meeting(x+2,y,SlopeTR)) angle-=45
        }
    }

    land=0
    if (hspeed>0) {
        if (vflip==1) if (place_meeting(x,y+hspeed+2,SlopeBL)) {y=floor(y) land=1}
        if (vflip==-1) if (place_meeting(x,y-hspeed-2,SlopeTL)) {y=ceil(y) land=1}
    }
    if (hspeed<0) {
        if (vflip==1) if (place_meeting(x,y-hspeed+2,SlopeBR)) {y=floor(y) land=1}
        if (vflip==-1) if (place_meeting(x,y+hspeed-2,SlopeTR)) {y=ceil(y) land=1}
    }
    if (land) {
        move_contact_solid(180+90*vflip,abs(hspeed))
        vspeed=abs(hspeed)*vflip-gravity
        onPlatform=true
        walljumpboost=0
        djump=1
        coyoteTime=global.coyote_time
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///solid collision
var land,a,s;

if (dotkid) {
    image_xscale=1
} else if (walljumpboost==0) {
    image_xscale=abs(image_xscale)*facing
}

//we add gravity because this is supposed to happen after movement update
vspeed+=gravity

if (!place_free(x+hspeed,y+vspeed)) {
    if (!place_free(x+hspeed,y)) {
        a=ceil(abs(hspeed))
        s=sign(hspeed)

        land=0
        if (hspeed>0) {
            o=instance_place(x+a,y,SlopeBR)
            if (o) {
                repeat (a) {x+=s if (place_meeting(x,y,SlopeBR)) {y-=1 if (!place_free(x,y)) {x-=s y+=1 break}}}
                if (vspeed>=0 && vflip==1) land=1 else a=0
            }
            o=instance_place(x+a,y,SlopeTR)
            if (o) {
                repeat (a) {x+=s if (place_meeting(x,y,SlopeTR)) {y+=1 if (!place_free(x,y)) {x-=s y-=1 break}}}
                if (vspeed<=0 && vflip==-1) land=1 else a=0
            }
        }
        if (hspeed<0) {
            o=instance_place(x-a,y,SlopeBL)
            if (o) {
                repeat (a) {x+=s if (place_meeting(x,y,SlopeBL)) {y-=1 if (!place_free(x,y)) {x-=s y+=1 break}}}
                if (vspeed>=0 && vflip==1) land=1 else a=0
            }
            o=instance_place(x-a,y,SlopeTL)
            if (o) {
                repeat (a) {x+=s if (place_meeting(x,y,SlopeTL)) {y+=1 if (!place_free(x,y)) {x-=s y-=1 break}}}
                if (vspeed<=0 && vflip==-1) land=1 else a=0
            }
        }
        if (land) {
            if (!place_free(x,y+vspeed)) {vspeed=0 player_land()}
        }

        repeat (a) {
            x+=s
            if (!place_free(x,y)) {x-=s break}
        }
        hspeed=0
        walljumpboost=0
    }

    if (!place_free(x,y+vspeed)) {
        a=ceil(abs(vspeed))
        s=sign(vspeed)

        vspeed=0

        repeat (a) {
            y+=s
            if (!place_free(x,y)) {
                y-=s
                if (s==vflip) {
                    player_land()
                }
                break
            }
        }
    }
    if (!place_free(x+hspeed,y+vspeed)) {
        hspeed=0
    }
}

if (!onPlatform) angle=0

vsplatform=0
//we subtract gravity because we added it before
//collision shenanigans, just trust me on this one
vspeed-=gravity
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///skin step
script_execute(skin,"step")
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
image_index-=image_speed
x-=hspeed
y-=vspeed
vspeed-=gravity
speed+=friction
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///check autosave
autosave_do()
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

if (key_pressed[key_jump]) if (place_meeting(x,y+1*vflip,NekoronAir)) {
    vspeed=-jump2*vflip
    repeat (choose(1,2,3)) sound_play_slomo("sndDJump")
    djump=false
    image_index=0
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///killer detection
//must be done after collision to ensure fairness

if (place_meeting(x,y,PlayerKiller)) {
    kill_player()
}
if (dot_hitbox) if (place_meeting(x,y,WhiteDotKiller)) {
    kill_player()
}
if (dotkid) if (place_meeting(x,y,DotkidKiller)) {
    kill_player()
}
if (place_meeting(x,y,DotKiller)) {
    if (dot_hitbox) {
        tmp=mask_index
        mask_index=sprWhiteDot
        if (place_meeting(x,y,DotKiller)) kill_player()
        mask_index=tmp
    } else kill_player()
}

if (onfire && onPlatform) kill_player()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///sprite smoothing

oldbowx=newbowx
oldbowy=newbowy
if (global.bow_lag) {
    newbowx=newx
    newbowy=newy
} else {
    newbowx=x
    newbowy=y
}

oldx=newx
oldy=newy
oldspr=newspr
oldfr=newfr
oldangle=newangle
newx=floor(x)
newy=floor(y)
newspr=sprite_index
newfr=image_index
newangle=image_angle+sprite_angle
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

move_player(x,y+vsplatform,1)
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
if (walljump) {
    walljump-=1
    repeat (2) sound_play_slomo("sndJump")
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///update sprite coordinates

drawx=lerp(oldx,newx,framefac)
drawy=lerp(oldy,newy,framefac)
drawangle=lerp(oldangle,newangle,framefac)

bowx=lerp(oldbowx,newbowx,framefac)
bowy=lerp(oldbowy,newbowy,framefac)
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
if (other.object_index=LiftBlock || object_is_ancestor(other.object_index,LiftBlock)) {
    x-=hspeed
    y-=vspeed

    if (place_meeting(x+hspeed,y,other.id)) {
        repeat (floor(abs(hspeed))) {if (place_meeting(x+sign(hspeed),y,other.id)) break x+=sign(hspeed)}
        hspeed=0
    } else x+=hspeed

    if (vspeed<other.vspeed) {if (place_meeting(x,y+vspeed,other.id)) {
        repeat (floor(abs(vspeed))) {if (place_meeting(x,y+sign(vspeed),other.id)) break y+=sign(vspeed)}
        vspeed=max(vspeed,other.vspeed)
    } else y+=vspeed} else y+=vspeed
}

if (vflip==1) {
    if (y-vspeed/2-8*dotkid<=other.y) {
        y=other.y-9+8*dotkid
        vsplatform=max(0,other.vspeed)
        if (other.snap || vspeed>0) vspeed=max(0,other.vspeed/dt/slomo)
        onPlatform=true
        walljumpboost=0
        djump=true
    }
} else {
    if (y-vspeed/2+7*dotkid>=other.bbox_bottom+1) {
        y=other.bbox_bottom+1+8-7*dotkid
        vsplatform=min(0,other.vspeed)
        if (other.snap || vspeed<0) vspeed=min(0,other.vspeed/dt/slomo)
        onPlatform=true
        walljumpboost=0
        djump=true
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

if (place_meeting(x,y,ScreenWrap)) {
    if (hspeed>0 && x>room_width)  {if (!move_player(x-room_width-marginh,y ,1)) x-=hspeed}
    if (vspeed>0 && y>room_height) {if (!move_player(x,y-room_height-marginv,1)) y-=vspeed}
    if (hspeed<0 && x<0)           {if (!move_player(x+room_width+marginh,y ,1)) x-=hspeed}
    if (vspeed<0 && y<0)           {if (!move_player(x,y+room_height+marginv,1)) y-=vspeed}
} else {
    if (global.die_outside_room) kill_player()
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!is_ingame()) instance_destroy()

//fix dotkid sprite on first frame when reloading
if (dotkid) {
    sprite_index=sprDotKid
    mask_index=-1

    oldspr=sprite_index
    newspr=oldspr
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///skin draw
script_execute(skin,"draw")

if (global.debug_god) draw_sprite_ext(sprBow,1,floor(bowx),floor(bowy+abs(lengthdir_y(2,sprite_angle))*vflip+(vflip==-1)),facing,vflip,drawangle,image_blend,image_alpha)
if (global.debug_jump) draw_sprite_ext(sprBow,2,floor(bowx),floor(bowy+abs(lengthdir_y(2,sprite_angle))*vflip+(vflip==-1)),facing,vflip,drawangle,image_blend,image_alpha)

if (global.debug_hitbox) {
    draw_sprite_ext(mask_index,0,round(x),round(y),image_xscale,image_yscale,image_angle,image_blend,image_alpha)
}
