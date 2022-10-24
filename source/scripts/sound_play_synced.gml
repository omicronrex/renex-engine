var i;

instance_destroy_id(MusicSync)

play_bg_music("",0)

i=instance_create(0,0,MusicSync)

i.BGM=argument0
i.loop=0

with (i) event_perform(ev_other,ev_room_start)
