if (instance_number(Bullet)<4) {
    i=instance_create(x,y-2*vflip,Bullet)
    i.owner=id

    i.hspeed=facing*16*dt*slomo
    i.direction+=sprite_angle

    sound_play_slomo("sndShoot")
}
