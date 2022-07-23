if (argument0=="mask") {
    script_execute(skin_default,"mask")
}

if (argument0=="step") {
    script_execute(skin_default,"step")
}

if (argument0=="draw") {
    d3d_set_fog(1,$ffffff,0,0)
    script_execute(skin_default,"draw")
    d3d_set_fog(0,0,0,0)

    if (dot_hitbox) {
        draw_sprite(sprDotKid,0,floor(drawx),floor(drawy))
    }
}
