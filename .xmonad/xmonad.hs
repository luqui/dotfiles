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
import XMonad.Layout.LayoutScreens (layoutSplitScreen)
import XMonad.Layout.TwoPane (TwoPane(..))

main = xmonad conf
    where
    leftSpaces = map (("left"++).show) [1..4]
    rightSpaces = map (("right"++).show) [1..5]
    orgSpace = "org"
    workspaces = leftSpaces ++ rightSpaces ++ [orgSpace]
    layoutHook = onWorkspaces leftSpaces (reflectHoriz layout) $ layout
    layout = avoidStruts (Tall 1 (3/100) (1/2) ||| Full)
    startupHook = do
      rescreen
      Physical.viewScreen (Physical.P 1)
      layoutSplitScreen 2 (TwoPane 0.85 0.15)
    conf = Gnome.gnomeConfig { 
              modMask = mod4Mask, 
              layoutHook = layoutHook,
              startupHook = startupHook,
              workspaces = workspaces
            } `EZ.additionalKeys` keys'
    keys' = [ ((mod4Mask .|. shiftMask .|. mod1Mask, xK_Return), spawn "gnome-terminal") -- "override terminal"
            , ((mod4Mask .|. shiftMask, xK_Return), spawn "google-chrome-stable --profile-directory=\"Default\" --app-id=pnhechapfaindjhompbnflcldabbghjo") -- chrome terminal app
            , ((mod4Mask, xK_backslash), spawn "google-chrome-stable --profile-directory=\"Default\"")
            , ((mod4Mask .|. shiftMask, xK_backslash), spawn "google-chrome-stable --profile-directory=\"Profile 1\"")
            , ((0, xK_F12), spawn "gnome-screensaver-command --lock")
            ]
          -- screen 0 keys 1-4
          ++ concat (zipWith (switchKeys 0) leftSpaces  [xK_1..xK_4])
          -- screen 1 keys 5-9
          ++ concat (zipWith (switchKeys 2) rightSpaces [xK_5..xK_9])
          ++ [ ((modMask conf .|. shiftMask, xK_0), windows (W.shift orgSpace) >> goWS 1 orgSpace) ]
    switchKeys scr i k = [ ((modMask conf, k), goWS scr i)
                         , ((modMask conf .|. shiftMask, k), windows (W.shift i) >> goWS scr i) ]
    goWS scr i = Physical.viewScreen (Physical.P scr) >> windows (W.greedyView i)
