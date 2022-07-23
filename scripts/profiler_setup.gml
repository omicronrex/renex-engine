//create and set up the object used to profile the game
var o;

o=object_add()
global.profiler_manager=o

object_event_add(o,ev_create,0,"
    str='' len=150 timedraw=0 ready=0 i=0
    repeat (len) {cpu[i]=0 ram[i]=0 fpsf[i]=0 i+=1}
")

object_event_add(o,ev_trigger,ev_profilerbegin,"time0=get_timer() ready=1")
object_event_add(o,ev_keyboard,vk_nokey,"time4=get_timer()")
object_event_add(o,ev_keyboard,vk_anykey,"time4=get_timer()")
object_event_add(o,ev_step,ev_step_normal,"time6=get_timer()")
object_event_add(o,ev_trigger,ev_profilerend,"time7=get_timer()")
object_event_add(o,ev_step,ev_step_end,"time8=get_timer()")

object_event_add(o,ev_draw,0,"
    time9=get_timer()

    if (ready) {
        total=(time9-time0-timedraw)/30

        if (total)
            str='begin step: '+string_repeat('$',(time4-time0)/total)+'#'+
                'step:       '+string_repeat('$',(time6-time4)/total)+'#'+
                'collision:  '+string_repeat('$',(time7-time6)/total)+'#'+
                'endstep:    '+string_repeat('$',(time8-time7)/total)+'#'+
                'drawing:    '+string_repeat('$',(time9-time8-timedraw)/total)

        if (fps_real) {
            ram_usage=get_ram_usage()

            cpu[len]=cpu_usage
            ram[len]=ram_usage/1024/1024/35.84 //3.5GB ceiling
            fpsf[len]=fps_fast

            i=0 repeat (len) {cpu[i]=cpu[i+1] ram[i]=ram[i+1] fpsf[i]=fpsf[i+1] i+=1}
        }
    }
")

object_event_add(o,ev_other,ev_user0,"
    if (ready) {
        var time;time=get_timer()
        draw_set_font(fntFileSmall)
        draw_set_valign(2)
        draw_text_outline(40,global.height-40,str,$ffff)

        j=global.height-40
        draw_set_color($ff)
        draw_primitive_begin(pr_linelist)
        i=0 repeat (len) {
            k=global.width-40-len+i
            draw_vertex(k,j)
            draw_vertex(k,j-cpu[i])
            i+=1
        }
        draw_primitive_end()

        draw_set_color($ff0000)
        draw_primitive_begin(pr_linelist)
        i=0 repeat (len) {
            k=global.width-40-len*2+i
            draw_vertex(k,j)
            draw_vertex(k,j-fpsf[i])
            i+=1
        }
        draw_primitive_end()

        draw_set_color($ff00)
        draw_primitive_begin(pr_linelist)
        i=0 repeat (len) {
            k=global.width-40-len+i
            draw_vertex(k,j-110)
            draw_vertex(k,j-110-ram[i])
            i+=1
        }
        draw_primitive_end()

        draw_set_color($ffff)
        draw_text(global.width-40-len*2+10,j-10,'fps: '+string(fps_fast)+'#real: '+string(fps_real))
        draw_text(global.width-40-len+10,j-10,'cpu: '+string(cpu_usage)+'%')
        draw_text(global.width-40-len+10,j-120,'ram: '+string(ram_usage/1024/1024)+'MB')
        draw_set_color($ffffff)

        draw_set_valign(0)
        timedraw=time-get_timer()
    }
")

object_set_parent(o,ActiveParent)
object_set_depth(o,-99999999)
object_set_persistent(o,1)
