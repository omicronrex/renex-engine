///set_loop_point(sound,A)
///set_loop_point(sound,A,B)
var snd,loopa,loopb,len;

snd=argument0
loopa=argument1

len=sound_get_length(snd)

if (argument_count==3) {
    loopb=argument[2]
} else {
    loopb=len
}

sound_set_loop(snd,loopa/len,loopb/len)
