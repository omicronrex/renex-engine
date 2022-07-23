//save collected items
with (Item) {
    if (collected && !gottem) {
        savedata(itemid,1)
        gottem=1
    }
}
