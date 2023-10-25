#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
water_type="Water2"
water_col=$ff9f3f
alp=145/255
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
    This object can be set to any sprite, and will function as water.
    The room editor preview is not indicative of the variable states.
*/
//field sprite_index: sprite
//field image_speed: number
//field depth: number
//field water_type: enum("Water1","Water2","Water3","CatharsisWater")

switch (water_type) {
    case "Water1": water_col=$ff6142 alp=145/255 break;
    case "Water2": water_col=$ff9f3f alp=145/255 break;
    case "Water3": water_col=$e8e866 alp=145/255 break;
    case "CatharsisWater": water_col=0 alp=50/255 break;
}

/*preview
    d3d_set_fog(1,$ff9400,0,0)
    draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,c_white,1)
    d3d_set_fog(0,0,0,0)
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_set_fog(1,water_col,0,0)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,alp)
d3d_set_fog(0,0,0,0)
