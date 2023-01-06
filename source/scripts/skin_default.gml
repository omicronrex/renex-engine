var fixspr,dy,xs,ys;

fixspr=settings("anim")

if (argument0=="mask") {
    if (vflip==-1) {
        if (global.use_original_mask || (global.valign05_vdiet && frac(y)==0.5)) mask_index=sprMaskPlayerFlip
        else mask_index=sprMaskNeedleFlip
    } else {
        if (global.use_original_mask || (global.valign05_vdiet && frac(y)==0.5)) mask_index=sprMaskPlayer
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
        if (fixspr) sprite_index=sprPlayerSliding
        else sprite_index=sprPlayerSlidingOld
        image_speed=0.5
    } else if (!onGround) {
        if (vspeed*vflip<-0.05) {
            if (fixspr) {
                sprite_index=sprPlayerJump
                image_speed=0
                image_index+=0.5
                if (image_index>=4) image_index-=2
            } else {
                sprite_index=sprPlayerJumpOld
                image_speed=0.5
            }
        }
        if (vspeed*vflip>0.05) {
            if (fixspr) sprite_index=sprPlayerFall
            else sprite_index=sprPlayerFallOld
            image_speed=0.5
        }
    } else if (input_h!=0) {
        if (fixspr) {
            sprite_index=sprPlayerRunning
            image_speed=mmf_animspeed(70,80)
        } else {
            sprite_index=sprPlayerRunningOld
            image_speed=0.5
        }
    } else {
        if (fixspr) sprite_index=sprPlayerIdle
        else sprite_index=sprPlayerIdleOld
        image_speed=0.2
    }

    if (global.angle_slopes) sprite_angle+=angle_difference(sprite_angle,slope_angle)*0.4

    if (dot_hitbox) image_blend=$808080
    else image_blend=$ffffff
}

if (argument0=="draw") {
    //slope angle offset
    dy=floor(drawy+abs(lengthdir_y(2,drawangle))*vflip+(vflip==-1))
    xs=abs(image_xscale)*facing
    ys=abs(image_yscale)*vflip

    if (fixspr) draw_sprite_ext(drawspr,floor(drawframe),floor(drawx+(image_xscale<0)),dy,xs,ys,drawangle,image_blend,image_alpha)
    else draw_sprite_ext(drawspr,floor(drawframe),floor(drawx),dy,xs,ys,drawangle,image_blend,image_alpha)

    if (bow) {
        dy=floor(bowy+abs(lengthdir_y(2,drawangle))*vflip+(vflip==-1))
        if ((drawspr=sprPlayerIdle || drawspr=sprPlayerIdleOld) && floor(drawframe)==3) dy+=vflip //bobbing
        draw_sprite_ext(sprBow,0,floor(bowx),dy,xs,ys,drawangle,image_blend,image_alpha)
    }

    if (dot_hitbox) {
        draw_sprite(sprWhiteDot,0,floor(drawx),floor(drawy))
    }
}
