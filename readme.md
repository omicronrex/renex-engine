# renex engine

This is a fork of 'i wanna be the engine yuuutu edition ver2.17' with various
improvements and new features. Designed with and for Game Maker 8.2.

[Discord server](http://discord.gg/aWh9rFDHDA)

## Extensions

The engine depends on five extensions:

- Game Maker 8.2 Core S 1.2.6 stable
- Game Maker 8.2 Networking S 1.0.0 stable
- Game Maker 8.2 Joystick S 1.0.4 stable
- Game Maker 8.2 Sound S 1.1.5 stable
- High Resolution Timer 1.0

Simply install them from the included folder. The "S" stands for Stable, which
are versions of the extensions that can be used alongside the dev versions. This
should ensure that, in the case of breaking changes to my extensions in the
future, the engine will still work fine.

## Using vanilla Game Maker 8.1

Place the included winspool.drv in your Game_Maker.exe folder. This will change
the functionality of the "software vertex processing" checkbox in global game
settings to instead reverse the order of creation events. This is a component of
Game Maker 8.2 which is which is necessary for the engine to work properly.
