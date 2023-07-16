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
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce

myBrowser :: String
myBrowser = "google-chrome-stable"

myTerminal :: String
myTerminal = "alacritty"

myBorderWidth :: Dimension
myBorderWidth = 2

myNormalColor :: String
myNormalColor = "#2E3440"

myFocusColor :: String
myFocusColor = "#8FBCBB"

mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

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

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "nitrogen --restore &"

main :: IO ()

main = xmonad
  . ewmhFullscreen
  . ewmh
  . xmobarProp
  $ myConfig

myConfig = def
    { modMask = mod4Mask
    , layoutHook = myLayoutHook
    , startupHook = myStartupHook
    , terminal = myTerminal
    , borderWidth = myBorderWidth
    , normalBorderColor = myNormalColor
    , focusedBorderColor = myFocusColor
    }
  `additionalKeysP`
    [ ("M-w", spawn myBrowser)
    ]
