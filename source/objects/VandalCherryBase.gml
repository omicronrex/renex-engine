#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
color=$ff00ff
collected=0
uncollectable=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!collected) {
    if (instance_place(x,y,Player) && !uncollectable) {
        collected=1
        with (Player) cherried=1
        with (VandalCherryBase) uncollectable=1
        x=Player.x
        y=Player.y
    }
} else {
    x=Player.x
    y=Player.y
    if (global.key_pressed[key_shoot]) {
        instance_destroy_id(Bullet)
        event_user(0)
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///special cherry functionality goes here
//if you want to make your own vandal cherry
//don't forget to do 'with (VandalCherryBase) uncollectable=0'
//and use the cherried variable if you need to
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
