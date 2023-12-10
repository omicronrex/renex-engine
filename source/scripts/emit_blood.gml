///emit_blood(amount)
var i,yes,num;
num=argument0

yes=instance_exists(Player)

if (global.blood_clusters) {
    num=round(num/2)
    while (num>0) {
        i=instance_create(x,y,Blood)
        if (num mod 2==0) {
            i.sprite_index=sprBloodCluster
            i.anglechange=1
        }
        i.direction=irandom(35)*10
        i.speed=random(8)*dt
        i.gravity=(0.2+random(0.2))*dt*dt
        if (yes) {
            i.vflip=Player.vflip
            i.gravity*=sign(Player.baseGrav*Player.vflip)
        }
        if (irandom(1)) {
            i.hspeed+=hspeed
            i.vspeed+=vspeed
        }
        num-=1
    }
} else {
    repeat (num) {
        i=instance_create(x,y,Blood)
        i.direction=irandom(35)*10
        i.speed=random(8)*dt
        i.gravity=(0.2+random(0.2))*dt*dt
        if (yes) {
            i.vflip=Player.vflip
            i.gravity*=sign(Player.baseGrav*Player.vflip)
        }
        if (irandom(1)) {
            i.hspeed+=hspeed
            i.vspeed+=vspeed
        }
    }
}
