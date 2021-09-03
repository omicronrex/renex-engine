//game properties
    global.game_title="renex engine lite"
    //intended room speed
    //note: player always runs at 50hz! look in player step for an explanation.
    global.game_speed=60
    global.width=800
    global.height=608
    global.scale=1.0
    global.first_room=rmDemo
    //set to a valid room id to use a hub room system
    global.hub_room=noone
    //password for encrypting saves.
    //if you don't want a password, use "".
    global.encrypt_save_password="renex"


//template for needle games
//if you're making a needle game and need precise physics and no frills, uncomment the following line.
//engine_template_needle() exit


//template for classic games
//if you want the classic game maker engine experience, uncomment the following line.
//engine_template_classic() exit


//difficulties
    add_difficulty("Medium")
    add_difficulty("Hard")
    add_difficulty("Very Hard")
    add_difficulty("Impossible")
    //you can replace these with bow/no bow for example, or even add more.
    //there is a globalvar called "difficulty" that's automatically set for you.
    //example: if (difficulty==0) {code for Medium difficulty}


//default camera values
    global.default_camera_w=800
    global.default_camera_h=608
    global.default_camera_follow=Player
    //camera will follow target smoothly when zoomed in
    global.camera_smoothing=true
    //camera will switch screens smoothly
    global.camera_easing=true
    //deactivate margin for rooms
    global.instance_deactivation=true
    //default dimensions are a single screens, with 20 pixels of margin.
    //you can, for example, set this to 3 and 3 for a 3x3 active game area.
    global.instance_activate_screens_w=1
    global.instance_activate_screens_h=1
    global.instance_activate_margin_px=20


//player settings
    //smooth player sprite position for less stuttery movement
    //(only relevant if game speed isn't 50)
    global.smooth_position=true
    global.player_skin=skin_default
    global.player_weapon=weapon_default
    global.leftright_moonwalk=false
    global.die_outside_room=true
    global.vine_jumps=false
    global.a_d_trick=false
    global.bow_lag=true
    //angle the player sprite on slopes
    global.angle_slopes=true
    //time in frames to allow single jumping after leaving a surface
    //turn this off for a precision needle game
    global.coyote_time=1
    //time in frames to allow jumping when the button is pressed too early in the air
    //makes 4.5s easier but does not remove valign lottery entirely
    global.jump_buffering=1
    //traditional platforming momentum system
    //player behaves more like i.e. mario
    //you can find more settings in player's create
    global.use_momentum_values=false


//sound options
    //master volume multiplier
    //we do not recommend gain above 0.7 as it can cause clipping
    global.gain=0.7
    global.restarting_music=false
    //pick just one of the following
    global.gameover_music_play=false
    global.gameover_music_stop=false
    global.gameover_music_pause=false
    global.gameover_music_fade=true
    //0 for clean break sound effect, 1 for yuuutu engine, 2 for yosniper
    global.break_sound_effect=0


//extra stuff
    //don't go back to the menu - quit the game instead when pressing esc
    global.esc_always_quits=false
    //enables automatic management of an application surface.
    //you always get one in fullscreen, but this tells the engine you plan to
    //use it yourself so it'll also update it in windowed mode.
    //you can do post processing effects in envelope_compose().
    global.use_application_surface=false
    //automatically updates the window caption with deathtime
    global.show_deathtime=true
    global.closing_animation=true
    //the ability to fight bosses more than once per savefile
    global.refight_bosses=true
    global.autosave_items=true
    global.contact_saves=false
    global.press_s_saves=false
    //make saves rotate with the view so you can save anywhere
    global.flip_saves=false
    //(0-8) reduces lag during gameplay, but causes small hiccup on room start.
    //each pass reduces instance count by almost half so with 2 passes we should
    //have around 30% of block instances. increase this value if your game lags.
    global.optimize_solids=2


//bonus / funny stuff
    //original iwbtg player mask
    global.use_original_mask=false
    //original iwbtg walking and jump animations
    global.use_original_animations=true
    //original iwbtg cherry aligns
    global.use_original_cherries=false
    //original iwbtg sound balance
    global.iwbtg_sound_mode=false
