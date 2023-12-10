//this is a list of the available inputs in the game
//duplicate any of them to add a new virtual input

input_add(key_left    ,"Left"    ,vk_left  )
input_add(key_right   ,"Right"   ,vk_right )
input_add(key_up      ,"Up"      ,vk_up    )
input_add(key_down    ,"Down"    ,vk_down  )
input_add(key_jump    ,"Jump"    ,vk_shift )
input_add(key_shoot   ,"Shoot"   ,"z"      )
input_add(key_restart ,"Restart" ,"r"      )
input_add(key_pause   ,"Pause"   ,"p"      )
input_add(key_skip    ,"Skip"    ,"s"      )
input_add(key_die     ,"Die"     ,"q"      )

//in order to remove an input from the game,
//comment the add above and make it return 0
