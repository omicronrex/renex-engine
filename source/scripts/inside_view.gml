///inside_view()

if (!global.room_started) return false

//workaround for instances without a sprite
if (bbox_right-bbox_left+bbox_bottom-bbox_top == 0)
return x >= view_xview[0]
    && x < view_xview[0]+view_wview[0]
    && y >= view_yview[0]
    && y < view_yview[0]+view_hview[0]

return bbox_right >= view_xview[0]
    && bbox_left < view_xview[0]+view_wview[0]
    && bbox_bottom >= view_yview[0]
    && bbox_top < view_yview[0]+view_hview[0]
