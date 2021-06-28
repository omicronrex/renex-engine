if (argument0=="mask") {
    if (vflip==-1) {
        if (global.use_original_mask) mask_index=sprMaskPlayerFlip
        else mask_index=sprMaskNeedleFlip
    } else {
        if (global.use_original_mask) mask_index=sprMaskPlayer
        else mask_index=sprMaskNeedle
    }
}

if (argument0=="step") {
    if (ladder) {
        if (hspeed!=0) {
            sprite_index=sprPlayerLadderLR
            image_speed=0.2
        } else if (vspeed!=0) {
            sprite_index=sprPlayerLadderUD
            image_speed=0.2
        } else {
            sprite_index=sprPlayerBack
            image_speed=0.1
        }
    } else if (hang) {
        sprite_index=sprPlayerSliding
        image_speed=0.5
    } else if (!onPlatform) {
        if (vspeed*vflip<-0.05) {
            sprite_index=sprPlayerJump
            image_speed=0
            image_index+=0.5
            if (!global.use_original_animations) image_index=max(2,image_index)
            if (image_index>=4) image_index-=2
        }
        if (vspeed*vflip>0.05) {
            sprite_index=sprPlayerFall
            image_speed=0.5
        }
    } else if (h!=0) {
        if (global.use_original_animations) {
            sprite_index=sprPlayerRunning
            image_speed=mmf_animspeed(70,80)
        } else {
            sprite_index=sprPlayerRunningOld
            image_speed=0.5
        }
    } else {
        sprite_index=sprPlayerIdle
        image_speed=0.2
    }

    sprite_angle=inch(sprite_angle,angle,9)

    if (dot_hitbox) image_blend=$808080
    else image_blend=$ffffff
}

if (argument0=="draw") {
    if (dotkid) {
        draw_sprite_ext(oldspr,0,floor(drawx),floor(drawy),1,vflip,0,image_blend,image_alpha)
        draw_circle_color(floor(x),floor(y),48,0,$ff,1)
    } else {
        draw_sprite_ext(oldspr,floor(oldfr),floor(drawx),floor(drawy+abs(lengthdir_y(2,drawangle))*vflip+(vflip==-1)),image_xscale,vflip,drawangle,image_blend,image_alpha)
    }

    if (bow) {
        draw_sprite_ext(sprBow,0,floor(bowx),floor(bowy+abs(lengthdir_y(2,drawangle))*vflip+(vflip==-1)),facing,vflip,drawangle,image_blend,image_alpha)
    }

    if (dot_hitbox) {
        draw_sprite(sprWhiteDot,0,floor(drawx),floor(drawy))
    }
}
