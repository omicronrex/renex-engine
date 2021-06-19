///bullet_stepcode(string)
//if you use stepcode, we precompile it for speed
var b,o;

b=bullet_table[0]

o=object_add()
bullet_table[b,bul_object]=o

object_set_parent(o,AvoidBullet)
object_event_add(o,ev_step,ev_step_normal,"event_inherited();"+argument0)
