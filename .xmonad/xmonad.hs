import XMonad
import qualified XMonad.Config.Gnome as Gnome
import qualified XMonad.Util.EZConfig as EZ
import qualified XMonad.Actions.PhysicalScreens as Physical
import qualified XMonad.StackSet as W

main = xmonad conf
    where
    conf = Gnome.gnomeConfig { modMask = mod4Mask } `EZ.additionalKeys` keys'
    keys' = [ ((mod4Mask, xK_backslash), spawn "google-chrome-beta --profile-directory=\"Default\"")
            , ((mod4Mask .|. shiftMask, xK_backslash), spawn "google-chrome-beta --profile-directory=\"Profile 1\"") ]
          -- screen 0 keys 1-4
          ++ [ ((m .|. modMask conf, k), Physical.viewScreen (Physical.P 0) >> windows (f i))
             | (i, k) <- zip (workspaces conf) [xK_1..xK_4]
             , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask) ] ]
          -- screen 1 keys 5-9
          ++ [ ((m .|. modMask conf, k), Physical.viewScreen (Physical.P 1) >> windows (f i))
             | (i, k) <- zip (drop 4 (workspaces conf)) [xK_5..xK_9]
             , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask) ] ]
