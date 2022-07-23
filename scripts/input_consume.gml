//called when the player eats the memorized keys
var tmp,l,r;

//consume stored key state
for (i=0;i<key_sizeof;i+=1) {
    key[i]=World.storekey[i]
    key_pressed[i]       =World.storekey_pressed[i]        World.storekey_pressed[i]       =0
    key_released_early[i]=World.storekey_released_early[i] World.storekey_released_early[i]=0
    key_released[i]      =World.storekey_released[i]       World.storekey_released[i]      =0
}

//if the view is upside down, rotate inputs 180
if (view_angle>90 && view_angle<270) {
    tmp=key         [key_left] key         [key_left]=key         [key_right] key         [key_right]=tmp
    tmp=key_pressed [key_left] key_pressed [key_left]=key_pressed [key_right] key_pressed [key_right]=tmp
    tmp=key_released[key_left] key_released[key_left]=key_released[key_right] key_released[key_right]=tmp
    tmp=key         [key_up  ] key         [key_up  ]=key         [key_down ] key         [key_down ]=tmp
    tmp=key_pressed [key_up  ] key_pressed [key_up  ]=key_pressed [key_down ] key_pressed [key_down ]=tmp
    tmp=key_released[key_up  ] key_released[key_up  ]=key_released[key_down ] key_released[key_down ]=tmp
}

if (!cutscene) {
    //solve horizontal input and left+right depending on player choice
    l=(key[key_left ] || key_pressed[key_left ]) && !key_released[key_left]
    r=(key[key_right] || key_pressed[key_right]) && !key_released[key_right]
    if (l && r) {
        switch (lrtype) {
            case lr_last: {
                if (input_h== 1 || key_pressed[key_right]) input_h= 1
                if (input_h==-1 || key_pressed[key_left ]) input_h=-1
                if (!global.leftright_moonwalk) facing=esign(input_h,facing)
            }break
            case lr_stop : {input_h= 0}break
            case lr_left : {input_h=-1 facing=-1}break
            case lr_right: {input_h= 1 facing= 1}break
        }
    } else {
        input_h=r-l
        facing=esign(input_h,facing)
    }

    //solve vertical input (always resolved as type lr_last)
    l=key[key_up   ] || key_pressed[key_up   ]
    r=key[key_down ] || key_pressed[key_down ]
    if (l && r) {
        if (input_v== 1 || key_pressed[key_down ]) input_v= 1
        if (input_v==-1 || key_pressed[key_up   ]) input_v=-1
    } else input_v=r-l
}
