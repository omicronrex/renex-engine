if (instance_number(Bullet)<4) {
    i=instance_create(x,y-2*vflip,Bullet)
    i.owner=id

    i.hspeed=facing*16*dt
    i.direction+=sprite_angle

    sound_play_auto("sndShoot")

    trigger_broadcast(tr_playershoot)
}
