import XMonad
import XMonad.Config.Gnome
import XMonad.Util.EZConfig
import XMonad.Hooks.SetWMName
 
main = xmonad $ gnomeConfig
	{ modMask = mod4Mask
	, startupHook = startupHook gnomeConfig >> setWMName "LG3D"
	}
