//a boss template using the engine's builtin boss system.
//when making your own boss, duplicate and edit this script.

if (event_type==ev_other && event_number==ev_room_start) {
    //read values from any object fields defined for the boss
    exit
}

if (event_type==ev_create) {
    //initialize the boss and create any resources needed by it
    name="Template Boss"
    subtitle="renex engine" 
    hp=10

    lock_controls()
    sound_stop_music()
    
    state="starting"
    vulnerable=false
    flash=0
    
    image_speed=dt/10
    exit
}

if (event_type==ev_draw) {
    draw_self()
    exit
}

if (event_type==ev_destroy) {
    //perform cleanup of any resources allocated for the boss
    //(surfaces, data structures, shaders etc.)
    exit
}

if (event_type==ev_step) {
    //do damage
    with (instance_place(x,y,Player)) kill_player()
    
    //check victory condition      
    if (Player.dead) state="won"       
    if (state=="won") {
        speed=0
        image_alpha=1
        exit
    }

    //take damage
    if (vulnerable) with (instance_place(x,y,Bullet)) with (other) {
        hp-=1
        if (hp<=0) {
            //defeated
            sound_play("sndDeath")
            instance_destroy()
        } else {
            sound_play("sndBossHit")
            vulnerable=false
            flash=50
            image_alpha=0.5                         
        } 
        instance_destroy_other()
    }

    //flashing
    if (flash) {
        flash-=1
        if (!flash) {
            vulnerable=true
            image_alpha=1
        }
    }     

    //main boss state machine
    {
        //first state
        if (state=="starting") {
            if (wait_frames(60)) {
                unlock_controls()
                sound_play_music("ddpboss",1)
                vulnerable=true
                state="active"
            }
        }
        
        //attack!
        if (state=="active") {
            if (wait_frames(90)) {
                o=instance_create_moving(x,y,Cherry,3*dt,point_direction(x,y,Player.x,Player.y))
            }
        }
    }
}
