import XMonad
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Spacing
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

colorScheme = "doom-one"
colorBlack = "#282c34"
colorFore = "#bbc2cf"
color01 = "#1c1f24"
color02 = "#ff6c6b"
color03 = "#98be65"
color04 = "#da8548"
color05 = "#51afef"
color06 = "#c678dd"
color07 = "#5699af"
color08 = "#202328"
color09 = "#5b6268"
color10 = "#da8548"
color11 = "#4db5bd"
color12 = "#ecbe7b"
color13 = "#3071db"
color14 = "#a9a1e1"
color15 = "#46d9ff"
color16 = "#dfdfdf"

myFont :: String
myFont = "xft:Fira Code Nerd Font:regular:size=9:antialias=true:hinting=true"

myModMask :: KeyMask
myModMask = mod4Mask

myEmacs :: String
myEmacs = "emacsclient --create-frame --socket-name='emacs' "

myTerminal :: String
myTerminal = myEmacs ++ "--eval '(vterm)'"

myBrowser :: String
myBrowser = "google-chrome-stable"

myBorderWidth :: Dimension
myBorderWidth = 2

myNormalColor :: String
myNormalColor = colorBlack

myFocusColor :: String
myFocusColor = color15

myStartupHook :: X ()
myStartupHook = do
    spawn "/usr/bin/emacs --daemon=emacs"

mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

mySpacing' :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing' i = spacingRaw True (Border i i i i) True (Border i i i i) True

myConfig = def
    { modMask = myModMask
    , terminal = myTerminal
    , startupHook = myStartupHook
    , borderWidth = myBorderWidth
    }
  `additionalKeysP`
    [ ("M-w", spawn myBrowser)
    , ("M-e e", spawn myEmacs)
    , ("M-e d", spawn (myEmacs ++ "--eval '(dired nil)'"))
    , ("M-C-s", unGrab *> spawn "scrot -s")
    ]

main :: IO ()
main = xmonad . ewmh =<< xmobar myConfig
