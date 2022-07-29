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
*/

//field type: enum("border","grass","pipes") - default grass
//field tileset: background
//field grid - default 32
//field depth - default 1000
//field solid_border: bool - default false

model=autotile_type(type,tileset,grid,solid_border)
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (model!=noone) d3d_model_destroy(model)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (model!=-1) d3d_model_draw(model,-0.5,-0.5,0,texture)
