import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

main = xmonad $ def
    { modMask = mod4Mask
    }
  `additionalKeysP`
    [ ("M-f", spawn "firefox")
    , ("M-e", spawn "emacs")
    ]
