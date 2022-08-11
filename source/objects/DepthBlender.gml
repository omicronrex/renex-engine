#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
depth=noone
blend_mode=bm_normal
blend_mode_ext_source=noone
blend_mode_ext_dest=noone

use_ext=0
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field depth: number
//field blend_mode: enum(bm_normal,bm_add,bm_subtract,bm_max)
//field blend_mode_ext_source: enum(bm_zero,bm_one,bm_src_color,bm_inv_src_color,bm_src_alpha,bm_inv_src_alpha,bm_dest_alpha,bm_inv_dest_alpha,bm_dest_color,bm_inv_dest_color,bm_src_alpha_sat)
//field blend_mode_ext_dest: enum(bm_zero,bm_one,bm_src_color,bm_inv_src_color,bm_src_alpha,bm_inv_src_alpha,bm_dest_alpha,bm_inv_dest_alpha,bm_dest_color,bm_inv_dest_color,bm_src_alpha_sat)

if (depth==noone) {
    show_error("DepthBlender at ("+string(x)+","+string(y)+") doesn't have a depth set in the room editor.",0)
    instance_destroy()
    exit
}

if (blend_mode_ext_source!=noone && blend_mode_ext_dest!=noone) {
    use_ext=1
} else if (blend_mode_ext_source!=noone || blend_mode_ext_dest!=noone) {
    show_error("DepthBlender at depth "+string(depth)+" has an incorrect set of blend mode parameters.",0)
    instance_destroy()
}

var check;check=0
if (use_ext) {
    if (blend_mode_ext_source!=bm_src_alpha || blend_mode_ext_dest!=bm_inv_src_alpha) check=1
} else {
    if (blend_mode!=bm_normal) check=1
}
if (check) with (object_index) if (depth<other.depth) {
    if (use_ext) {
        if (blend_mode_ext_source==bm_src_alpha && blend_mode_ext_dest==bm_inv_src_alpha) {check=0 break}
    } else {
        if (blend_mode==bm_normal) {check=0 break}
    }
}

if (check) {
    show_error("DepthBlender at depth "+string(depth)+" does not have a companion reset at a lower depth than itself. This causes graphical corruption.",0)
    instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=set blend mode at depth
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (use_ext) draw_set_blend_mode_ext(blend_mode_ext_source,blend_mode_ext_dest)
else draw_set_blend_mode(blend_mode)
