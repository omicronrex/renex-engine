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
t=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

if (active) {
    t+=1
    x+=8*image_xscale
    move_player_object(x,y,0,Player)

    if (t>=25)
        player_uncherry("fireball")

    if (instance_place(x+hspeed,y,Block))
        player_uncherry("fireball")

    if (instance_place(x+hspeed,y,PlayerKiller))
       {player_uncherry("fireball") kill_player()}
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) {
    with (Player) {
        cherried_fireball=1
        cherried=0
    }
    active=1
    frozen=1
    lock_controls()
    sprite_index=sprVandalFireball
    image_speed=1
    image_xscale=Player.facing
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
