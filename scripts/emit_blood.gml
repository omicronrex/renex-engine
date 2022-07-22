///emit_blood(amount)
var i;

repeat (argument0) {
    i=instance_create(x,y,Blood)
    i.direction=irandom(35)*10
    i.speed=random(8)*dt
    i.gravity=(0.2+random(0.2))*dt*dt
    if (playeris) i.gravity*=sign(Player.gravity)
    if (irandom(1)) {
        i.hspeed+=hspeed
        i.vspeed+=vspeed
    }
}
