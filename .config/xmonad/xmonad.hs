import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Layout.LayoutModifier
import XMonad.Layout.LimitWindows
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns
import XMonad.Util.ClickableWorkspaces
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce
import XMonad.Util.Loggers

color1 = "#B48EAD"
color2 = "#81A1C1"
color3 = "#ECEFF4"
color4 = "#BF616A"
color5 = "#4C566A"
color6 = "#2E3440"
color7 = "#8FBCBB"

myWorkspaces = [" dev ", " www ", " chat ", " gfx ", " sys ", " wtv "]

myBrowser = "google-chrome-stable"
myTerminal = "alacritty"

myNormalColor = color6
myFocusColor = color7
myBorderWidth = 2

myStartupHook = do
  spawn "xsetroot -cursor_name left_ptr"
  spawn "nitrogen --restore"

myXmobarPP = def
  { ppCurrent = xmobarColor color1 "" . wrap ("<box type=Bottom width=2 mb=2 color=" ++ color1 ++ ">") "</box>"
  , ppHidden = xmobarColor color2 "" . wrap ("<box type=Top width=2 mt=2 color=" ++ color2 ++ ">") "</box>"
  , ppHiddenNoWindows = xmobarColor color2 ""
  , ppTitle = xmobarColor color3 ""
  , ppUrgent = xmobarColor color4 ""
  , ppSep = "<fc=" ++ color5 ++ "> | </fc>"
  }

myLayoutHook = avoidStruts $ withBorder myBorderWidth tall ||| withBorder myBorderWidth threeCol ||| noBorders full
  where
    tall = renamed [Replace "tall"]
      $ smartBorders
      $ limitWindows 3
      $ mySpacing 3
      $ Tall 1 (3/100) (1/2)
    threeCol = renamed [Replace "threeCol"]
      $ smartBorders
      $ limitWindows 5
      $ mySpacing 3
      $ ThreeColMid 1 (3/100) (1/2)
    full = renamed [Replace "full"]
      $ smartBorders
      $ Full
    mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

main = xmonad
  . ewmhFullscreen
  . ewmh
  . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey
  $ myConfig

myConfig = def
    { borderWidth = myBorderWidth
    , focusedBorderColor = myFocusColor
    , layoutHook = myLayoutHook
    , modMask = mod4Mask
    , normalBorderColor = myNormalColor
    , startupHook = myStartupHook
    , terminal = myTerminal
    , workspaces = myWorkspaces
    }
  `additionalKeys`
    [ ((mod4Mask, xK_w), spawn myBrowser)
    , ((mod4Mask, xK_f), spawn "flameshot gui")
    , ((0, 0x1008ff13), spawn "amixer -q sset Master 5%+")
    , ((0, 0x1008ff11), spawn "amixer -q sset Master 5%-")
    , ((0, 0x1008ff12), spawn "amixer -q sset Master toggle")
    ]
