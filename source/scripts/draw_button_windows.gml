///draw_button_windows(x,y,w,h,down,label,color,type)
var c1,c2,c3,c4,low,mid;

low=merge_color(argument6,0,0.5)
mid=merge_color(argument6,$ffffff,0.25)

if (argument4) {
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

draw_set_font(pick(argument7,fntTool,fntMarlett))
if (argument7==2) draw_sprite(sprWindowsButtonActions,argument5,argument0+argument2 div 2+argument4,argument1+argument3 div 2+argument4)
else {
    draw_set2(1,1)
    draw_set_color(0)
    draw_text(argument0+argument2 div 2+argument4,argument1+argument3 div 2+argument4,argument5)
    draw_reset()
}
