//put your loop point/volume balancing data here

//these are examples; the existence checks are here to prevent errors when those files are deleted.

if (sound_exists("ddpboss")) {
    //the loop points are in seconds
    set_loop_point("ddpboss",0.121,70.517)
}

if (sound_exists("m-r-tight")) {
    //volume 0-1
    sound_volume("m-r-tight",0.7)
}
