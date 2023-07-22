//an example of how to recreate a classic fangame boss,
//using the engine's builtin boss system.

if (event_type==ev_other && event_number==ev_room_start) {
    exit
}

if (event_type==ev_create) {
    name="Big Cherry"
    subtitle="Celebrate100" 
    hp=150

    lock_controls()
    sound_stop_music()
    
    state="starting"
    vulnerable=false
    flash=0

    image_speed=0
    image_xscale=4
    image_yscale=4
    exit
}

if (event_type==ev_draw) {
    draw_cherry(x,y,4,4,0,$f3)
    exit
}

if (event_type==ev_destroy) {
    sound_stop_music()
    exit
}

if (event_type==ev_step) {
    //do damage
    with (instance_place(x,y,Player)) kill_player()
    
    //check victory condition      
    if (Player.dead) state="won"       
    if (state=="won") {
        path_speed=0
        visible=true
        exit
    }
    
    //take damage
    if (vulnerable) with (instance_place(x,y,Bullet)) with (other) {
        hp-=10
        if (hp<=0) {
            //defeated
            sound_play("sndDeath")
            instance_destroy()
        } else {
            sound_play("sndBossHit")
            vulnerable=false
            flash=10
            flashtime=6            
            if (hp<=50) {
                state="pinch"
            }
        }                                                       
        instance_destroy_other()
    } 
    
    //flash
    if (flash) {
        flashtime-=dt
        if (flashtime<=0) {
            flashtime=6
            if (visible) {
                visible=false
            } else {
                visible=true
                flash-=1
                if (!flash) vulnerable=true
            }
        }
    }
    
    //main boss state machine
    {
        //introduction
        if (state=="starting") {
            if (wait_frames(60)) {
                unlock_controls()
                sound_play_music("ddplastboss",1)
                vulnerable=true
                path_start(pBoss10F,2*dt,path_action_restart,true)
                state="active"
                reset_frame_wait()
            }
        }
        
        //attack!
        if (state=="active") {
            if (wait_frames(90)) {
                instance_create_moving(x,y,Cherry,5*dt,point_direction(x,y,Player.x,Player.y))
            }
        }
        
        //pinch mode
        if (state=="pinch") {
            if (wait_frames(90)) {
                instance_create_moving(x,y,Cherry,5*dt,point_direction(x,y,Player.x,Player.y))
                instance_create_moving(x,y,BigCherryBlueProjectile,1*dt,random(360))
            }
        }
    }
}
