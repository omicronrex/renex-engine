///autotile_type(type,background,grid,border)
//thanks Patrick for the inspiration!
var type,model,bg,grid,bord,hgrid,u,v,w,h,tilemap,c1,c2,c3,c4,c6,c7,c8,c9,tile;

type=argument0
bg=argument1
grid=argument2
bord=argument3

hgrid=grid/2

if (
    (room_width div grid)>32000
 || (room_height div grid)>32000
 || (room_width div grid)*(room_height div grid)>1000000
) {
    show_error("Error attempting to autotile room "+room_get_name(room)+": The room is too large to fit in an array.",0)
    return noone
}

//initialize model
globalvar autotile_model,autotile_vertcount,autotile_u,autotile_v;

texture=background_get_texture(bg)
autotile_model=d3d_model_create()
d3d_model_primitive_begin(autotile_model,pr_trianglelist)

autotile_vertcount=0
autotile_u=1/(background_get_width(bg)*texture_get_width(texture))
autotile_v=1/(background_get_height(bg)*texture_get_height(texture))

//initialize 2d tilemap
w=room_width div grid+4
h=room_height div grid+4
u=w repeat (u) {
    u-=1
    tilemap[u,h-1]=0
}

//fill tilemap
with (Block) if (object_index==Block && solid && image_angle==0 && bbox_right>0 && bbox_bottom>0 && bbox_left<room_width && bbox_top<room_height) {
    uu=min(sprite_width div grid,(room_width-bbox_left) div grid)
    vv=min(sprite_height div grid,(room_height-bbox_top) div grid)
    u=max(0,bbox_left div grid); repeat (uu) {v=max(0,bbox_top div grid); repeat (vv) {
        tilemap[u+1,v+1]=1
    v+=1}u+=1}
}

if (bord) {
    //solid border
    u=0 v=h-3
    repeat (w) {
        tilemap[u,0]=tilemap[u,1]
        tilemap[u,v]=tilemap[u,v-1]
        u+=1
    }
    u=w-3 v=0
    repeat (h) {
        tilemap[0,v]=tilemap[1,v]
        tilemap[u,v]=tilemap[u-1,v]
        v+=1
    }
}

if (type="grass") {
    //tile grass type
    with (Block) if (object_index==Block && solid && image_angle==0 && bbox_right>0 && bbox_bottom>0 && bbox_left<room_width && bbox_top<room_height) {
        uu=min(sprite_width div grid,(room_width-bbox_left) div grid)
        vv=min(sprite_height div grid,(room_height-bbox_top) div grid)
        u=max(0,bbox_left div grid); repeat (uu) {v=max(0,bbox_top div grid); repeat (vv) {
            c8=tilemap[u+1,v  ]
            autotile(0,grid*c8,grid,grid,u*grid,v*grid)
        v+=1}u+=1}
        if (autotile_vertcount>=30000) {
            d3d_model_primitive_end(autotile_model)
            d3d_model_primitive_begin(autotile_model,pr_trianglelist)
            autotile_vertcount=0
        }
    }
}

if (type="pipes") {
    //unpack tile lookup tables
    var tilex,tiley,tx,ty,i,o;
    tx="0000001000000000"
    ty="0000000001000000"
    o=ord("0")
    i=0 repeat (16) {
        tilex[i]=(ord(string_char_at(tx,i+1))-o)*grid
        tiley[i]=(ord(string_char_at(ty,i+1))-o)*grid
        i+=1
    }

    //tile pipes type
    with (Block) if (object_index==Block && solid && image_angle==0 && bbox_right>0 && bbox_bottom>0 && bbox_left<room_width && bbox_top<room_height) {
        uu=min(sprite_width div grid,(room_width-bbox_left) div grid)
        vv=min(sprite_height div grid,(room_height-bbox_top) div grid)
        u=max(0,bbox_left div grid); repeat (uu) {v=max(0,bbox_top div grid); repeat (vv) {
            c6=tilemap[u+2,v+1]
            c8=tilemap[u+1,v  ]
            c4=tilemap[u  ,v+1]
            c2=tilemap[u+1,v+2]

            tile=c2*8+c4*4+c6*2+c8

            autotile(tilex[tile],tiley[tile],grid,grid,u*grid,v*grid)
        v+=1}u+=1}
        if (autotile_vertcount>=30000) {
            d3d_model_primitive_end(autotile_model)
            d3d_model_primitive_begin(autotile_model,pr_trianglelist)
            autotile_vertcount=0
        }
    }
}


if (type="border") {
    //unpack tile lookup tables
    var tilex,tiley,tx,ty,i,o;
    tx="22221141000013112121242101030101"
    ty="22112211212121210000101100100011"
    o=ord("0")
    i=0 repeat (32) {
        tilex[i]=(ord(string_char_at(tx,i+1))-o)*hgrid
        tiley[i]=(ord(string_char_at(ty,i+1))-o)*hgrid
        i+=1
    }

    //tile border type
    with (Block) if (object_index==Block && solid && image_angle==0 && bbox_right>0 && bbox_bottom>0 && bbox_left<room_width && bbox_top<room_height) {
        uu=min(sprite_width div grid,(room_width-bbox_left) div grid)
        vv=min(sprite_height div grid,(room_height-bbox_top) div grid)
        u=max(0,bbox_left div grid); repeat (uu) {v=max(0,bbox_top div grid); repeat (vv) {
            c6=tilemap[u+2,v+1]
            c9=tilemap[u+2,v  ]
            c8=tilemap[u+1,v  ]
            c7=tilemap[u  ,v  ]
            c4=tilemap[u  ,v+1]
            c1=tilemap[u  ,v+2]
            c2=tilemap[u+1,v+2]
            c3=tilemap[u+2,v+2]

            //bottom right
            tile=c6*4+c2*2+c3
            autotile(tilex[tile],tiley[tile],hgrid,hgrid,u*grid+hgrid,v*grid+hgrid)

            //bottom left
            tile=c4*4+c1*2+c2+8
            autotile(tilex[tile],tiley[tile],hgrid,hgrid,u*grid,v*grid+hgrid)

            //top right
            tile=c8*4+c9*2+c6+16
            autotile(tilex[tile],tiley[tile],hgrid,hgrid,u*grid+hgrid,v*grid)

            //top left
            tile=c7*4+c8*2+c4+24
            autotile(tilex[tile],tiley[tile],hgrid,hgrid,u*grid,v*grid)
        v+=1}u+=1}
        if (autotile_vertcount>=30000) {
            d3d_model_primitive_end(autotile_model)
            d3d_model_primitive_begin(autotile_model,pr_trianglelist)
            autotile_vertcount=0
        }
    }
}

d3d_model_primitive_end(autotile_model)

return autotile_model
