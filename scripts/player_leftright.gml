var lrtype;
lrtype=settings("l+r behavior")
if (global.leftright_moonwalk) lrtype=lr_last

if (argument0 && argument1) {
    switch (lrtype) {
        case lr_last: {
            if (input_h== 1 || key_pressed[key_right]) input_h= 1
            if (input_h==-1 || key_pressed[key_left ]) input_h=-1
        }break
        case lr_stop : input_h= 0 break
        case lr_left : input_h=-1 break
        case lr_right: input_h= 1 break
    }
} else {
    input_h=argument1-argument0
}
