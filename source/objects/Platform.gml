#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//you can set those in creation code
path=noone
path_action=path_action_reverse
path_absolute=false

snap=true
phase=false

hdeficit=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var moveplayer;moveplayer=0

if (path_index!=-1 && path_speed!=0) {
    get_path_speed()
    moveplayer=1
} else if (hspeed!=0 || vspeed!=0) {
    if (!phase) {
        if (hspeed!=0) if (!place_free(x+hspeed,y)) hspeed=-hspeed
        if (vspeed!=0) if (!place_free(x,y+vspeed)) vspeed=-vspeed
    }
    moveplayer=1
}

if (moveplayer) {
    //due to player's rounding, it's impossible to move the player only part of a pixel
    //so we store and make use of deficit counters
    var hmove;
    hdeficit+=hspeed
    hmove=round(hdeficit)
    hdeficit-=hmove
    with (Player) if (instance_place(x,y+2*vflip,other.id)) {
        move_player(x+hmove,y+other.vspeed,1)
    }
}
#define Collision_NiseBlock
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=113
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=114
applies_to=self
invert=0
*/
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field path: path
//field speed
//field path_action: enum(path_action_continue,path_action_restart,path_action_reverse,path_action_stop)
//field path_absolute: bool
//field snap: bool
//field phase: bool
//field hspeed
//field vspeed

if (path!=noone) {
    path_start(path,speed,path_action,path_absolute)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index=sprDynamicPlatform && global.platform_9slice) {
    //i feel like renex has better things to do with their time than make an
    //auto platform script that only like, 2 people will use for practical uses

    if (image_xscale==1 && image_yscale==1) {
        draw_self()
    } else {
        //some of this might be hard to read, but it's all written for maximum speed
        var w,h,u,v;
        w=32*image_xscale
        h=16*image_yscale
        if (w<=24 && h<=24) {
            //square
            draw_sprite_ext(sprPlatform9slice,0,x,y,w/16,h/16,image_angle,image_blend,image_alpha)
        } else {
            u=(w-32)/16
            v=(h-32)/16
            texture_set_repeat(1)
            d3d_transform_stack_push()
            d3d_transform_add_rotation_z(image_angle)
            d3d_transform_add_translation(x-0.5,y-0.5,0)
            if (w>24 && h>24) {
                //9slice
                draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(sprPlatform9slice,5))
                    draw_vertex_texture(0,0,0,0)
                    draw_vertex_texture(16,0,1,0)
                    draw_vertex_texture(0,16,0,1)
                    draw_vertex_texture(16,16,1,1)
                draw_primitive_end()
                draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(sprPlatform9slice,6))
                    draw_vertex_texture(16,0,0,0)
                    draw_vertex_texture(w-16,0,u,0)
                    draw_vertex_texture(16,16,0,1)
                    draw_vertex_texture(w-16,16,u,1)
                draw_primitive_end()
                draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(sprPlatform9slice,7))
                    draw_vertex_texture(w-16,0,0,0)
                    draw_vertex_texture(w,0,1,0)
                    draw_vertex_texture(w-16,16,0,1)
                    draw_vertex_texture(w,16,1,1)
                draw_primitive_end()
                draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(sprPlatform9slice,9))
                    draw_vertex_texture(0,16,0,0)
                    draw_vertex_texture(16,16,1,0)
                    draw_vertex_texture(0,h-16,0,v)
                    draw_vertex_texture(16,h-16,1,v)
                draw_primitive_end()
                draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(sprPlatform9slice,10))
                    draw_vertex_texture(16,16,0,0)
                    draw_vertex_texture(w-16,16,u,0)
                    draw_vertex_texture(16,h-16,0,v)
                    draw_vertex_texture(w-16,h-16,u,v)
                draw_primitive_end()
                draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(sprPlatform9slice,11))
                    draw_vertex_texture(w-16,16,0,0)
                    draw_vertex_texture(w,16,1,0)
                    draw_vertex_texture(w-16,h-16,0,v)
                    draw_vertex_texture(w,h-16,1,v)
                draw_primitive_end()
                draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(sprPlatform9slice,13))
                    draw_vertex_texture(0,h-16,0,0)
                    draw_vertex_texture(16,h-16,1,0)
                    draw_vertex_texture(0,h,0,1)
                    draw_vertex_texture(16,h,1,1)
                draw_primitive_end()
                draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(sprPlatform9slice,14))
                    draw_vertex_texture(16,h-16,0,0)
                    draw_vertex_texture(w-16,h-16,u,0)
                    draw_vertex_texture(16,h,0,1)
                    draw_vertex_texture(w-16,h,u,1)
                draw_primitive_end()
                draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(sprPlatform9slice,15))
                    draw_vertex_texture(w-16,h-16,0,0)
                    draw_vertex_texture(w,h-16,1,0)
                    draw_vertex_texture(w-16,h,0,1)
                    draw_vertex_texture(w,h,1,1)
                draw_primitive_end()
            } else if (w>24) {
                //hor slice
                draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(sprPlatform9slice,1))
                    draw_vertex_texture(0,0,0,0)
                    draw_vertex_texture(0,h,0,1)
                    draw_vertex_texture(16,0,1,0)
                    draw_vertex_texture(16,h,1,1)
                draw_primitive_end()
                if (w>32) {
                    draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(sprPlatform9slice,2))
                        draw_vertex_texture(16,0,0,0)
                        draw_vertex_texture(16,h,0,1)
                        draw_vertex_texture(w-16,0,u,0)
                        draw_vertex_texture(w-16,h,u,1)
                    draw_primitive_end()
                }
                draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(sprPlatform9slice,3))
                    draw_vertex_texture(w-16,0,0,0)
                    draw_vertex_texture(w-16,h,0,1)
                    draw_vertex_texture(w,0,1,0)
                    draw_vertex_texture(w,h,1,1)
                draw_primitive_end()
            } else {
                //vert slice
                draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(sprPlatform9slice,4))
                    draw_vertex_texture(0,0,0,0)
                    draw_vertex_texture(w,0,1,0)
                    draw_vertex_texture(0,16,0,1)
                    draw_vertex_texture(w,16,1,1)
                draw_primitive_end()
                if (h>32) {
                    draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(sprPlatform9slice,8))
                        draw_vertex_texture(0,16,0,0)
                        draw_vertex_texture(w,16,1,0)
                        draw_vertex_texture(0,h-16,0,(h-32)/16)
                        draw_vertex_texture(w,h-16,1,(h-32)/16)
                    draw_primitive_end()
                }
                draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(sprPlatform9slice,12))
                    draw_vertex_texture(0,h-16,0,0)
                    draw_vertex_texture(w,h-16,1,0)
                    draw_vertex_texture(0,h,0,1)
                    draw_vertex_texture(w,h,1,1)
                draw_primitive_end()
            }
            d3d_transform_stack_pop()
        }
    }
} else if (sprite_index!=-1) draw_self()
