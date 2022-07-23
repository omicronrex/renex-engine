///scrMakeShapes(x,y,angle,edges,numprojectiles,speed,obj)
///spawns a custom shape
///argument0 -  X
///argument1 -  Y
///argument2 - starting angle
///argument3 - number of edges (3=triangle, 4=square, etc.)
///argument4 - projectile s per edge
///argument5 - speed
///argument6 - projectile to
var i,j,X,Y,Angle,Edges,Num,Speed,Obj,th,xx,yy,ddx,ddy,dx,dy,a;

X    =argument0
Y    =argument1
Angle=argument2
Edges=argument3
Num  =argument4
Speed=argument5
Obj  =argument6

for (i=0;i<Edges;i+=1) {
    xx[i]=dcos(Angle+360*i/Edges)
    yy[i]=dsin(Angle+360*i/Edges)
}

for (i=0;i<Edges;i+=1) {
    ddx=xx[(i+1) mod Edges]-xx[i]
    ddy=yy[(i+1) mod Edges]-yy[i]
    for (j=0;j<Num;j+=1) {
        dx=xx[i]+ddx*j/Num
        dy=yy[i]+ddy*j/Num
        a=instance_create(X+dx,Y+dy,Obj)
        a.hspeed=dx*Speed
        a.vspeed=dy*Speed
    }
}
