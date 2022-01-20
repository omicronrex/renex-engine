#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i=0;i<gizmos;i+=1)
    with (gizmolist[i])
        if (place_meeting(x,y,other.id))
            event_perform(ev_trigger,ev_traptriggered)
