//called in the vehicle object - enables the vehicle

with (SuperVehicle) if (active) exit

if (other.id!=self.id) passenger=other.id else passenger=Player.id
event_trigger(ev_mount)
