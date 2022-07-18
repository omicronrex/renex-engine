if (event="create") {
    name="Template"
    sur=""

    hp=10

    cutscene=true

    vulnerable=false
    image_speed=0
    exit
}

if (event="draw") {
    draw_self()
    exit
}

if (event="destroy") {
    exit
}

t+=dt

if (state="won") {
    speed=0
    exit
}

//die
if (hp<=0) {
    sound_play("sndDeath")
    instance_destroy()
    exit
}

//first state
if (state="begin") {
    if (once_every(60)) {
        cutscene=false
        vulnerable=true
        play_bg_music("ddpboss",1)
        t=0
        state="active"
    }
}

//checks to get hit
with (instance_place(x,y,Bullet)) with (other) {
    if (vulnerable) {
        vulnerable=false
        flash=50
        image_alpha=0.5
        sound_play("sndBossHit")
        hp-=1
    }
    instance_destroy_other()
}

//flashing
if (flash) {
    flash-=1
    if (!flash) {
        vulnerable=true
        image_alpha=1
    }
}

//attack!
if (state="active") {
    if (once_every(90)) {
        o=instance_create(x,y,Cherry)
        o.speed=3
        o.direction=point_direction(x,y,Player.x,Player.y)
    }
}
