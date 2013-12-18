import XMonad
import XMonad.Config.Gnome
import XMonad.Util.EZConfig

main = xmonad $ gnomeConfig { modMask = mod4Mask
                            }
                `additionalKeys`
                [ ((mod4Mask .|. shiftMask, xK_backslash), spawn "google-chrome-beta") ]
