///player_land(vspeed)
landvspeed=argument0

onPlatform=true
walljumpboost=0
djump=1
coyoteTime=global.coyote_time

if (onfire) kill_player()

if (global.jump_refresher_timer==0) with (JumpRefresher) alarm[0]=1

if (jump_timer && key[key_jump]) {
    player_jump()
    //this correction is necessary to avoid making 4.5s too easy
    vspeed+=gravity
}
