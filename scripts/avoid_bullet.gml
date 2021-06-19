///avoid_bullet(tag,x,y,bullet,direction,speed,[count,countangle])

//will create [count] [bullet]s, spread around [countangle],
//moving towards [direction] at [speed] with the [tag].

var tag,cx,cy,bullet,dir,spd,count,angle, i,o,b;

tag=argument0
cx=argument1
cy=argument2
bullet=argument3
dir=argument4
spd=argument5
count=1
angle=0

if (argument_count==7) {
    count=argument[6]
    angle=argument[7]/count
}

b=ds_map_find_value(global.bullet_map,bullet)

for (i=0;i<count;i+=1) {
    o=instance_create(cx,cy,bullet_table[b,bul_object])
    o.tag=tag

    o.friction          =bullet_table[b,bul_friction]
    o.gravity_direction =bullet_table[b,bul_accdir  ]
    o.gravity           =bullet_table[b,bul_accspd  ]
    o.sprite_index      =bullet_table[b,bul_sprite  ]
    o.image_index       =bullet_table[b,bul_image   ]
    o.image_speed       =bullet_table[b,bul_animspd ]
    o.image_blend       =bullet_table[b,bul_color   ]
    o.depth             =bullet_table[b,bul_depth   ]
    o.direction         =dir+random_range(-bullet_table[b,bul_createcone],bullet_table[b,bul_createcone])+i*angle
    o.speed             =spd

    o.turn          =bullet_table[b,bul_curve       ]
    o.alpha_speed   =bullet_table[b,bul_alphaspd    ]
    o.life          =bullet_table[b,bul_lifespan    ]
    o.turnobj       =bullet_table[b,bul_transform   ]
    o.turncount     =bullet_table[b,bul_transcount  ]
    o.wiggle        =bullet_table[b,bul_wigglecone  ]
    o.rotfree       =bullet_table[b,bul_rotfree     ]
    o.rotamount     =bullet_table[b,bul_rotamount   ]
    o.wrap          =bullet_table[b,bul_wrap        ]
    o.die           =bullet_table[b,bul_dieoutside  ]
    o.bounce        =bullet_table[b,bul_bounce      ]

    if (bullet_table[b,bul_blend]=bm_add) o.depth=-1000
}
