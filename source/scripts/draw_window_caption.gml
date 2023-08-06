if (settings("fullscreen") && !global.pause && is_ingame() && global.fullscreen_caption_visible && settings("caption visible")) {
    if (abs(Player.y-view_yview)<48 && !Player.dead) caption_opacity=max(1/8,caption_opacity-(1/8)*dt)
    else caption_opacity=min(1,caption_opacity+(1/8)*dt)
    draw_set_alpha(caption_opacity)

    draw_set_font(global.fullscreen_caption_font)
    draw_text_outline(8,8,room_caption,global.fullscreen_caption_color)
    draw_set_alpha(1)
}
