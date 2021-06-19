if (global.show_deathtime) {
    room_caption=strong(
        global.game_title,
        " Death: ",savedata("deaths"),
        " Time: ",format_time(savedata("time")),
        pick(savedata("clear"),""," Clear!")
    )
}
