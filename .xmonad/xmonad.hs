import XMonad
import qualified XMonad.Config.Gnome as Gnome
import qualified XMonad.Util.EZConfig as EZ
import qualified XMonad.Actions.PhysicalScreens as Physical
import qualified XMonad.StackSet as W
import XMonad.Layout.PerWorkspace (onWorkspaces)
import XMonad.Layout (Tall(..))
import XMonad.Layout.Reflect (reflectHoriz, REFLECTY(..))
import XMonad.Layout.MultiToggle (single, Toggle(..), mkToggle)
import XMonad.Hooks.ManageDocks (avoidStruts)

main = xmonad conf
    where
    leftSpaces = take 4 (workspaces conf)
    rightSpaces = drop 4 (workspaces conf)
    layoutHook = onWorkspaces leftSpaces (reflectHoriz layout) 
               $ layout
    layout = avoidStruts (Tall 1 (3/100) (1/2) ||| Full)
    conf = Gnome.gnomeConfig { modMask = mod4Mask, layoutHook = layoutHook } `EZ.additionalKeys` keys'
    keys' = [ ((mod4Mask, xK_backslash), spawn "google-chrome-stable --profile-directory=\"Default\"")
            , ((mod4Mask .|. shiftMask, xK_backslash), spawn "google-chrome-stable --profile-directory=\"Profile 1\"")
            , ((mod4Mask, xK_slash), sendMessage $ Toggle REFLECTY)
            , ((0, xK_F12), spawn "gnome-screensaver-command --lock")
            ]
          -- screen 0 keys 1-4
          ++ concat (zipWith (switchKeys 0) leftSpaces  [xK_1..xK_4])
          -- screen 1 keys 5-9
          ++ concat (zipWith (switchKeys 1) rightSpaces [xK_5..xK_9])
    switchKeys scr i k = [ ((modMask conf, k), goWS)
                         , ((modMask conf .|. shiftMask, k), windows (W.shift i) >> goWS) ]
      where
      goWS = Physical.viewScreen (Physical.P scr) >> windows (W.greedyView i)
