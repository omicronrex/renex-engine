//Miku avoidance from Yuuutu engine

if (argument0=="create") {

    bpm=220
    beat=4

    mouthx=x+57
    mouthy=y-185
    sound_play_synced("thetacapsule_remake")

    hand1x=x
    hand1y=y

    hand2x=x+120
    hand2y=y
}

if (argument0=="step") {

    //part 1
    wait_timer(14)

    repeat (32) if (wait_timer(4)) {
        split_object(1,6*dt,CherryYellow,1,0)
    }
    repeat (32) if (wait_timer(4)) {
        split_object(1,6*dt,CherryYellow,1,0)
        instance_create_moving(mouthx,mouthy,MikuBounceCherry,2*dt,random(360))
    }

    //part 2
    repeat (50) if (wait_timer(4)) {
        if (choose(0,1)) {
            instance_create_moving(-16,random(608),MikuLeek,2*dt,0)
        } else {
            instance_create_moving(800+16,random(608),MikuLeek,2*dt,180)
        }
    }
    if (wait_timer(28)) {
        with (MikuBounceCherry) {
            instance_create_moving(x,y,CherryMagenta,speed,direction)
            instance_destroy()
        }
    }
    wait_timer(20)

    //part 3
    repeat (30) if (wait_timer(4)) {
        xx=Player.x+random_range(-128,128)
        yy=Player.y+random_range(-128,128)
        instance_create_moving(hand1x,hand1y,CherryYellow,4*dt,point_direction(x,y,xx,yy))
    }

    wait_timer(4)

    repeat (32) if (wait_timer(4)) {
        xx=Player.x+random_range(-128,128)
        yy=Player.y+random_range(-128,128)
        instance_create_moving(hand1x,hand1y,CherryYellow,6*dt,point_direction(x,y,xx,yy))
        instance_create_moving(hand2x,hand2y,CherryYellow,6*dt,point_direction(x,y,xx,yy))
    }
    repeat (21) if (wait_timer(4)) {
        xx=Player.x+random_range(-128,128)
        yy=Player.y+random_range(-128,128)
        instance_create_moving(hand1x,hand1y,CherryYellow,6*dt,point_direction(x,y,xx,yy))
        instance_create_moving(hand2x,hand2y,CherryYellow,6*dt,point_direction(x,y,xx,yy))
        instance_create_moving(mouthx,mouthy,MikuBounceCherry,2*dt,random(360))
    }
    if (wait_timer(32)) {
        with (MikuBounceCherry) {
            instance_create_moving(x,y,CherryGray,10,270)
            instance_destroy()
        }
    }

    //part 4
    wait_timer(4)

    repeat (2) if (wait_timer(4)) {
        instance_create_moving(hand1x,hand1y,MikuBigCherryBlue,6*dt,random_range(135,225))
    }
    repeat (31) if (wait_timer(4)) {
        instance_create_moving(hand1x,hand1y,MikuBigCherryBlue,6*dt,random_range(135,225))
        instance_create_moving(mouthx,mouthy,MikuBounceCherry,2,random(360))
    }
    repeat (23) if (wait_timer(4)) {
        instance_create_moving(hand1x,hand1y,MikuBigCherryBlue,6*dt,random_range(135,225))
    }
    if (wait_timer(8)) {
        with (MikuBounceCherry) {
            instance_create_moving(x,y,CherryMagenta,speed,direction)
            instance_destroy()
        }
    }
    if (wait_timer(32)) {
        with (MikuBounceCherry) {
            instance_create_moving(x,y,CherryGray,10,270)
            instance_destroy()
        }
    }
    if (wait_timer(50)) {
        play_bg_music("",0)
        sound_play("sndBlockChange")
        instance_destroy()
    }
}
