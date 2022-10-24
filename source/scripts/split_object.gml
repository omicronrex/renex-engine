///split_object(count,speed,object,aimed,selfdestruct)
//common tool used by old engines

var count,spd,obj,aimed,selfdes;

count=argument0
spd=argument1
obj=argument2
aimed=argument3
selfdes=argument4

var dir;

if (aimed) dir=point_direction(x,y,Player.x,Player.y)
else dir=random(360)

repeat (count) {
    instance_create_moving(x,y,obj,spd,dir)
    dir+=360/count
}

if (selfdes) instance_destroy()
