#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=this creates the gray block border
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if the game size is different, move menus over a little bit
var ox;ox=(global.width-800)/2
var oy;oy=(global.height-608)/2

tile_layer_shift(1000,ox,oy)
with (all) {x+=ox y+=oy}

with (FileMenu) dx+=ox

for (u=0;u<global.width;u+=32) {
    tile_add(bgGameMakerBlock,0,0,32,32,u,0,1000)
    if (room=rmOptions) {
        instance_create(u,global.height-32,Block)
    }
}

for (v=32;v<global.height-32;v+=32) {
    tile_add(bgGameMakerBlock,0,0,32,32,0,v,1000)
    tile_add(bgGameMakerBlock,0,0,32,32,global.width-32,v,1000)
    if (room=rmOptions) {
        instance_create(0,v,Block)
    }
}

//split for layering reasons for when the dimensions aren't a multiple of 32
for (u=0;u<global.width;u+=32) {
    tile_add(bgGameMakerBlock,0,0,32,32,u,global.height-32,1000)
}

instance_destroy()
