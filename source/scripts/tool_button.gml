///draw_tool_button(x,y,w,h,down_variable,label,color,type):clicked
var c1,c2,c3,c4,low,mid,down,inside,clicked;

clicked=false

low=merge_color(argument6,0,0.5)
mid=merge_color(argument6,$ffffff,0.25)

if (is_string(argument4)) {
    //windows button logic to make the tools more compact
    //returns whether this button was clicked

    down=variable_local_get(argument4)

    inside=point_in_rectangle(mouse_x,mouse_y,argument0,argument1,argument0+argument2,argument1+argument3)

    if (inside) {
        if (down=-1) down=1
        if (mouse_check_button_pressed(mb_left)) down=true
        else if (!mouse_check_button(mb_left)) {
            if (down) clicked=true
            down=0
        }
    } else {
        if (down) down=-1
    }
    variable_local_set(argument4,down)
    down=!!down
} else down=argument4

if (down) {
    c1=$ffffff
    c2=0
    c3=mid
    c4=low
} else {
    c1=0
    c2=$ffffff
    c3=low
    c4=mid
}

draw_rect(argument0,argument1,argument2,argument3,0)

draw_rect(argument0+1,argument1+1,argument2-2,argument3-2,c1)
draw_rect(argument0+1,argument1+1,argument2-3,argument3-3,c2)
draw_rect(argument0+2,argument1+2,argument2-4,argument3-4,c3)
draw_rect(argument0+2,argument1+2,argument2-5,argument3-5,c4)
draw_rect(argument0+3,argument1+3,argument2-6,argument3-6,argument6)

draw_set_font(pick(argument7,fntTool,fntMarlett,fntTool))

draw_set_color(0)
if (argument7==2) {
    draw_set2(0,1)
    draw_text(argument0+4,argument1+argument3 div 2+down,argument5)
} else {
    draw_set2(1,1)
    draw_text(argument0+argument2 div 2+down,argument1+argument3 div 2+down,argument5)
}
draw_reset()

return clicked
