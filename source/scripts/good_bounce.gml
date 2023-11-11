///good_bounce([object])
//simple bounce that will preserve height
//can either bounce on solids or on specific objects

var a;

a=0
if (argument_count>0) {
    if (instance_place(x+hspeed,y,argument[0]))        {x-=hspeed hspeed*=-1 a=1}
    if (instance_place(x,y+vspeed,argument[0]))        {y-=vspeed vspeed*=-1 a=1}
    if (instance_place(x+hspeed,y+vspeed,argument[0])) {x-=hspeed hspeed*=-1 y-=vspeed vspeed*=-1 a=1}
} else {
    if (!place_free(x+hspeed,y))        {x-=hspeed hspeed*=-1 a=1}
    if (!place_free(x,y+vspeed))        {y-=vspeed vspeed*=-1 a=1}
    if (!place_free(x+hspeed,y+vspeed)) {x-=hspeed hspeed*=-1 y-=vspeed vspeed*=-1 a=1}
}

return a
