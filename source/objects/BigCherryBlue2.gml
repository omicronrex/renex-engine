#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=1/15*dt
alarm[0]=60/dt
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var a,i,dir;

dir=point_direction(x,y,Player.x,Player.y)

for (i=1;i<=8;i+=1;) {
    a=instance_create(x,y,BigCherrySmall2)
    a.speed=3*dt
    a.direction=dir
    dir+=360/8
}

instance_destroy()
