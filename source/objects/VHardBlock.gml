#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
destroyed=0
if (difficulty<1) {destroyed=1 instance_destroy()}

//destroy tile beneath
tile=tile_find_anywhere(x,y)
if (tile && destroyed) {
    tile_delete(tile)
}
