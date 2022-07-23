#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spike_down = noone
spike_right = noone
spike_left = noone
spike_up = noone

fruit = noone

blend = $ffffff
alpha = 1
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
This object can skin blocks and killers in a room.

Creation code parameters (defaults are used for any omitted parameters)

spike_x = spike sprites to use
fruit = cherry sprite to use
blend = blend color
alpha = alpha transparency

Place one of the desired block tiles underneath this object, and
it'll be automatically copied to all Block objects in the room.

An example is provided in rmExtra.
*/


var tile,l,t,w,h,xs,ys,tb,ta,td,bg,u,v;

//field spike_down: sprite
//field spike_right: sprite
//field spike_left: sprite
//field spike_up: sprite
//field fruit: sprite
//field blend: color
//field alpha: number(0,1)

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

if (spike_down!=noone) with (SpikeD) {sprite_index=other.spike_down image_blend=other.blend image_alpha=other.alpha}
if (spike_left!=noone) with (SpikeL) {sprite_index=other.spike_left image_blend=other.blend image_alpha=other.alpha}
if (spike_right!=noone) with (SpikeR) {sprite_index=other.spike_right image_blend=other.blend image_alpha=other.alpha}
if (spike_up!=noone) with (SpikeU) {sprite_index=other.spike_up image_blend=other.blend image_alpha=other.alpha}

if (fruit!=noone) with (Cherry) {sprite_index=other.fruit image_blend=other.blend image_alpha=other.alpha}
