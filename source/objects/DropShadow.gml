#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Parameters
color=$C0C0C0 //color to draw (can be any color, but it's recommended to stick to grayscale
x_spacing=3 //offset in the x axis (can be set to negative)
y_spacing=3 //offset in the y axis (can be set to negative)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field depth: number
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//we temporarily draw in 3d mode to fix the alpha with the blend mode
d3d_start()
d3d_set_fog(1,color,0,0)
draw_set_blend_mode_ext(bm_dest_color,bm_zero)

//copy this code block and change the object name to add objects to the drop shadow effect
with (PlayerKiller) if (visible) {
    draw_sprite_ext(sprite_index,image_index,x+other.x_spacing,y+other.y_spacing,image_xscale,image_yscale,image_angle,c_white,1)
}

with (Warp) if (visible) {
    draw_sprite_ext(sprite_index,image_index,x+other.x_spacing,y+other.y_spacing,image_xscale,image_yscale,image_angle,c_white,1)
}

with (BreakBlock) if (visible) {
    draw_sprite_ext(sprite_index,image_index,x+other.x_spacing,y+other.y_spacing,image_xscale,image_yscale,image_angle,c_white,1)
}

with (FakeBlock) if (visible) {
    draw_sprite_ext(sprite_index,image_index,x+other.x_spacing,y+other.y_spacing,image_xscale,image_yscale,image_angle,c_white,1)
}

with (SavePointParent) if (visible) {
    draw_sprite_ext(sprite_index,image_index,x+other.x_spacing,y+other.y_spacing,image_xscale,image_yscale,image_angle,c_white,1)
}

with (Bullet) if (visible) {
    draw_sprite_ext(sprite_index,image_index,x+other.x_spacing,y+other.y_spacing,image_xscale,image_yscale,image_angle,c_white,1)
}

//blocks are drawn a little differently to account for laddertop platformss
with (Block) if (sprite_index!=-1 && sprite_index!=sprHashigo_tate) {
    draw_sprite_ext(sprite_index,image_index,x+other.x_spacing,y+other.y_spacing,image_xscale,image_yscale,image_angle,c_white,1)
}

//player is also drawn differently to prevent flickering/delay
with (Player) if (!dead) {
    player_update_sprite_coords()
    var dy,xs,ys;
    dy=floor(drawy+abs(lengthdir_y(2,drawangle))*vflip+(vflip==-1))
    xs=abs(image_xscale)*facing
    ys=abs(image_yscale)*vflip
    if (settings("anim")) draw_sprite_ext(drawspr,floor(drawframe),floor(drawx+(image_xscale<0)+other.x_spacing),dy+other.y_spacing,xs,ys,drawangle,image_blend,image_alpha)
    else draw_sprite_ext(drawspr,floor(drawframe),floor(drawx+other.x_spacing),dy+other.y_spacing,xs,ys,drawangle,image_blend,image_alpha)
}

//reset back to normal
draw_set_blend_mode(bm_normal)
d3d_set_fog(0,0,0,0)
d3d_end()
