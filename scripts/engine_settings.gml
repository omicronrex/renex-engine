//game properties
    global.game_title="renex engine"
    //intended room speed
    //note: player always runs at 50hz! look in player step for an explanation.
    global.game_speed=60
    global.width=800
    global.height=608
    global.scale=1.0
    global.first_room=rmDemo1


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
    //default dimensions are a 3x3 group of screens, with 20 pixels of margin.
    global.instance_activate_screens_w=3
    global.instance_activate_screens_h=3
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
    global.angle_slopes=true
    global.explode_gore=true


//sound options
    //we do not recommend gain above 0.7 as it can cause clipping
    global.gain=0.7
    global.restarting_music=false
    global.gameover_music_stop=false
    global.gameover_music_pause=false
    global.gameover_music_fade=true
    //use time stretch to keep avoidance songs in sync
    //uses a bit more cpu than just pitch shifting
    global.avoidance_stretch=false
    //0 for clean break sound effect, 1 for yuuutu engine, 2 for yosniper
    global.break_sound_effect=0


//extra stuff
    //set to a valid room id to use a hub room system
    global.hub_room=rmHub
    //password for encrypting saves.
    //if you don't want a password, use "".
    //also, if you change it, make sure to delete your save files
    global.encrypt_save_password="renex"
    global.esc_always_quits=false
    //enables automatic management of an application surface.
    //you always get one in fullscreen, but this tells the engine you plan to
    //use it yourself so it'll also update it in windowed mode
    global.use_application_surface=false
    global.show_deathtime=true
    global.closing_animation=true
    //the ability to fight bosses more than once per savefile
    global.refight_bosses=true
    global.autosave_items=true
    global.contact_saves=false
    global.press_s_saves=false
    //make saves rotate with you so you can save anywhere
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
