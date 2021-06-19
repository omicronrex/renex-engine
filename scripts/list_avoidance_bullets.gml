//you can create engine-bullet types here.

//they're all handled by the same parent object, and will respond to
//commands issued using the command_ scripts with their tags.

bullet_create("cherry")
    bullet_sprite(sprCherry,0,0.2,0,10,$ffffff,false)   ///bullet_sprite(sprite,image,animspd,alphaspd,depth,color,additive)
    bullet_motion(0,0,0,0,true,0)                       ///bullet_motion(friction,curve,acceldir,accelspd,rotfree,rotamount)
    bullet_spread(0,0)                                  ///bullet_spread(createcone,wigglecone)
    bullet_life(0,"",0,true)                           ///bullet_life(lifespan,transformbullet,transformcount,dieoutside)
    bullet_behavior(false,false,false)                  ///bullet_behavior(wraph,wrapv,bouncing)
    bullet_stepcode("")                                 ///bullet_stepcode(string)
