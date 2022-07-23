//you can add object variables here to make them persist across reloads

instance_activate_object(PushBlockSave)
instance_activate_object(TrapSave)

with (PushBlockSave) {set_objsave()
    write_objsave(x)
    write_objsave(y)
end_objsave()}

with (TrapSave) {set_objsave()
    write_objsave(x)
    write_objsave(y)
    write_objsave(hspeed)
    write_objsave(vspeed)
    write_objsave(image_xscale)
    write_objsave(image_yscale)
    write_objsave(image_angle)
end_objsave()}

update_activation()
