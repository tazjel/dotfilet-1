import XMonad
import XMonad.Util.EZConfig
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run(spawnPipe)
import qualified XMonad.StackSet as W

main = do
	xmobarproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobar.hs"
	xmonad $ defaultConfig {
	  terminal = "/usr/bin/urxvt"
	  , startupHook = setWMName "LG3D"
	  , manageHook = myManageHook
	}

myManageHook = composeAll
	[ 
	  isFullscreen --> doFullFloat
	]
