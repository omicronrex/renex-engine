if (event="create") {
    name="Utah"
    sur=""

    maxhp=40

    play_bg_music("ddpboss",1)

    //teapot stuff
    model=d3d_model_create()
    d3d_model_load(model,"data\Example (safe to delete)\teapot.g3d")

    lightf=0
    scale=0
    angle=3600
    angle2=0
    r1=3600
    r2=0
    exit
}

if (event="draw") {
    if (flash>0 || state="dying") {flash-=dt if (flash mod 5<3) draw_set_color($ff)}

    d3d_start()
    d3d_set_lighting(1)
    d3d_light_define_ambient($606060)
    d3d_light_define_direction(0,-1,-1,1,$a0a0a0)
    d3d_light_define_direction(1,0,1,0,merge_color(0,$ff,lightf))
    d3d_light_enable(0,1)
    d3d_light_enable(1,1)

    per=0.3 //perspective factor
    d3d_set_projection_ext(400,304,400/per,400,304,0,0,-1,0,90*per,800/608,max(1,400/per-512),400/per+512)

    //fix teapot scale
    d3d_transform_add_translation(0,0,55)
    d3d_transform_add_scaling(scale*0.75,scale*0.75,scale)

    //adjust angle
    d3d_transform_add_rotation_x(90-sin(angle/10)*5)
    d3d_transform_add_rotation_z(cos(angle/10)*5)
    d3d_transform_add_rotation_y(-90-r1)
    d3d_transform_add_rotation_x(-r2)

    //move to position
    d3d_transform_add_translation(x,y-4,0)
    d3d_model_draw(model,0,0,0,-1)

    d3d_transform_set_identity()

    d3d_end()
    d3d_set_lighting(0)
    d3d_set_projection_default()

    draw_set_color($ffffff)
    exit
}

if (event="destroy") {
    d3d_model_destroy(model)
    exit
}

t+=dt

if (state="won") {
    gravity=-0.03*dt*dt
    exit
}

//die
if (hp<=0) {
    instance_create(x+random_range(-20,20),y+random_range(-10,10),GlassShard)
    if (state!="dying") {
        sound_play("sndBossDeath")
        state="dying"
        hspeed=sign(400-x)*2*dt
        vspeed=-3*dt
        gravity=0.05
        t=0
    } else if (once_every(50)) {
        sound_play("sndBossDeath")
        instance_create(x,y,TouhouDeath)
        repeat (80) instance_create(x+random_range(-20,20),y+random_range(-10,10),GlassShard)
        instance_destroy()
    }
    exit
}

//appear
if (state="begin") {
    scale+=0.0068*dt
    angle*=1-(dt/22)
    if (scale>=1) {
        scale=1
        state="menacing"
        t=0
    }
}

//update draw properties
image_xscale=scale*4
image_yscale=scale*4
r1-=angle_difference(angle,r1)*(dt/2)
r2-=angle_difference(angle2,r2)*(dt/6)

tx=x+(-lengthdir_y(100,angle))*scale
ty=y+(-50-12*sin(angle/10))*scale+lengthdir_y(100,angle2)
tz=-lengthdir_x(100,angle)

angle2=0
speed=0

//checks to get hit
if (vulnerable) {
    with (instance_place(x,y,Bullet)) with (other) {
        instance_create(other.x,other.y,GlassShard)
        sound_play("sndBossHit")
        flash=50
        hp-=1
        hitcount+=1
        instance_destroy_id(other)
    }
} else {
    flash=0
    hitcount=0
}

//he's just standing there. menacingly
if (state="menacing") {
    lightf=min(1,lightf+0.01*dt)
    angle-=angle_difference(point_direction(x,y,Player.x,Player.y)+90+sin(t/6)*5,angle)*(dt/10)
    angle2=-lengthdir_x(40,angle)
    x=xstart+irandom_range(-4,4)
    y=ystart+irandom_range(-4,4)
    if (once_every(4)) effect_create_above(ef_smokeup,tx+random_range(-8,8),ty+random_range(-8,0),choose(0,1),choose($b0b0b0,$c0c0c0,$d0d0d0))
    if (once_every(170)) {
        angle=0
        if (hp<=20) state="spray2"
        else state="spray"
        t=0
    }
}

//attack 1
if (state="spray") {
    angle+=2*dt
    if (once_every(5)) {
        if (angle>90 && angle<270) effect_create_below(ef_smokeup,tx+random_range(-8,8),ty+random_range(-8,0),choose(0,1),choose($b0b0b0,$c0c0c0,$d0d0d0))
        else effect_create_above(ef_smokeup,tx+random_range(-8,8),ty+random_range(-8,0),choose(0,1),choose($b0b0b0,$c0c0c0,$d0d0d0))
        o=instance_create(tx,ty,Cherry)
        o.hspeed=random_range(-4,4)*dt
        o.vspeed=random_range(-6,-8)*dt
        o.gravity=0.3*dt*dt
        o.depth=depth+tz
        o.image_xscale=1-tz/400
        o.image_yscale=1-tz/400
    }
    if (angle>360) {
        state="roam"
    }
}

//attack 1 pinch mode
if (state="spray2") {
    angle+=4*dt
    if (once_every(5)) {
        if (angle>90 && angle<270) effect_create_below(ef_smokeup,tx+random_range(-8,8),ty+random_range(-8,0),choose(0,1),choose($b0b0b0,$c0c0c0,$d0d0d0))
        else effect_create_above(ef_smokeup,tx+random_range(-8,8),ty+random_range(-8,0),choose(0,1),choose($b0b0b0,$c0c0c0,$d0d0d0))
        o=instance_create(tx,ty,Cherry)
        o.hspeed=random_range(-4,4)*dt
        o.vspeed=random_range(-6,-8)*dt
        o.gravity=0.3*dt*dt
        o.depth=depth+tz
        o.image_xscale=1-tz/400
        o.image_yscale=1-tz/400
    }
    //circle
    if (once_every(30)) {
        for (i=0;i<360;i+=20) {
            //if (angle>90 && angle<270) effect_create_below(ef_explosion,tx+random_range(-8,8),ty+random_range(-8,8),0,choose($b0b0b0,$c0c0c0,$d0d0d0))
            //else effect_create_above(ef_explosion,tx+random_range(-8,8),ty+random_range(-8,8),0,choose($b0b0b0,$c0c0c0,$d0d0d0))
            if (angle>90 && angle<270) effect_create_below(ef_firework,tx+random_range(-8,8),ty+random_range(-8,8),0,choose($b0b0b0,$c0c0c0,$d0d0d0))
            else effect_create_above(ef_firework,tx+random_range(-8,8),ty+random_range(-8,8),0,choose($b0b0b0,$c0c0c0,$d0d0d0))
            o=instance_create(tx,ty,Cherry)
            o.direction=i
            o.speed=6*dt
            o.depth=depth+tz
            o.image_xscale=1-tz/400
            o.image_yscale=1-tz/400
        }
    }
    if (angle>720) {
        state="roam2"
    }
}

//attack 2
if (state="roam") {
    move_towards_point(Player.x,Player.y,1.5*dt)
    angle-=angle_difference(point_direction(x,y,Player.x,Player.y)+90+sin(t/6)*5,angle)*(dt/10)
    angle2=-lengthdir_x(40,angle)
    vulnerable=true
    lightf=max(0,lightf-0.01*dt)

    if (hitcount>=10) {
        state="retreat"
        vulnerable=false
    }
}

//attack 2 pinch mode
if (state="roam2") {
    move_towards_point(Player.x,Player.y,2*dt)
    angle-=angle_difference(point_direction(x,y,Player.x,Player.y)+90+sin(t/6)*5,angle)*(dt/10)
    angle2=-lengthdir_x(40,angle)
    x+=random_range(-2,2)
    y+=random_range(-2,2)

    vulnerable=true
    lightf=max(0,lightf-0.01*dt)

    if (hitcount>=10) {
        state="retreat"
        vulnerable=false
    }
}

//return to center
if (state="retreat") {
    move_towards_point(xstart,ystart,3*dt)
    angle-=angle_difference(0,angle)*(dt/20)

    if (point_distance(x,y,xstart,ystart)<2) {
        angle=0
        state="menacing"
        t=0
        speed=0
    }
}
