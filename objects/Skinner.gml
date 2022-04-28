#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions

/*
    This object can skin blocks and killers in a room.

    Creation code parameters (defaults are used for any omitted parameters)

    spike = name to append to spike sprites
    fruit = cherry sprite to use
    blend = blend color for spikes
    alpha = alpha transparency for spikes

    Place the desired tile underneath this object, and
    it'll be automatically copied to all Block objects.

    An example is provided in rmExtra.
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spike = ""
fruit = noone
blend = $ffffff
alpha = 1
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var tile,l,t,w,h,xs,ys,tb,ta,td,bg,u,v;

//field spike: string
//field fruit: sprite
//field blend: color
//field alpha

tile=tile_find_anywhere(x,y)
if (tile!=-1) {
    l=tile_get_left(tile)
    t=tile_get_top(tile)
    w=tile_get_width(tile)
    h=tile_get_height(tile)
    xs=tile_get_xscale(tile)
    ys=tile_get_yscale(tile)
    tb=tile_get_blend(tile)
    ta=tile_get_alpha(tile)
    td=tile_get_depth(tile)
    bg=tile_get_background(tile)
    tile_delete(tile)

    with (Block) {
        if (object_index==Block) {
            for (v=bbox_top;v<bbox_bottom;v+=32) for (u=bbox_left;u<bbox_right;u+=32) {
                tile=tile_add(bg,l,t,w,h,u,v,td)
                tile_set_scale(tile,xs,ys)
                tile_set_blend(tile,tb)
                tile_set_alpha(tile,ta)
            }
        }
    }
}

if (spike!="") {
    execute_string("
        s_d=sprSpikeDown"+spike+"
        s_l=sprSpikeLeft"+spike+"
        s_r=sprSpikeRight"+spike+"
        s_u=sprSpikeUp"+spike+"
    ")

    with (SpikeD) {sprite_index=other.s_d image_blend=other.blend image_alpha=other.alpha}
    with (SpikeL) {sprite_index=other.s_l image_blend=other.blend image_alpha=other.alpha}
    with (SpikeR) {sprite_index=other.s_r image_blend=other.blend image_alpha=other.alpha}
    with (SpikeU) {sprite_index=other.s_u image_blend=other.blend image_alpha=other.alpha}
}

if (fruit!=noone) {
    with (Cherry) sprite_index=other.fruit
}
