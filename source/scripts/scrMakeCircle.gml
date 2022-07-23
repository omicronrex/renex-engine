///scrMakeCircle(x,y,angle,numprojectiles,speed,obj)
///spawns a ring of projectiles
///argument0 -  X
///argument1 -  Y
///argument2 - starting angle
///argument3 - number of projectiles to
///argument4 - speed
///argument5 - projectile to
var X,Y,Angle,Num,Speed,Obj,a,i;

X    =argument0
Y    =argument1
Angle=argument2
Num  =argument3
Speed=argument4
Obj  =argument5

for (i=0;i<Num;i+=1) {
    a=instance_create(X,Y,Obj)
    a.speed=Speed
    a.direction=Angle+i*(360/Num)
}
