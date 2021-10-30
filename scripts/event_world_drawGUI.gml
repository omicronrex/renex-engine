//minimize button
if (minalpha>0) {
    if (minclick=3) draw_sprite_ext(sprCapButtons,0,global.width-90,0,1,1,0,merge_color(mincolor1,$ffffff,0.25),minalpha)
    else draw_sprite_ext(sprCapButtons,0,global.width-90,0,1,1,0,pick(minhover=3,mincolor1,merge_color(mincolor1,$ffffff,0.125)),minalpha)
    draw_sprite_ext(sprCapButtons,1,global.width-90,0,1,1,0,mincolor2,minalpha)
    if (minclick=2) draw_sprite_ext(sprCapButtons,0,global.width-45,0,1,1,0,merge_color(mincolor1,$ffffff,0.25),minalpha)
    else draw_sprite_ext(sprCapButtons,0,global.width-45,0,1,1,0,pick(minhover=2,mincolor1,merge_color(mincolor1,$ffffff,0.125)),minalpha)
    draw_sprite_ext(sprCapButtons,3+settings("fullscreen"),global.width-45,0,1,1,0,mincolor2,minalpha)
    if (minclick=1) draw_sprite_ext(sprCapButtons,0,global.width,0,1,1,0,merge_color(mincolor1,$2311e8,0.5),minalpha)
    else draw_sprite_ext(sprCapButtons,0,global.width,0,1,1,0,pick(minhover=1,mincolor1,$2311e8),minalpha)
    draw_sprite_ext(sprCapButtons,2,global.width,0,1,1,0,mincolor2,minalpha)
    if (settings("fullscreen")) draw_sprite_ext(sprAeroArrow,0,mousex,mousey,1,1,0,$ffffff,minalpha)
}

if (!global.pause) {
    if ((keyboard_check(vk_tab) || debug_mode || fps_real<global.game_speed*0.95) && is_ingame()) fpsa=min(1.5,fpsa+0.05)
    else fpsa=max(0,fpsa-0.05)
    if (fpsa>0.5) {
        str=string(round(fps))
        for (i=0;i<string_length(str);i+=1)
            draw_sprite_ext(sprFraps,string_pos(string_char_at(str,i+1),"0123456789")-1,32+4+20*i,32+4,1,1,0,$ffffff,fpsa-0.5)
    }
}

//draw debug overlay
var drawX,drawY,drawAlign;

if (global.debug_overlay) {
    draw_set_color(c_black)
    draw_set_halign(fa_left)
    draw_set_font(fntFileSmall)

    drawX = 0;
    drawY = 0;
    drawAlign = 0;
    if (instance_exists(Player))
    {
        drawX = Player.x;
        drawY = Player.y;
        drawAlign = Player.x mod 3;
    }

    str="X: "+string(drawX)+" (align "+string(drawAlign)+")#"
       +"Y: "+string(drawY)+"#"
       +"Room: "+room_get_name(room)+" ("+string(room)+")#"
       +"FPS: "+string(fps)+" ("+string(fps_real)+") / "+string(room_speed)+"#"
       +string_repeat("God mode",global.debug_god)+"#"
       +string_repeat("Infinite jump",global.debug_jump)
    draw_text_outline(40,40,str,$ffff)
}

if (message) {
    draw_set_font(fntFileSmall)
    draw_set_alpha(min(1,message/100))
    draw_text_outline(40,40,messagetext,$ffff)
    draw_set_alpha(1)
}
if (message2) {
    draw_set_font(fntFileSmall)
    draw_set_halign(2)
    draw_set_alpha(min(1,message2/100))
    draw_text_outline(global.width-40,40,message2text,$ffff)
    draw_set_halign(0)
    draw_set_alpha(1)
}
