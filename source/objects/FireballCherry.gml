#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
color = 255
active=0
image_speed=0
t=25
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

if (active) {
    t-=1
    x+=8*Player.facing
    Player.x=x
    Player.y=y
    if (t<=0) {
        with (Player) {visible=1 vspeed=0}
        frozen=0
        instance_destroy()
        with (VandalCherryBase) uncollectable=0
    }

    if (instance_place(x+hspeed,y,Block)) {
        with (Player) {visible=1 vspeed=0}
        frozen=0
        instance_destroy()
        with (VandalCherryBase) uncollectable=0
    }

    if (instance_place(x+hspeed,y,PlayerKiller)) {
        with (Player) {visible=1 vspeed=0}
        kill_player()
        frozen=0
        instance_destroy()
        with (VandalCherryBase) uncollectable=0
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) {
    active=1
    frozen=1
    sprite_index=sprVandalFireball
    image_speed=1
    image_xscale=Player.facing
    with (Player) visible=0
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) {
    event_inherited()
} else {
    draw_self()
}
