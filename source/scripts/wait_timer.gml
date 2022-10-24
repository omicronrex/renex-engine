current_timer+=argument0
return (timer>=current_timer && (oldtimer<current_timer || (timer<oldtimer && (current_timer>oldtimer || current_timer<=timer))))
