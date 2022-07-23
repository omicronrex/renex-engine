///input_leftright(left,right,leftpressed,rightpressed,leftreleased,rightreleased,old)
var l,r,h;

l=(argument0 || argument2) && !argument4
r=(argument1 || argument3) && !argument5

if (r && l) {
    switch (settings("l+r behavior")) {
        case lr_last: {
            h=argument6
            if (h== 1 || argument3) h= 1
            if (h==-1 || argument2) h=-1
            return h
        }break
        case lr_stop : return  0 break
        case lr_left : return -1 break
        case lr_right: return  1 break
    }
} else {
    return r-l
}
