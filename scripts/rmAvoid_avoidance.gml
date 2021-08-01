song="ddptruelastboss"

bpm=100
sig=4.1

starttime=0

if (wait_verse(3)) {
    if (wait_beat(0.0) || wait_beat(0.5)) {
        repeat (100) avoid_bullet("",400,256,"cherry",270+random_range(-90,90),random_range(0.1,1))
        //camera_set(Player.x,Player.y,4,45)
    }
} else {
    if (wait_beat(0.0)) {
        avoid_bullet("",400,256,"cherry",0,8)
    }
    if (wait_beat(0.25)) {
        avoid_bullet("",400,256,"cherry",90,8)
    }
    if (wait_beat(0.50)) {
        avoid_bullet("",400,256,"cherry",180,8)
    }
    if (wait_beat(0.75)) {
        avoid_bullet("",400,256,"cherry",270,8)
    }
}
