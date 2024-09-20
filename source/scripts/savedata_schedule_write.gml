//schedule a write out to disk if game is left open for 5 minutes

with (World) {
    if (!save_scheduled) alarm[4]=global.game_speed*60*5
    save_scheduled=true
}
