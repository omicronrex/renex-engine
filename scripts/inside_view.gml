///inside_view()

//workaround for instances without a sprite
if (bbox_right-bbox_left+bbox_bottom-bbox_top == 0)
return x >= view_xview[0]
    && x < view_xview[0]+global.width
    && y >= view_yview[0]
    && y < view_yview[0]+global.height

return bbox_right >= view_xview[0]
    && bbox_left < view_xview[0]+global.width
    && bbox_bottom >= view_yview[0]
    && bbox_top < view_yview[0]+global.height
