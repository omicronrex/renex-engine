with (Player) if (!dead) {
    if (global.debug_god) {
        if (!flashing) {
            flashing=room_speed
            sound_play("sndBossHit")
            deathlist[1+deathlist[0]*2]=x
            deathlist[2+deathlist[0]*2]=y
            deathlist[0]+=1
        }
    } else {
        if (instance_exists(HPMode)) {
            if (!flashing) {
                HPMode.hp-=1
                flashing=HPMode.iframes
                sound_play(HPMode.sound)
                emit_blood(10*settings("blood"))
            }
            if (HPMode.hp>0) exit
        }

        if (instance_exists(HitCount)) {
            if (!flashing) {
                HitCount.hits+=1
                flashing=HitCount.iframes
                sound_play(HitCount.sound)
            }
        } else {
            if (global.gameover_music==0) {
                sound_play("m-r-tight")
            } else if (global.gameover_music==1) {
                World.fading=1
            } else if (global.gameover_music==2) {
                sound_kind_pause(1)
            }

            drop_items()

            sound_play_slomo("sndDeath")

            instance_create(x,y,BloodEmitter)
            instance_create(view_xcenter,view_ycenter,GameOver)

            Player.dead=true

            savedata("deaths",savedata("deaths")+1)
        }
    }
}
