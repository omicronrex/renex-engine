#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
color=$ff00ff
collected=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!collected) {
    if (instance_place(x,y,Player) && !Player.cherried) {
        collected=1
        with (Player) cherried=1
        x=Player.x
        y=Player.y
    }
} else {
    x=Player.x
    y=Player.y
    if (key_shoot(vi_pressed)) {
        event_user(0)
        instance_destroy_id(Bullet)
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions

// if you want to make your own vandal-type cherry:

// - on your custom cherry, in a user event 0:
//   include an instance_destroy() at the end, and a 'with (Player) cherried=0' somewhere

// - add whatever you need to the player_uncherry() script to reset to normal
//   then call player_uncherry() when you actually reset back
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_set_alpha(0.35)
draw_circle_color(x,y,25,color,0,0)
draw_set_blend_mode(bm_normal)
draw_set_alpha(1)

if (!collected)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,color,1)
