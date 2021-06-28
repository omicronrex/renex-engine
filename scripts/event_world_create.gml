gameclosing=0
closingvol=1
closingk=0

fading=0
fadefrom=1

stepcount=0
pause_delay=0

fpsa=0
monitorspeed=0
monitorresult=""

message=0
messagetext=""

message2=0
message2text=""

input_init()

global.viewangle=0
global.pause=0

global.keylist=ds_map_create()

globalvar bullet_table;

bullet_table[0]=0
global.bullet_map=ds_map_create()

//one screen frame, in microseconds, with a 5% margin for error
oneframe=(1000000/display_get_frequency())*0.95
oldtime=hrt_time_now()

orderTest=2

camera_l=0
camera_t=0
memcaml=-1
memcamt=-1

globalvar view_xcenter,view_ycenter;
