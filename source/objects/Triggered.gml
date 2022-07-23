#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i=0;i<gizmos;i+=1)
    with (gizmolist[i])
        if (instance_place(x,y,other.id))
            event_trigger(ev_traptriggered)
