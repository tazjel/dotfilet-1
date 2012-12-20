import XMonad
import XMonad.Util.EZConfig
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run(spawnPipe)
import qualified XMonad.StackSet as W

main = do
	xmobarproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobar.hs"
	xmonad $ defaultConfig {
	  startupHook = setWMName "LG3D"
	  , manageHook = myManageHook
	}

myManageHook = composeAll
	[ 
	  isFullscreen --> doFullFloat
	  , (role =? "gimp-toolbox" <||> role =? "gimp-image-window") --> (ask >>= doF . W.sink)
	]
	where role = stringProperty "WM_WINDOW_ROLE"
