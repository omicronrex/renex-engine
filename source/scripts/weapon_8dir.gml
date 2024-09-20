if (instance_number(Bullet)<4) {
    i=instance_create(x,y-2*vflip,Bullet)
    i.owner=id

    if (input_h!=0 || input_v!=0) {
        i.speed=16*dt
        i.direction=point_direction(0,0,input_h,input_v)
    } else {
        i.hspeed=facing*16*dt
        i.direction+=sprite_angle
    }
    sound_play_auto("sndShoot")

    trigger_broadcast(tr_playershoot)
}
