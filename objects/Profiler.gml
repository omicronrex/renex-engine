#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
str=""
len=150

i=0 repeat (len) {cpu[i]=0 ram[i]=0 fpsf[i]=0 i+=1}

timedraw=0
ready=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time6=get_timer()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time8=get_timer()
#define Keyboard_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time4=get_timer()
#define Keyboard_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time4=get_timer()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time9=get_timer()

/*
time0: early begin step
time4: keyboard
time6: step
time7: early end step
time8: end step
time9: animation end
*/

if (ready) {
    total=(time9-time0-timedraw)/30

    a="$"
    if (total)
        str="begin step: "+string_repeat(a,(time4-time0)/total)+"#"+
            "step:       "+string_repeat(a,(time6-time4)/total)+"#"+
            "collision:  "+string_repeat(a,(time7-time6)/total)+"#"+
            "endstep:    "+string_repeat(a,(time8-time7)/total)+"#"+
            "drawing:    "+string_repeat(a,(time9-time8-timedraw)/total)

    if (fps_real) {
        ram_usage=get_ram_usage()

        cpu[len]=cpu_usage
        ram[len]=ram_usage/1024/1024/35.84 //3.5GB ceiling
        fpsf[len]=fps_fast

        i=0 repeat (len) {cpu[i]=cpu[i+1] ram[i]=ram[i+1] fpsf[i]=fpsf[i+1] i+=1}
    }
}
#define Trigger_Draw GUI
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (ready) {
    var time;time=get_timer()
    draw_set_font(fntFileSmall)
    draw_set_valign(2)
    draw_text_outline(40,global.GUIheight-40,str,$ffff)

    j=global.GUIheight-40
    draw_set_color($ff)
    draw_primitive_begin(pr_linelist)
    i=0 repeat (len) {
        k=global.GUIwidth-40-len+i
        draw_vertex(k,j)
        draw_vertex(k,j-cpu[i])
        i+=1
    }
    draw_primitive_end()

    draw_set_color($ff0000)
    draw_primitive_begin(pr_linelist)
    i=0 repeat (len) {
        k=global.GUIwidth-40-len*2+i
        draw_vertex(k,j)
        draw_vertex(k,j-fpsf[i])
        i+=1
    }
    draw_primitive_end()

    draw_set_color($ff00)
    draw_primitive_begin(pr_linelist)
    i=0 repeat (len) {
        k=global.GUIwidth-40-len+i
        draw_vertex(k,j-110)
        draw_vertex(k,j-110-ram[i])
        i+=1
    }
    draw_primitive_end()

    draw_set_color($ffff)
    draw_text(global.GUIwidth-40-len*2+10,j-10,"fps: "+string(fps_fast)+"#real: "+string(fps_real))
    draw_text(global.GUIwidth-40-len+10,j-10,"cpu: "+string(cpu_usage)+"%")
    draw_text(global.GUIwidth-40-len+10,j-120,"ram: "+string(ram_usage/1024/1024)+"MB")
    draw_set_color($ffffff)

    draw_set_valign(0)
    timedraw=time-get_timer()
}
#define Trigger_Profiler Begin Step
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time0=get_timer()
ready=1
#define Trigger_Profiler End Step
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time7=get_timer()
