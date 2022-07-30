//game properties
    global.game_title="renex engine"
    //intended room speed
    //note: player always runs at 50hz! look in player step for an explanation.
    global.game_speed=50
    global.width=800
    global.height=608
    global.scale=1.0
    global.fullscreen_cursor_visible=false
    global.fullscreen_caption_visible=true
    //first room that's actually part of the game
    global.first_room=rmHub
    //room to return to when using WarpToHub object
    global.hub_room=rmHub
    //password for encrypting saves.
    //if you don't want a password, use "" and the save files will be unencrypted dsmaps.
    global.encrypt_save_password="renex"
    //save game to appdata instead of a /save folder
    global.use_appdata=false
    //user interface text color
    global.text_color=$ffffff
    //use savefile thumbnails
    global.savefile_thumbnails=true


//template for classic games
    //if you just want the classic gm8 engine experience, simply uncomment the following line.
    //engine_template_classic() exit


//difficulties
    //set this to a room with difficulty warps in order to use a difficulty selection room
    //a template is provided here -----v
    global.difficulty_room=noone//rmDifficulty
    //if that is unset, use the difficulty list below:

    add_difficulty("Medium")
    add_difficulty("Hard")
    add_difficulty("Very Hard")
    add_difficulty("Impossible")
    //you can replace these with bow/no bow for example, or even add more.
    //there is a globalvar called "difficulty" that's automatically set for you.
    //example: if (difficulty==0) {code for Medium difficulty}
    //         if (difficulty>=1) {code for Hard and above}
    //just remember that difficulty 3 (Impossible) prevents saving!

    //if only one difficulty is provided, this chooses the difficulty's value:
    //(can be used to turn off bow or make it always impossible)
    global.single_difficulty=1


//default camera values
    global.default_camera_w=800
    global.default_camera_h=608
    global.default_camera_follow=Player
    //camera will follow target smoothly when zoomed in
    global.camera_smoothing=true
    //camera will switch screens smoothly
    global.camera_easing=true
    //deactivate instances outside of the view
    global.instance_deactivation=true
    //default dimensions are single screens, with 20 pixels of margin.
    //you can, for example, set this to 3 and 3 for a 3x3 active game area.
    global.instance_activate_screens_w=1
    global.instance_activate_screens_h=1
    global.instance_activate_margin_px=20


//player settings
    //enable simulated studio 1.4.9999 vdiet (shorter hitbox when y ends in .50)
    global.valign05_vdiet=true
    //platform crush behavior
    //0: leave the player stuck in the wall
    //1: kill the player when pushed into a wall
    //2: drop the player through the platform
    global.platform_crush_behavior=2
    //default skin and weapon for a new file
    global.player_default_skin=skin_default
    global.player_default_weapon=weapon_default
    global.die_outside_room=true
    global.vine_jumps=false
    global.a_d_trick=false
    global.bow_lag=true
    //prevents shootkid from working if too close to a wall
    global.accurate_shootkid=true
    //angle the player sprite to match slopes (and the player's bullets)
    global.angle_slopes=true
    //time in frames to allow single jumping after leaving a surface
    //turn this off for a precision needle game
    global.coyote_time=0
    //time in frames to allow jumping when the button is pressed too early in the air
    //makes 4.5s easier (but does not remove bhop requirement)
    global.jump_buffering=0
    //traditional platforming momentum system
    //player behaves more like i.e. mario
    //you can find more settings in player's create
    global.use_momentum_values=false


//sound options
    //master volume multiplier
    //we do not recommend gain above 0.7 as it can cause clipping
    global.gain=0.7
    //game over music behavior:
    //0 for playing the game over jingle
    //1 for fading the level music out over a second
    //2 for pausing the level music immediately
    global.gameover_music=0
    //block break:
    //0 for remastered sound effect
    //1 for yuuutu engine
    //2 for yosniper
    global.break_sound_effect=0
    //pause all audio on pause
    global.pause_sound_on_game_pause=true


//game behavior
    //don't go back to the menu - quit the game immediately when pressing esc
    global.esc_always_quits=false
    //automatically updates the window caption with deathtime
    global.show_deathtime=true
    //white rectangle clowing animation
    global.closing_animation=true
    //the ability to fight engine-bosses more than once per savefile
    global.refight_bosses=true
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
    //have around 30% of block instances. increase this value if your game lags on large rooms.
    //if you're using autotilers that need each individual block object, turn this off.
    global.optimize_solids=2


//bonus / funny stuff
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
