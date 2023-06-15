var i;

//we can't intercept the projection before backgrounds are drawn,
//so instead we disable them and use the BackgroundDaemon to draw them correctly

with (BackgroundDaemon) event_user(0)

//we also make sure all system objects responsible for screen composition are in the right place
with (BackgroundDaemon) depth=10000001
with (Ortho) depth=10000002
with (World) depth=-10000000
with (global.screen_manager) depth=-10000001
