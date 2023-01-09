///player_land(platform)
//called when the player lands on the floor or on a platform

var landed_on_platform;landed_on_platform=argument0

if (!landed_on_platform) vspeed=0

walljumpboost=0
djump=1
onGround=true
coyoteTime=global.coyote_time

if (onfire) kill_player()

with (JumpRefresher) active=1

//jump buffering checks
if (jump_timer && key[key_jump]) {
    player_jump()
    //this correction is necessary to avoid making 4.5s too easy
    vspeed+=gravity
}
