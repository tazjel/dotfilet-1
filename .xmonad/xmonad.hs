import System.IO

import XMonad
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run(spawnPipe)
import qualified XMonad.StackSet as W
import qualified Data.Map as M

main = do
	xmobarproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobar.hs"
	xmonad $ defaultConfig {
	  terminal = "/usr/bin/urxvt"
	  , layoutHook = avoidStruts $ layoutHook defaultConfig
	  , startupHook = setWMName "LG3D"
	  , manageHook = myManageHook <+> manageDocks
	  , keys = \c -> myKeys c `M.union` keys defaultConfig c
	  , logHook = dynamicLogWithPP $ xmobarPP
		{
		ppOutput = hPutStrLn xmobarproc
		}
	}

myManageHook = composeAll 
	[ 
	  isFullscreen --> doFullFloat
	]

myKeys (XConfig {modMask = modMask}) = M.fromList $
	[
	  ((modMask, xK_b), sendMessage ToggleStruts)
	]
