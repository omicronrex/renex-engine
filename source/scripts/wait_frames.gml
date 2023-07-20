//utility for timing boss scripts
//it's in frames, uses builtin boss object timer variable "boss_time"

return (roundto(boss_time,0.0000001) mod argument0)>=argument0-dt
