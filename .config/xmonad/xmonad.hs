import XMonad

import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

myBrowser :: String
myBrowser = "google-chrome-stable"

myTerminal :: String
myTerminal = "alacritty"

main :: IO ()

main = xmonad $ ewmhFullscreen $ ewmh $ def
    { modMask = mod4Mask
    , terminal = myTerminal
    }
  `additionalKeysP`
    [ ("M-w", spawn myBrowser)
    ]
