if (!object_is_child_of(Player)) with (Player) kill_player()
else if (!dead) {
    if (room==global.difficulty_room) {
        if (global.diffroom_instantrestart) {
            Player.dead=1
            room_restart()
            exit
        }
    }

    if (global.debug_god) {
        if (!flashing) {
            flashing=room_speed
            sound_play_auto("sndBossHit")
            deathlist[1+deathlist[0]*2]=x
            deathlist[2+deathlist[0]*2]=y
            deathlist[0]+=1
        }
    } else {
        if (instance_exists(HPMode)) {
            if (!flashing) {
                HPMode.hp-=1
                flashing=HPMode.iframes
                sound_play_auto(HPMode.sound)
                emit_blood(10*settings("blood"))
            }
            if (HPMode.hp>0) exit
        }

        if (instance_exists(HitCount)) {
            if (!flashing) {
                HitCount.hits+=1
                flashing=HitCount.iframes
                sound_play_auto(HitCount.sound)
            }
        } else {
            if (global.gameover_music==0) {
                //jingle option
                if (global.restarting_music) sound_stop_music()
                else sound_fade_music(0,0,1)
                sound_play("m-r-tight")
            } else if (global.gameover_music==1) {
                //fade option
                sound_fade_music(0,100,1)
            } else if (global.gameover_music==2) {
                //pause option
                sound_fade_music(0,0,1)
            } else if (global.gameover_music==3) {
                //this is the "do nothing" option
            } else if (global.gameover_music==4) {
                //slowdown
                World.slowing=1
            }

            drop_items()

            sound_play_auto("sndDeath")

            instance_create(x,y,BloodEmitter)
            instance_create(view_xcenter,view_ycenter,GameOver)

            with (FireballCherry) if (active) instance_destroy()

            Player.dead=true

            savedatap("deaths",savedatap("deaths")+1)
        }
    }
}
