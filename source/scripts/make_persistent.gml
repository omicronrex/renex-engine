///make_persistent()
//makes an object persistent and deletes it when the room is changed

if !persistent {
    makepersistentroom = room
    persistent = true
    return false
} else {
    if room != makepersistentroom {
        instance_destroy()
        return false
    }
    return true
}
