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
          ++ concat (zipWith (switchKeys 0) (workspaces conf) [xK_1..xK_4])
          ++ concat (zipWith (switchKeys 1) (drop 4 (workspaces conf)) [xK_5..xK_9])
    switchKeys scr i k = [ ((modMask conf, k), goWS)
                         , ((modMask conf .|. shiftMask, k), windows (W.shift i) >> goWS) ]
      where
      goWS = Physical.viewScreen (Physical.P scr) >> windows (W.greedyView i)
