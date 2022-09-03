///camera_get_zoom()
//returns the current zoom level

if (World.camera_initialised) return World.proj_z
return mean(view_wview/global.width,view_hview/global.height)
