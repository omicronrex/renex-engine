if (vvvvvv) {
    if (place_meeting(x,y+vflip,Block) || onPlatform) {
        //vvvvvv flipping
        vflip*=-1
        vspeed=0
        y+=4*vflip
        if vflip=-1 {sound_play_slomo("sndVFlip1")} else { sound_play_slomo("sndVFlip2")}
        with (SingleJumpSwitchBlock) event_user(0)
        with (SingleJumpSwitchBlockOff) event_user(0)
        with (DoubleJumpSwitchBlock) event_user(0)
        with (DoubleJumpSwitchBlockOff) event_user(0)
    }
} else if (!hang) {
    if (place_meeting(x,y+1*vflip,Block) || onPlatform || place_meeting(x,y+1*vflip,Water1) || place_meeting(x,y+1*vflip,PlatformWater) || place_meeting(x,y+1*vflip,GuyWater) || ladderjump) {
        //floor jump
        vspeed=-jump*vflip
        sound_play_slomo("sndJump")
        djump=1
        image_index=0
        with (SingleJumpSwitchBlock) event_user(0)
        with (SingleJumpSwitchBlockOff) event_user(0)
        with (DoubleJumpSwitchBlock) event_user(0)
        with (DoubleJumpSwitchBlockOff) event_user(0)
    } else if (global.debug_jump || (djump<maxjumps || place_meeting(x,y+1*vflip,Water2)) && !(beamstate&beam_onejump)) {
        //double jump
        vspeed=-jump2*vflip
        sound_play_slomo("sndDJump")
        if (djump<maxjumps) djump+=1
        image_index=0
        with (DoubleJumpSwitchBlock) event_user(0)
        with (DoubleJumpSwitchBlockOff) event_user(0)
    }

    ladderjump=false
}
