///set_game_speed(factor,[time])
//sets the relative game delta time speed between 0 and 1.
//optional time is in millis.

var change; change=median(0,argument[0],1)

if (global.slomoto==change) exit

global.slomoto=change

if (argument_count==2) {
    global.slomof=abs(global.slomo-global.slomoto)/max(0,argument[1]/1000*global.game_speed)
} else {
    global.slomo=global.slomoto
    global.slomof=0
}
