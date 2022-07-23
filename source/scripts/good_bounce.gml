//simple solid bounce that will preserve height

var a;

a=0
if (!place_free(x+hspeed,y)) {x-=hspeed hspeed*=-1 a=1}
if (!place_free(x,y+vspeed)) {y-=vspeed vspeed*=-1 a=1}
if (!place_free(x+hspeed,y+vspeed)) {x-=hspeed hspeed*=-1 y-=vspeed vspeed*=-1 a=1}

return a
