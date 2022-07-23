///room_find(name)
var rm;

rm=room_first

do {
    if (room_get_name(rm)==argument0) return rm
    rm=room_next(rm)
} until !room_exists(rm)

return noone
