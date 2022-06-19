event_trigger(ev_dismount)
with (passenger) {
    script_execute(global.player_skin,"step")
    repeat (2) player_update_sprite()
}
