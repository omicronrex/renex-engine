if (World.doVsync && !settings("vsync")) {
    //if vsync is off but the game speed matches the display refresh rate,
    //vsync for about half a second to improve frame pacing
    set_synchronization(1)
    World.alarm[0]=room_speed/2
}
