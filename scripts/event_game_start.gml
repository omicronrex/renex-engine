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

engine_settings()
global.optimize_solids=median(0,global.optimize_solids,8)
global.break_sfx=pick(global.break_sound_effect,"sndBlockBreak","sndBlockBreakYuuutu","sndBlockBreakYosniper")

set_application_title(global.game_title)
draw_set_color($ffffff)

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
}

//load external sound assets
//sfx (uncompressed)
sound_add_directory("data\",".wav",0,1)

//streamed sfx (compressed, streamed)
sound_add_directory("data\streamed sfx",".ogg",3,1)

//music (compressed,streamed)
sound_add_directory("data\",".ogg",1,1)
sound_add_directory("data\",".mod",1,1)
sound_add_directory("data\",".s3m",1,1)

list_loop_points()
sound_global_volume(global.gain)

//init and load settings and savedata
exe_name=filename_change_ext(filename_name(parameter_string(0)),"")
global.setfile=exe_name+".cfg"
global.savefile=exe_name+".sav"
global.backfile=exe_name+".sav.bak"
global.setmap=ds_map_create()
global.savemap=ds_map_create()
settings_read()
savedata_read()

global.test_run=!!string_pos("gm_ttt",parameter_string(0))
global.debug_overlay=false
global.debug_god=false
global.debug_jump=false
global.debug_hitbox=false
global.debug_autofire=false

//graphics setup
envelope_init()
doVsync=!(global.dz mod 60 == 0)
set_synchronization(settings("vsync"))
update_fullscreen()
instance_create(0,0,Ortho)
for (i=room_first;i!=-1;i=room_next(i)) {
    room_set_view_enabled(i,1)
    room_set_view(i,0,1,0,0,global.width,global.height,0,0,global.width,global.height,0,0,0,0,noone)
}

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

list_avoidance_bullets()

//let's go away
room_goto_next()
