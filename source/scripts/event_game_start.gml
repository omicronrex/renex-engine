//engine initialization

if (order_test==2) {
    show_error(
        "Creation code order needs to be fixed for this engine to work."+lf+
        "Please enable the option in Game Settings->Code Options in GM 8.2.",
        true
    )
    exit
}

if (__gm82core_version<151) {
    show_error(
        "Please update your Game Maker 8.2 Core extension to 1.5.1 or newer.",
        true
    )
    exit
}

if (!directory_exists("data")) {
    set_working_directory(directory_previous(working_directory))
    if (!directory_exists("data")) {
        show_error(
            "Data folder not found.",
            true
        )
    }
}

io_set_roomend_clear(0)

gameclosing=0
scheduled_close_button=0
closingvol=1
closingk=0

fading=0
fadefrom=1
slowing=0
slowfrom=1

stepcount=0
pause_delay=0

fpsa=0

debug_execute_code=""

message=0 messagetext=""
message2=0 message2text=""

maxalpha=0
maxclick=0

if (get_windows_version()==5) {
    //windows xp colors
    maxcolor1=$e55500
    maxcolor2=$ffffff
} else {
    //get win10 window colors
    maxcolor1=window_get_caption_color()
    if (color_get_luminance(maxcolor1)>128) maxcolor2=0
    else maxcolor2=$ffffff
}

global.viewangle=0
global.pause=false
global.music=""
global.music_instance=noone

global.perform_autosave=false
global.room_started=false
global.gen_thumb=false
global.gen_thumb_cachebg=noone

global.warp_id=""

global.increment=0

global.keylist=ds_map_create()

globalvar difficulty;difficulty=0

global.shadermap=ds_map_create()

//one screen frame, in microseconds, with a 5% margin for error
oneframe=(1000000/display_get_frequency())*0.95
oldtime=get_timer()

camera_l=0
camera_t=0
memcaml=-1
memcamt=-1

camera_shaketime=0
camera_shakex=0
camera_shakey=0

caption_opacity=1

mousex=0
mousey=0

activation_timer=0

globalvar view_xcenter,view_ycenter;
globalvar cpu_usage,ram_usage;

ram_timer=0
current_speed=room_speed

global.num_difficulties=0

engine_settings()

if (global.num_difficulties==1) {
    //only one difficulty, copy it to the single difficulty used
    global.name_difficulties[global.single_difficulty]=global.name_difficulties[0]
    global.is_impossible[global.single_difficulty]=global.is_impossible[0]
}

global.optimize_solids=median(0,global.optimize_solids,8)
global.break_sfx=pick(median(0,global.break_sound_effect,2),"sndBlockBreak","sndBlockBreakYuuutu","sndBlockBreakYosniper")

set_application_title(global.game_title)
draw_set_color($ffffff)

joystick_set_deadzone(0.5)

global.infocus=true

//you can multiply things by dt to get the correct 50hz animation speed
globalvar dt;
dt=50/global.game_speed

//global variables for player state
globalvar cutscene,frozen;
cutscene=false
frozen=false

input_init()

load_sounds()

global.langmap=ds_map_create()
custom_language()

global.optlist=ds_list_create()
custom_options()

savedata_init()

//detect that this is being ran from game maker and set the test run variable
global.test_run=global.always_test_mode
if (program_directory!=working_directory && string_pos("\AppData\Local\Temp\gm_ttt_",program_directory)) {
    var key;key="SOFTWARE\Game Maker\Version 8.2\Preferences\"
    var name;name=filename_change_ext(filename_name(parameter_string(0)),"")
    if (registry_read_dword(key+"MakerRunning",0)) {
        for (i=0;i<8;i+=1) if (string_pos(name,registry_read_string_ext(key,"Recent"+string(i)))) {
            global.test_run=true
            break
        }
    }
}

if (global.test_run) {
    live_roomeditor_start()
    live_roomeditor_add_obj_exclusion(PlayerStart)
}

custom_init()

shaders_init()

savedata_init()

global.debug_overlay=(global.test_run && debug_mode)
global.debug_god=false
global.debug_jump=false
global.debug_hitbox=false
global.debug_autofire=false
global.debug_autofire_counter=0

profiler_setup()

//graphics setup
envelope_init()
display_set_gui_maximise(-1,-1)
update_fullscreen()
instance_create(0,0,Ortho)

for (i=room_first;i!=-1;i=room_next(i)) {
    room_set_view_enabled(i,1)
    room_set_view(i,0,1,0,0,global.width,global.height,0,0,global.width,global.height,0,0,0,0,noone)
}

//fix cherry sprites if the option is enabled
if (global.use_original_cherries) {
    sprite_assign(sprCherry,sprCherryNew)
    sprite_assign(sprCherryRainbow,sprCherryRainbowNew)
    sprite_assign(sprCherryPink,sprCherryPinkNew)
    sprite_assign(sprCherryOrange,sprCherryOrangeNew)
    sprite_assign(sprCherryMagenta,sprCherryMagentaNew)
    sprite_assign(sprCherryViolet,sprCherryVioletNew)
    sprite_assign(sprCherryBlue,sprCherryBlueNew)
    sprite_assign(sprCherryAzure,sprCherryAzureNew)
    sprite_assign(sprCherryCyan,sprCherryCyanNew)
    sprite_assign(sprCherryEmerald,sprCherryEmeraldNew)
    sprite_assign(sprCherryGreen,sprCherryGreenNew)
    sprite_assign(sprCherryChartreuse,sprCherryChartreuseNew)
    sprite_assign(sprCherryYellow,sprCherryYellowNew)
    sprite_assign(sprCherryGray,sprCherryGrayNew)
    sprite_assign(sprCherryWhite,sprCherryWhiteNew)
    sprite_assign(sprCherryBlack,sprCherryBlackNew)
}

globalvar gizmos,gizmolist;
gizmos=0
gizmolist=0
add_gizmo(Trap)
custom_traps()

//let's go away
if (settings("volcheck")) {
    room_goto_next()
} else {
    instance_create(0,0,VolCheck)
}
