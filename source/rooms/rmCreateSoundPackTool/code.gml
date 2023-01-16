//drag this room to the top to use it
show_message("This room can create packs out of sound folders.##Please select the sound folder:")
src=filename_dir(get_save_filename("renex engine sounds folder|*.*","please select the sounds folder"))
show_message("Please select the destination pack file:")
dst=get_save_filename("WASD sound packs|*.wasd","sounds.wasd")
sound_create_pack(src,dst)
game_end()
