///rtime(minutes,seconds.milliseconds)
//converts real time into frame count for avoidances
//usage: if t==rtime(2,12.345), etc, where t is a variable you increment once per frame

return round_unbiased((argument1+(argument0*60))*global.game_speed)
