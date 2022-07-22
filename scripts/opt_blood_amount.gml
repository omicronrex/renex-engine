//snap-in for blood amount

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_step:{
        if (global.key_pressed[key_jump] || global.key_pressed[key_left] || global.key_pressed[key_right]) {
            //option ticked/changed
            var h; if (global.key_pressed[key_jump]) h=1
            else h=global.key_pressed[key_right]-global.key_pressed[key_left]
            sound_stop("sndDeath")
            sound_play_option("sndDeath")
            settings("blood",modwrap(settings("blood")+h,0,4))
            dead=1
            instance_destroy_id(BloodEmitter)
            instance_destroy_id(Blood)
            instance_destroy_id(GibParticle)
            instance_create(xcursor,ycursor,BloodEmitter)
        }
        if (global.key_pressed[key_restart]) {
            dead=0
            instance_destroy_id(BloodEmitter)
            instance_destroy_id(Blood)
            instance_destroy_id(GibParticle)
            sound_stop("sndDeath")
        }
    }break
    case opt_text: {
        return "Blood Amount"
    }break
    case opt_value: {
        return pick(settings("blood"),"Off","Low","Normal","High")
    }break
    case opt_end:{
        dead=0
        instance_destroy_id(BloodEmitter)
        instance_destroy_id(Blood)
        instance_destroy_id(GibParticle)
        sound_stop("sndDeath")
    }break
}
