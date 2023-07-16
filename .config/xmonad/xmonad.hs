import XMonad

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.LayoutModifier
import XMonad.Layout.LimitWindows
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
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

myLayoutHook = avoidStruts $ tall
  where
    tall = withBorder myBorderWidth $ limitWindows 4 $ mySpacing 4 $ Tall 1 (3/100) (1/2)

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "nitrogen --restore &"

main :: IO ()

main = xmonad $ ewmhFullscreen $ ewmh $ myConfig

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
