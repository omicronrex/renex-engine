if (!hang) {
    if (place_meeting(x,y+vflip,Block) || onPlatform || place_meeting(x,y+vflip,Water1) || place_meeting(x,y+vflip,PlatformWater) || ladderjump) {
        //floor jump
        vspeed=-jump*vflip
        if (global.use_momentum_values) {
            with (instance_place(x,y+vflip,Platform)) other.hspeed+=hspeed
        }
        sound_play_slomo("sndJump")
        djump=1
        image_index=0
        coyoteTime=0
        jump_timer=0
    } else if (global.debug_jump || (djump<maxjumps || place_meeting(x,y+1*vflip,Water2))) {
        //double jump
        vspeed=-jump2*vflip
        sound_play_slomo("sndDJump")
        if (djump<maxjumps) djump+=1
        image_index=0
        coyoteTime=0
        jump_timer=0
    } else jump_timer=global.jump_buffering
    ladderjump=false
}
