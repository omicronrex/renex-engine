///set_loop_point(sound,A)
///set_loop_point(sound,A,B)
var snd,loopa,loopb,len;

snd=argument[0]
loopa=argument[1]

if (sound_exists(snd)) {
    len=sound_get_length(snd)

    if (argument_count==3) {
        loopb=argument[2]
    } else {
        loopb=len
    }

    sound_set_loop(snd,loopa/len,loopb/len)
}
