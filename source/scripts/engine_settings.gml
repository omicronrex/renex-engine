/*

    RENEX ENGINE
    ============
    version 1.5.0
    23 July 2022

  A modern fork of various Game Maker 8 I Wanna Be The Guy fangame
  engines with hundreds of improvements and new features.

  Made by renex with vast contributions from
  the following people at the time of release:

  ---------------------------------
  \  Floogle  Starz0r  roaming97  \
  \  Verve    Duncan    Plasma    \
  ---------------------------------

*/

//game properties
    global.game_title="renex engine"
    //intended room speed
    //note: player always runs at 50hz! look in player step for an explanation.
    global.game_speed=50
    global.width=800
    global.height=608
    //first room that's actually part of the game
    global.first_room=rmTemplate
    //room to return to when using WarpToHub object
    global.hub_room=rmHub
    //password for encrypting saves.
    //if you don't want a password, use "" and the save files will be unencrypted dsmaps.
    global.encrypt_save_password="renex"
    //save game to appdata instead of a /save folder
    global.use_appdata=false
    //use savefile thumbnails
    global.savefile_thumbnails=true
    //user interface text color
    global.text_color=$ffffff


//difficulties
    //difficulty options:
    add_difficulty("Medium")
    add_difficulty("Hard")
    add_difficulty("Very Hard")
    add_difficulty("Impossible",true)

    //you can replace these with bow/no bow for example, or even add more.
    //there is a globalvar called "difficulty" that's automatically set for you.
    //example: if (difficulty==0) {code for Medium difficulty}
    //         if (difficulty>=1) {code for Hard and above}
    //if the difficulty is set to be impossible then the savefile will be wiped on restart.
    //if only one difficulty is provided, this chooses the difficulty's value:
    //(can be used to turn on bow by setting to 0)
    global.single_difficulty=1

    //set this to a room with difficulty warps in order to use a difficulty room
    //a template is provided here -----v
    global.difficulty_room=noone//rmDifficulty
    //instant restart upon death in the difficulty room
    global.diffroom_instantrestart=true


//default camera values
    //these values are applied to all rooms by default - putting a CameraOverride
    //in a room allows you to change the values for that room only.
    global.default_camera_w=800
    global.default_camera_h=608
    global.default_camera_zoom=1
    //object to follow
    global.default_camera_follow=Player
    //camera will follow target smoothly when free of boundaries
    global.default_camera_smoothing=true
    //deactivate instances outside of the view
    global.instance_deactivation=true
    //how many screens to keep active, with 20 pixels of margin.
    global.instance_activate_screens_w=1
    global.instance_activate_screens_h=1
    global.instance_activate_margin_px=20


//player settings
    //enable simulated studio 1.4.9999 vdiet (shorter hitbox when y ends in .50)
    global.valign05_vdiet=true
    //save the player's fractionary valign
    //if disabled, the y coordinate is floored on save
    //there is an optional player choice for this - check custom_options().
    global.save_valign=true
    //platform crush behavior
    //0: leave the player stuck in the wall
    //1: kill the player when pushed into a wall
    //2: drop the player through the platform
    global.platform_crush_behavior=2
    //default skin and weapon for a new file
    global.player_default_skin=skin_default
    global.player_default_weapon=weapon_default
    //jump from vines with the jump button
    global.maker_vines=false
    global.die_outside_room=true
    global.a_d_trick=false
    global.bow_lag=true
    //prevents shootkid from working if too close to a wall
    global.accurate_shootkid=true
    //angle the player (and the player's bullets) to match slopes
    global.angle_slopes=true
    //time in frames to allow single jumping after leaving a surface
    //turn this off for a precision needle game
    global.coyote_time=0
    //time in frames to allow jumping when the button is pressed too early in the air
    //makes 4.5s easier
    global.jump_buffering=0


//sound options
    //master volume multiplier
    //we do not recommend gain above 0.7 as it can cause clipping
    global.gain=0.7
    //game over music behavior:
    //0 for playing the game over jingle
    //1 for fading the level music over a second
    //2 for pausing the level music immediately
    //3 for doing nothing (music keeps playing)
    //4 for music slowdown
    global.gameover_music=0
    //block break:
    //0 for remastered sound effect
    //1 for yuuutu engine
    //2 for yosniper
    global.break_sound_effect=0
    //pause all audio on pause
    global.pause_sound_on_game_pause=true
    //stop sound effects when changing rooms
    global.stop_sounds_on_room_change=true


//game behavior
    global.fullscreen_cursor_visible=false
    global.fullscreen_caption_visible=true
    //don't go back to the menu - quit the game immediately when pressing esc
    global.esc_always_quits=false
    //automatically updates the window caption with deathtime
    global.show_deathtime=true
    //CRT closing animation
    global.closing_animation=true
    //jump refreshers respawn time - if set to zero, it respawns when you land
    global.jump_refresher_timer=0
    //if false, items are only collected upon saving normally
    global.autosave_items=true
    //save automatically when touching saves
    global.contact_saves=false
    //press S to save when touching a save
    global.press_s_saves=false
    //let all saves work even while flipped the wrong way
    global.flip_saves=true
    //(0-8) reduces lag during gameplay, but causes small hiccup on room start.
    //each pass reduces solid instance count by almost half so with 2 passes we should
    //have around 30% of block instances.
    //if you need separate block objects, turn this off.
    global.optimize_solids=2


//bonus and funny stuff
    //original iwbtg player mask
    global.use_original_mask=false
    //original iwbtg cherry aligns
    global.use_original_cherries=false
    //original iwbtg sound balance
    global.iwbtg_sound_mode=false
    //use nicely tiled long platforms instead of stretched sprite
    global.platform_9slice=true
    //oh yuo know
    global.restarting_music=false
    //mario
    global.use_momentum_values=false
