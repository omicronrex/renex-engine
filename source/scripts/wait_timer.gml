///wait_timer(beat_number)

//every beat of the song, as defined by 'BPM' and 'beat', 'timer' increments by 1
//'beat' is the note length that defines a 'beat', the bottom number in a time sig

//this script is a counter that returns true once every time 'timer' is divisible by 'beat'
//thus, whatever is after the if statement when you call this script
//is only executed sequentially, and when it's the right time to do it
//you can use repeat to repeat whatever your code is x times, when this returns true

//think of this script like a stack, every time you call it, you add one thing to the stack
//the 'thing' being whatever piece of code you run after it

current_timer+=argument0
return (
    timer>=current_timer && 
    (oldtimer<current_timer || 
        (timer<oldtimer && (current_timer>oldtimer || current_timer<=timer))
    )
)
