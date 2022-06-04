import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import qualified Data.Map as M

colorScheme = "dracula"
colorBack = "#282a36"
colorFore = "#f8f8f2"
color01="#000000"
color02="#ff5555"
color03="#50fa7b"
color04="#f1fa8c"
color05="#bd93f9"
color06="#ff79c6"
color07="#8be9fd"
color08="#bfbfbf"
color09="#4d4d4d"
color10="#ff6e67"
color11="#5af78e"
color12="#f4f99d"
color13="#caa9fa"
color14="#ff92d0"
color15="#9aedfe"
color16="#e6e6e6"

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
myNormalColor = colorBack

myFocusColor :: String
myFocusColor = color15

myStartupHook :: X ()
myStartupHook = do
    spawn "/usr/bin/emacs --daemon=emacs"

myWorkspaces = [" dev ", " www ", " chat "]
myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1..]

myConfig = def
    { modMask = myModMask
    , terminal = myTerminal
    , startupHook = myStartupHook
    , borderWidth = myBorderWidth
    , workspaces = myWorkspaces
    }
  `additionalKeysP`
    [ ("M-w", spawn myBrowser)
    , ("M-e e", spawn myEmacs)
    , ("M-e d", spawn (myEmacs ++ "--eval '(dired nil)'"))
    , ("M-C-s", unGrab *> spawn "scrot -s")
    ]

main :: IO ()
main = xmonad . ewmh =<< xmobar myConfig
