//draws your key inventory
var key_count,key,ypos,drawx,drawy,key_sprite,key_text;

draw_set_font(fntFileBig)
draw_set_valign(2)

key_count=ds_map_size(global.keylist)
if (key_count) {
    key=ds_map_find_first(global.keylist)
    ypos=0
    repeat (key_count) {
        key_sprite=object_get_sprite(key)
        key_text="x"+string(ds_map_find_value(global.keylist,key))

        drawx=argument0
        drawy=argument1+ypos

        draw_sprite(key_sprite,0,drawx,drawy)
        draw_text(drawx+32,drawy+32,key_text)

        ypos+=32
        key=ds_map_find_next(global.keylist,key)
    }
}

draw_set_valign(0)
