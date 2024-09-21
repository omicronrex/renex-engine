/*

    RENEX ENGINE
    ============
    version 1.7.0
    July 2023

  A modern fork of various Game Maker 8 I Wanna Be The Guy fangame
  engines with hundreds of improvements and new features.

  Made by renex with vast contributions from
  the following people at the time of release:

  ---------------------------------------
  \  Floogle  Starz0r  Verve  Duncan  V \
  \  Jopagu  Plasma  Square  roaming97  \
  \  Various other fangame developers   \
  ---------------------------------------

*/

//Set this to true when making a final build of your game
global.release_mode=false

//game properties
    global.game_title="renex engine"
    //intended room speed
    //note: player always runs at 50hz! look in player step for an explanation
    global.game_speed=50
    //game screen+window size
    global.width=800
    global.height=608
    //first room that's actually part of the game
    global.first_room=rmHub
    //room to return to when using WarpToHub object
    global.hub_room=rmHub
    //password for encrypting saves
    //if you don't want a password, use "" for the save files to be unencrypted dsmaps
    global.encrypt_save_password="renex"
    //save game to appdata instead of a /save folder
    global.use_appdata=false
    //data folder location (make sure to include the data folder with your exe!)
    global.datadir="data\"
    //use savefile thumbnails
    global.savefile_thumbnails=true
    //user interface text color
    global.text_color=$ffffff
    //enable test mode in exe builds
    //do not forget to disable this when publishing your game
    global.always_test_mode=false
    //disable the player delta time system (see Player step event action 1)
    global.disable_delta_time=false
    //disable the global settings repository
    //use this when you don't want the engine to remember the last game's options
    global.disable_settings_repo=false


//difficulties
    //difficulty options:
    add_difficulty("Medium",false,false)
    add_difficulty("Hard",true,false)
    add_difficulty("Very Hard",false,false)
    add_difficulty("Impossible",false,true)

    //you can replace these with bow/no bow for example, or even add more
    //there is a globalvar called "difficulty" that's automatically set for you
    //example: if (difficulty==0) {code for Medium difficulty}
    //         if (difficulty>=1) {code for Hard and above}
    //if the difficulty is set to be impossible then the savefile will be wiped on restart
    
    //if you set the "default" argument to true
    //that difficulty will be chosen by default on a new file
    //this is useful if, for example, you want to include an "assist mode" in your game

    //additionally, if only one difficulty is provided, this chooses the difficulty's value:
    //(can be used to turn on bow by setting to 0)
    global.single_difficulty=1

    //set this to a room with difficulty warps in order to use a difficulty room
    //a template is provided here -----v
    global.difficulty_room=noone//rmDifficulty
    //instant restart upon death in the difficulty room
    global.diffroom_instantrestart=true


//game behavior
    global.fullscreen_cursor_visible=false
    //fullscreen caption options
    global.fullscreen_caption_visible=true
    global.fullscreen_caption_color=$ffff
    global.fullscreen_caption_font=fntSignpost
    //don't go back to the menu - quit the game immediately when pressing esc
    global.esc_always_quits=false
    //automatically updates the window caption with deathtime
    global.show_deathtime=true
    //CRT closing animation (only on windowed)
    global.closing_animation=true
    //jump refreshers respawn time - if set to zero, it only respawns when you land
    global.jump_refresher_timer=0
    //if false, items are only collected upon saving normally
    //otherwise, items are collected immediately
    global.autosave_items=false
    //item display on the file menu is replaced with a (x/y) counter
    global.item_number_display=false
    //item display on the file menu is replaced with a (x%) counter
    global.item_percentage_display=false
    //total amount of items in your game (used for the previous two options)
    global.item_total_count=8
    //save automatically when touching saves
    global.contact_saves=false
    //press shoot to save when touching a save
    global.press_shoot_saves=false
    //let all saves work even while flipped the wrong way
    global.flip_saves=true
    //saves display above them the time they were first saved
    global.idolmaster_saves=true
    //save death & time stats in a .csv file in the save location
    //recommended to turn this off when publishing your game
    global.save_csv_stats=true
    //use the brighter vhard save sprite instead of the regular one
    global.vhard_save_sprite=true
    //(1-8) reduces lag during gameplay, but causes a small hiccup on room start
    //each pass reduces solid instance count by almost half by gluing blocks together
    //so with 2 passes we should only have around 30% of block instances
    //if you need separate block objects, set this to 0
    global.optimize_solids=2
    //make the NANG fields animate by scrolling the sprite
    global.animated_nang_fields=true
    //pause the game when unfocused (automatically unpauses when re-focused)
    //also doesn't open/close the pause menu if you paused manually
    global.unfocus_pause=false
    //pause ingame timer after the save is marked as cleared
    global.pause_time_after_clear=true


//player settings
    //clear inputs on touching a warp
    global.clear_inputs_on_warp=false
    //enable simulated studio 1.4.9999 vdiet (shorter hitbox when y ends in .50)
    global.valign05_vdiet=true
    //allow fractionary x coordinates while not moving
    global.allow_frac_x_coordinate=false
    //save the player's fractionary valign
    //if disabled, the y coordinate is floored on save
    //there is also an optional player choice for this - check custom_options()
    global.save_valign=true
    //save the player exactly in the middle of save points
    global.centered_saving=false
    //platform crush behavior:
    //0 - leave the player stuck in the wall
    //1 - kill the player when pushed into a wall
    //2 - drop the player through the platform
    global.platform_crush_behavior=2
    //default skin and weapon for a new file
    global.player_default_skin=skin_default
    global.player_default_weapon=weapon_default
    //kill player when leaving the room region
    global.die_outside_room=true
    //allow pressing A and D to move 1 pixel left and right to change your align
    //regardless of debug mode
    global.a_d_trick=false
    //make the Medium difficilty bow lag behind like in the original game
    global.bow_lag=true
    //turns the kid's cape blue if the player can't double jump
    global.celeste_cape=false
    //turns the kid's bow blue if the player can't double jump (only appears on Medium)
    global.celeste_bow=false
    //prevents shootkid from working if too close to a wall
    global.accurate_shootkid=true
    //enable distance vines (classic engine vine check using distance_to_object)
    global.distance_vines=false
    //allow the player to grab vines while on the floor
    global.floor_vines=false
    //time in frames to destroy a platform after it's been jumped on
    //keep it at -1 for them to never destroy
    //it also plays a sound when jumped on, see player_jump()
    global.platform_destroy_time=-1
    //angle the player (and the player's bullets) to match slopes
    global.angle_slopes=true
    //time in frames to disable pausing after exiting the pause menu
    //set it to 25 or above to prevent pause buffering
    global.pause_delay_time=25
    //enable blood clusters for a slight performance boost
    //may look weird
    global.blood_clusters=false
    //enable blood culling for a slight performance boost
    //may look even weirder
    global.blood_culling=false


//sound options
    //master volume multiplier
    //we do not recommend gain above 0.7 as it can cause clipping
    global.gain=0.7
    //game over music behavior:
    //0 - play the game over jingle
    //1 - fade the level music over a second
    //2 - pause the level music immediately
    //3 - do nothing (music keeps playing)
    //4 - music slowdown
    global.gameover_music=0
    //block break sound:
    //0 - remastered sound effect
    //1 - yuuutu engine sound effect
    //2 - yosniper engine sound effect
    global.break_sound_effect=0
    //pause all audio on pause
    global.pause_sound_on_game_pause=true
    //stop sound effects when changing rooms
    global.stop_sounds_on_room_change=true
    //disable automatic pan and volume
    global.disable_autopanvol=false


//cleaner physics --- not recommended to change when making traditional needle games
    //jump from vines with the jump button
    global.maker_vines=false
    //clean up vine physics, modelling them after Hollow Knight's walljump
    //jumps with the jump button regardless of the maker vines setting
    //vines do not work if not placed on top of a block
    global.clean_vines=false
    //default platform snap behavior:
    //0 - yuuutu - inconsistent snap, how it works in most engines
    //1 - hard - always snap regardless of vertical movement, also snaps when near the top
    //2 - light - snaps only when near the top
    //3 - none - don't snap at all, act like one-way blocks
    global.platform_snap_type=0
    //allows jumping while inside of platforms
    global.platform_swimming=true
    //disable weird keyboard quirks like cactusing or cancels
    //makes the minimum jump height be a 2-frame
    global.disable_cancels=false
    //time in frames to allow 'floor' jumping after leaving a surface
    global.coyote_time=0
    //changes whether the player is still affected by gravity in coyote time if it's enabled
    global.coyote_time_floating=false
    //time in frames to allow jumping when the button is pressed too early in the air
    //makes 4.5s easier
    global.jump_buffering=0


//default camera values
    //disable camera system entirely
    //use this when porting your own camera system to the engine
    global.disable_camera=false
    //these values are applied to all rooms by default - putting a CameraOverride
    //in a room allows you to change the values for that room only
    global.default_camera_w=800
    global.default_camera_h=608
    global.default_camera_zoom=1
    //object to follow
    global.default_camera_follow=Player
    //camera will follow target smoothly when free of boundaries
    global.default_camera_smoothing=true
    //frames to reach target destination if camera smoothing is enabled
    //higher number = camera moves slower
    global.smoothing_rate=5
    //deactivate instances outside of the view
    global.instance_deactivation=true
    //how many screens to keep active, with 20 pixels of margin
    global.instance_activate_screens_w=1
    global.instance_activate_screens_h=1
    global.instance_activate_margin_px=20


//bonus and funny stuff
    //original iwbtg player mask
    global.use_original_mask=false
    //original iwbtg cherry aligns
    global.use_original_cherries=false
    //original iwbtg sound balance
    global.iwbtg_sound_mode=false
    //use nicely tiled long platforms instead of stretched sprite
    global.platform_9slice=true
    //oh yuo knwo
    global.restarting_music=false
    //mario
    global.use_momentum_values=false
