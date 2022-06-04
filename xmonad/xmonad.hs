import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

main = xmonad . ewmh =<< xmobar myConfig

myConfig = def
    { modMask = mod4Mask
    }
  `additionalKeysP`
    [ ("M-f", spawn "firefox")
    , ("M-e", spawn "emacs")
    , ("M-C-s", unGrab *> spawn "scrot -s")
    ]
