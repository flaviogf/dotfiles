import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

myFont :: String
myFont = "xft:Fira Code Nerd Font:regular:size=9:antialias=true:hinting=true"

myModMask :: KeyMask
myModMask = mod4Mask

myTerminal :: String
myTerminal = ""

myBrowser :: String
myBrowser = "google-chrome-stable"

myEmacs :: String
myEmacs = "emacsclient -c -s 'emacs'"

myConfig = def
    { modMask = myModMask
    }
  `additionalKeysP`
    [ ("M-f", spawn "firefox")
    , ("M-e", spawn "emacs")
    , ("M-C-s", unGrab *> spawn "scrot -s")
    ]

main = xmonad . ewmh =<< xmobar myConfig
