///player_hitceiling()
//called when the player bonks

vspeed=0

// reset gravity to normal from antigrav cherry
if (cherried && baseGrav!=baseGravDefault) {
    baseGrav=baseGravDefault
    cherried=0
}
