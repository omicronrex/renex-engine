#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
type="grass"
grid=32
solid_border=false
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
This object can automatically tile whole rooms using simple tilesets.
Example tilesets are provided in the autotile folder.

Note however, that this can be pretty slow if you have thousands of tiles.

When using "clone" mode, place the desired tile underneath the object.
*/

//field type: enum("border","grass","pipes","clone","clone scale") - default grass
//field tileset: background
//field grid - default 32
//field depth - default 1000
//field solid_border: bool - default false

if (persistent) {
    //we are coming from another room
    if (oldroom!=room) {
        d3d_model_destroy(model)
        instance_destroy()
    }
    exit
}

if (type=="clone scale") {
    var tile,l,t,w,h,xs,ys,tb,ta,td,bg,u,v;

    tile=tile_find_anywhere(x,y)
    if (tile!=-1) {
        l=tile_get_left(tile)
        t=tile_get_top(tile)
        w=tile_get_width(tile)
        h=tile_get_height(tile)
        tb=tile_get_blend(tile)
        ta=tile_get_alpha(tile)
        td=tile_get_depth(tile)
        bg=tile_get_background(tile)
        tile_delete(tile)

        with (Block) {
            if (object_index==Block) {
                tile=tile_add(bg,l,t,w,h,bbox_left,bbox_top,td)
                tile_set_scale(tile,(bbox_right+1-bbox_left)/w,(bbox_bottom+1-bbox_top)/h)
                tile_set_blend(tile,tb)
                tile_set_alpha(tile,ta)
            }
        }
    } else show_error("Error autotiling 'clone scale' mode: No tile was found under the autotiler.",0)
    instance_destroy()
} else if (type=="clone") {
    var tile,l,t,w,h,xs,ys,tb,ta,td,bg,u,v;

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
                for (v=bbox_top;v<bbox_bottom;v+=w*xs) for (u=bbox_left;u<bbox_right;u+=h*ys) {
                    tile=tile_add(bg,l,t,w,h,u,v,td)
                    tile_set_scale(tile,xs,ys)
                    tile_set_blend(tile,tb)
                    tile_set_alpha(tile,ta)
                }
            }
        }
    } else show_error("Error autotiling 'clone' mode: No tile was found under the autotiler.",0)
    instance_destroy()
} else {
    model=autotile_type(type,tileset,grid,solid_border)
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (model!=noone) {
    persistent=1
    oldroom=room
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (model!=-1) d3d_model_draw(model,-0.5,-0.5,0,texture)
