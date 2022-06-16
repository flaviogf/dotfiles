import qualified Data.Map as M

import XMonad
import qualified XMonad.StackSet as W
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.LayoutModifier
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import XMonad.Util.Run
import XMonad.Util.Ungrab
import XMonad.Util.SpawnOnce

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

myBorderWidth :: Dimension
myBorderWidth = 2

myBrowser :: String
myBrowser = "google-chrome-stable"

myEmacs :: String
myEmacs = "emacsclient --socket-name='emacs' "

myFocusColor :: String
myFocusColor = color15

myFont :: String
myFont = "xft:Mononoki Nerd Font:regular:size=9:antialias=true:hinting=true"

myModMask :: KeyMask
myModMask = mod4Mask

myNormColor :: String
myNormColor = colorBack

myTerminal :: String
myTerminal = "alacritty"

myWindowCount :: X (Maybe String)
myWindowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

myLayoutHook = avoidStruts
               $ withBorder myBorderWidth
               $ renamed [Replace "Tall"]
               $ mySpacing 4
               $ ResizableTall 1 (3/100) (1/2) []
             where
               mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

myWorkspaces = [" dev ", " www ", " chat ", " mus ", " vid ", " sys "]

main = do
    h <- spawnPipe "xmobar"
    xmonad $ ewmh def
        { borderWidth = myBorderWidth
        , focusedBorderColor = myFocusColor
        , handleEventHook = docksEventHook
        , layoutHook = myLayoutHook
        , logHook = dynamicLogWithPP $ xmobarPP
              { ppOutput = hPutStrLn h
              , ppCurrent = xmobarColor color06 "" . wrap ("<box type=Bottom width=2>") "</box>"
              , ppVisible = xmobarColor color06 ""
              , ppHidden = xmobarColor color05 "" . wrap "<box type=Top width=2>" "</box>"
              , ppHiddenNoWindows = xmobarColor color05 "" . wrap "" ""
              , ppTitle = xmobarColor color16 "" . shorten 60
              , ppSep = "<fc=" ++ color09 ++ "> <fn=2>\x7c</fn> </fc>"
              , ppExtras = [myWindowCount]
              , ppOrder = \(ws:_:t:ex) -> [ws]++ex++[t]
              }
        , manageHook = manageDocks
        , modMask = myModMask
        , normalBorderColor = myNormColor
        , terminal = myTerminal
        , workspaces = myWorkspaces
        }
      `additionalKeysP`
        [ ("M-C-s", unGrab *> spawn "scrot -s")
        , ("M-e d", spawn (myEmacs ++ "--create-frame --eval '(dired nil)'"))
        , ("M-e k", spawn (myEmacs ++ "--eval '(kill-emacs)'"))
        , ("M-c", spawn (myTerminal ++ " -e castero"))
        , ("M-w", spawn myBrowser)
        , ("M-p", spawn "rofi -show drun")
        ]
