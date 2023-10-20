///emit_prop_blood(amount)
//blood for non-player objects like dumb bugz and yoshi
var i,num;
num=argument0

if (global.blood_clusters) {
    num=round(num/2)
    while (num>0) {
        i=instance_create(x,y,PropBlood)
        if (num mod 2==0) {
            i.sprite_index=sprBloodCluster
            i.anglechange=1
        }
        i.direction=irandom(35)*10
        i.speed=random(8)*dt
        i.gravity=(0.2+random(0.2))*dt*dt
        if (irandom(1)) {
            i.hspeed+=hspeed
            i.vspeed+=vspeed
        }
        num-=1
    }
} else {
    repeat (num) {
        i=instance_create(x,y,PropBlood)
        i.direction=irandom(35)*10
        i.speed=random(8)*dt
        i.gravity=(0.2+random(0.2))*dt*dt
        if (irandom(1)) {
            i.hspeed+=hspeed
            i.vspeed+=vspeed
        }
    }
}
