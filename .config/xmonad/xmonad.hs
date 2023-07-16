import XMonad

import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

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

main :: IO ()

main = xmonad $ ewmhFullscreen $ ewmh $ myConfig

myConfig = def
    { modMask = mod4Mask
    , terminal = myTerminal
    , borderWidth = myBorderWidth
    , normalBorderColor = myNormalColor
    , focusedBorderColor = myFocusColor
    }
  `additionalKeysP`
    [ ("M-w", spawn myBrowser)
    ]
