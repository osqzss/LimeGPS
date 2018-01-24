# Adding gamepad support to LimeGPS

__libgamepad__ is a cross-platform API for gamepad access developed by Michael Williams.
https://github.com/mtwilliams/libgamepad

1. Activate gamepad support by defining the __USE_GAMEPAD__ preprocessor symbol in limegps.h.
2. Add the paths to the following folder in `Configuration Properties -> Linker -> General -> Additional Library Directories`:
 * __./libgamepad__ for GamePad.lib
3. Specify the name of the additional librarie in `Configuration Properties -> Linker -> Input -> Additional Dependencies`:
 * __GamePad.lib__ 
4. Rebuild the project.
5. Put the copies of the following DLL in the same folder to run the code:
* __GamePad.dll__
