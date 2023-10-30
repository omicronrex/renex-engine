#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Parameters & Instructions
image_speed=0 //don't change this if you're using the default avoidance bullet sprites

active=1 //whether to kill or not
outside_destroy=1 //destroy outside room
angle_direction=1 //rotate the bullet to the direction it's going in
t=0 //general-purpose timer that increments each frame

hue=255 //hue value for color (0-255)
sat=255 //saturation value for color (0-255)
val=255 //brightness value for color (0-255)
addhue=0 //amount to add to hue per frame
addsat=0 //amount to add to sat per frame
addval=0 //amount to add to val per frame

light_colorize=1 //1 = white in the middle, 0 = colored in the middle
sillhouette=0 //only draw a colored sillhouette (good for pure black & white bullets)
color=make_color_hsv(hue,sat,val) //the actual color

//this variable lets you give custom code to this object without duplicating it
//however, if the game starts to lag from this, you might need to do that
tag="example"

//you also still have all the default object variables to work with
//if you use sprAvoidanceBulletSmall or sprAvoidanceBulletBig or sprAvoidanceBulletMedium,
//you can change the sprite by changing the image_index
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t+=1
switch (tag) {
    //example tag (delete if you're making your own code)
    case "example": {
        //set parameters
        sprite_index=sprMoonBullet
        angle_direction=0
        addhue=5
        
        //follow player
        speed=1
        direction=point_direction(x,y,Player.x,Player.y)
        
        //every 5 frames, spawn a bullet
        if (t mod 5==0) {
            var i;
            i=instance_create(x,y,AvoidanceBullet)
            i.addhue=5
            i.hue=irandom(255)
            i.direction=random(360)
            i.speed=5
            i.depth=-20
            i.sprite_index=sprAvoidanceBulletBig
            i.image_index=0
            i.tag="good design" //:^)
        }
    }break //don't forget to add a break to the end!
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (outside_destroy) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (addhue || addsat || addval) {
    hue+=addhue
    sat+=addsat
    val+=addval
}
color=make_color_hsv(hue,sat,val)

if (angle_direction) {
    image_angle=direction
}
if (light_colorize) {
    if (sillhouette) d3d_set_fog(1,color,0,0)
    draw_self()
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,color,image_alpha)
    draw_set_blend_mode(bm_normal)
    d3d_set_fog(0,0,0,0)
} else {
    if (sillhouette) d3d_set_fog(1,color,0,0)
    draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,color,image_alpha)
    d3d_set_fog(0,0,0,0)
}
