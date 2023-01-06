///emit_prop_blood(amount)
//blood for non-player objects like dumb bugz and yoshi
var i;

repeat (argument0) {
    i=instance_create(x,y,PropBlood)
    i.direction=irandom(35)*10
    i.speed=random(8)*dt
    i.gravity=(0.2+random(0.2))*dt*dt
    if (irandom(1)) {
        i.hspeed+=hspeed
        i.vspeed+=vspeed
    }
}
