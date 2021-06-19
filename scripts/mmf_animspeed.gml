///mmf_animspeed(val):speed
///mmf_animspeed(val,val2):speed
//multimedia fusion animation speed converter

if (argument_count==2)
    return lerp(argument0,argument[1],speed/(250/8))/100

return argument0/100
