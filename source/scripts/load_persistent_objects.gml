//you can add object variables here to make them persist across reloads

with (PushBlockSave) if (get_objsave()) {
    x=read_objsave()
    y=read_objsave()
end_objsave()}

with (TrapSave) if (get_objsave()) {
    x=read_objsave()
    y=read_objsave()
    hspeed=read_objsave()
    vspeed=read_objsave()
    image_xscale=read_objsave()
    image_yscale=read_objsave()
    image_angle=read_objsave()
end_objsave()}
