if (global.show_deathtime) {
    room_caption=strong(
        global.game_title,
        " - "+global.name_difficulties[difficulty],
        " - "+lang("deaths")+": ",savedata("deaths"),
        " - "+lang("time")+": ",format_time(savedata("time")),
        pick(global.lastjoyname!="",""," - "+global.lastjoyname),
        pick(savedata("clear"),""," - "+lang("fileclear"))
    )
}
