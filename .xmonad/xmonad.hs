import XMonad
import XMonad.Config.Gnome
import XMonad.Util.EZConfig
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageHelpers
import qualified XMonad.StackSet as W

main = xmonad $ gnomeConfig
	{
	startupHook = startupHook gnomeConfig >> setWMName "LG3D"
	, manageHook = myManageHook
	}

myManageHook = composeAll
	[ manageHook gnomeConfig
	, isFullscreen --> doFullFloat
	, (role =? "gimp-toolbox" <||> role =? "gimp-image-window") --> (ask >>= doF . W.sink)
	]
	where role = stringProperty "WM_WINDOW_ROLE"
