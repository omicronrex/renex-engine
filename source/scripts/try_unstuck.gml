///try_unstuck()
//try to get the player unstuck. returns if success

var i,xp,yp;

xp=x yp=y

i=0 repeat ((360/45)*4) {
    x=xp+lengthdir_x(i div 360,i)
    y=yp+lengthdir_y(i div 360,i)
    if (place_free(x,y)) return 1
i+=45}

x=xp y=yp

return 0
