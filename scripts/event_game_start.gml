//engine initialization

if (orderTest==2) {
    show_error(
        "Creation code order needs to be reversed for this engine to work."+lf+
        "Please enable the option in GGS->Code Options in GM 8.2."+lf+lf+
        "If you're using GM 8.1, move the included winspool.drv file into your Game Maker folder and reopen it.",
        true
    )
    exit
}

if (__gm82core_version<135) {
    show_error(
        "Please update your Game Maker 8.2 Core extension to 1.3.5 or newer.",
        true
    )
    exit
}

global.num_difficulties=0

engine_settings()

global.optimize_solids=median(0,global.optimize_solids,8)
global.break_sfx=pick(global.break_sound_effect,"sndBlockBreak","sndBlockBreakYuuutu","sndBlockBreakYosniper")

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

//funny bass boosted mode
if (global.iwbtg_sound_mode) {
    global.gain=1
    sound_effect_options(sound_kind_effect(0,se_gargle),0,0.5)
    sound_effect_options(sound_kind_effect(1,se_gargle),0,0.5)
    sound_effect_options(sound_kind_effect(3,se_gargle),0,0.5)
}

//load external sound assets
//sfx (uncompressed, multi instance)
sound_add_directory("data\sounds\",".wav",0,1)

//streamed sfx (compressed, multi instance)
sound_add_directory("data\sounds\",".ogg",3,1)
sound_add_directory("data\sounds\",".mp3",3,1)

//music (compressed,streamed)
sound_add_directory("data\music\",".ogg",1,1)
sound_add_directory("data\music\",".mp3",1,1)
sound_add_directory("data\music\",".mod",1,1)
sound_add_directory("data\music\",".s3m",1,1)

global.langmap=ds_map_create()
list_strings()

global.optlist=ds_list_create()
list_options()

sound_global_volume(global.gain)
list_music_properties()

savedata_init()

//detect that this is being ran from game maker and set the test run variable
global.test_run=false
if (program_directory!=working_directory && string_pos("\AppData\Local\Temp\gm_ttt_",program_directory)) {
    var key;key="SOFTWARE\Game Maker\Version 8.2\Preferences\"
    var name;name=filename_change_ext(filename_name(parameter_string(0)),"")
    if (registry_read_dword(key+"MakerRunning",0)) {
        for (i=0;i<4;i+=1) if (string_pos(name,registry_read_string_ext(key,"Recent"+string(i)))) {
            global.test_run=true
            break
        }
    }
    if (!global.test_run) {
        key="SOFTWARE\Game Maker\Version 8.1\Preferences\"
        if (registry_read_dword(key+"MakerRunning",0)) {
            for (i=0;i<4;i+=1) if (string_pos(name,registry_read_string_ext(key,"Recent"+string(i)))) {
                global.test_run=true
                break
            }
        }
    }
}

global.debug_overlay=(global.test_run && debug_mode)
global.debug_god=false
global.debug_jump=false
global.debug_hitbox=false
global.debug_autofire=false

//graphics setup
envelope_init()
display_set_gui_maximise(-1,-1)
update_fullscreen()
global.caption_opacity=1
instance_create(0,0,Ortho)
for (i=room_first;i!=-1;i=room_next(i)) {
    room_set_view_enabled(i,1)
    room_set_view(i,0,1,0,0,global.width,global.height,0,0,global.width,global.height,0,0,0,0,noone)
}
room_set_width(rmTitle,global.width)
room_set_width(rmMenu,global.width)
room_set_width(rmOptions,global.width)
room_set_height(rmTitle,global.height)
room_set_height(rmMenu,global.height)
room_set_height(rmOptions,global.height)

//uhhhh break cherry sprites i guess
if (!global.use_original_cherries) {
    sprite_assign(sprCherry,sprCherryOld)
    sprite_assign(sprCherryRainbow,sprCherryRainbowOld)
    sprite_assign(sprCherryPink,sprCherryPinkOld)
    sprite_assign(sprCherryOrange,sprCherryOrangeOld)
    sprite_assign(sprCherryMagenta,sprCherryMagentaOld)
    sprite_assign(sprCherryViolet,sprCherryVioletOld)
    sprite_assign(sprCherryBlue,sprCherryBlueOld)
    sprite_assign(sprCherryAzure,sprCherryAzureOld)
    sprite_assign(sprCherryCyan,sprCherryCyanOld)
    sprite_assign(sprCherryEmerald,sprCherryEmeraldOld)
    sprite_assign(sprCherryGreen,sprCherryGreenOld)
    sprite_assign(sprCherryChartreuse,sprCherryChartreuseOld)
    sprite_assign(sprCherryYellow,sprCherryYellowOld)
    sprite_assign(sprCherryGray,sprCherryGrayOld)
    sprite_assign(sprCherryWhite,sprCherryWhiteOld)
    sprite_assign(sprCherryBlack,sprCherryBlackOld)
}

globalvar gizmos,gizmolist;
gizmos=0
gizmolist=0
add_gizmo(Trap)
list_gizmos()

//let's go away
if (settings("volcheck")) {
    room_goto_next()
} else {
    instance_create(0,0,VolCheck)
}
