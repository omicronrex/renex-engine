//snap-in for sprite interpolation
//i won't judge, some people like their pixels smeared all over the wall.

switch (argument0) {
    case opt_begin:{

    }break
    case opt_step:{
        if (global.key_pressed[key_jump] || global.key_pressed[key_left] || global.key_pressed[key_right]) {
            //option ticked/changed
            sound_play("sndDJump")
            settings("interpolation",!settings("interpolation"))
        }
        angle+=1
    }break
    case opt_text: {
        return "Sprite Filter"
    }break
    case opt_value: {
        return pick(settings("interpolation"),"Crisp","Blurry")
    }break
    case opt_end:{
        angle=0
    }break
}
