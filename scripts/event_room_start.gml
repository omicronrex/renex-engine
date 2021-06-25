//set up teh room

room_speed=global.game_speed

vsync_a_bit()

//create player and do first save if necessary
if (is_ingame()) {
    update_caption_deathtime()

    if (!instance_exists(Player)) with (PlayerStart) {
        instance_create(x+17,y+23,savedata("obj"))
    }
    if (!savedata("saved")) {
        savedata_save(true)
    }
    view_angle=savedata("viewangle")

    if (global.gameover_music_pause) sound_kind_resume(1)
    event_world_endstep()
} else {
    room_caption=global.game_title
    sound_kind_pitch(0,1)
    sound_kind_pitch(1,1)
}

window_set_caption(room_caption)

load_persistent_objects()

if (global.optimize_solids) {
    //now let's glue blocks to reduce instance count, but being mindful of green pastel spikes
    with (PastelSpikeGreen) with (Block) if (object_index=Block && (x=other.x || y=other.y)) {
        instance_change(Cementer,0)
    }
    cement(Block)
    with (Cementer) {
        instance_change(Block,0)
    }
}

camera_default()

key_clear()
