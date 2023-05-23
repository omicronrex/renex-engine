///shader_unpack(shader)
var shader,file;

if (!ds_map_exists(global.shadermap,argument0)) {
    shader=script_execute(argument0)
    dsmap(global.shadermap,argument0,shader)
} else shader=dsmap(global.shadermap,argument0)

return shader
