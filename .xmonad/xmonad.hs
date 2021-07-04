-- XMonad config file
-- Author: Aziz Fouché @risitop
-- 2021

import XMonad
import Data.Default
import System.Exit
import System.IO (hPutStrLn)

import XMonad.Actions.CopyWindow (kill1)
import XMonad.Config.Azerty
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Prompt.ConfirmPrompt
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run (spawnPipe)


-- Externals

myTerminal = "urxvt"
myXMobarPath = "/home/risitop/.config/xmobar/.xmobarrc"


-- Layout

myLayout = avoidStruts $
  spacingRaw True (Border 10 10 10 10) True (Border 10 10 10 10) True $
  gaps [(U,10), (D,10), (R,10), (L,10)] $
  Tall 1 (3/100) (1/2)

myBorderWidth = 3
myNormColor = "#222222"
myFocusColor = "#E5A800"


-- Key bindings

myModMask = mod4Mask

myKeysRemoved =
  [ -- Window/session closing
    "M-S-" ++ [c] | c <- ['c', 'q']
  ]

myKeys =

  -- Core
  [ ("M-d", spawn "dmenu_run")
  , ("M-<Return>", spawn "urxvt")
  , ("M-S-q", kill1)
  , ("M-S-<Delete>", io exitSuccess)

  -- System
  , ("<XF86AudioMute>", spawn "amixer set Master toggle")
  , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%- unmute")
  , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+ unmute")
  , ("<XF86Search>", spawn "brave www.google.fr")
  , ("<Print>", spawn "~/.utils/rsscrot/screenshot.sh")

  -- Quick start
  , ("M-S-<F1>", spawn "emacs")
  , ("M-S-<F2>", spawn "brave")
  , ("M-S-<F3>", spawn "discord")
  , ("M-S-<F4>", spawn "urxvt -e ranger")
  , ("M-S-<F5>", spawn "brave www.youtube.com")
  , ("M-S-<F6>", spawn "brave www.twitch.tv")
  ]


-- Workspaces

myWorkspaces = [ "1", "2", "3", "4", "5", "6", "7", "8", "9" ]



-- Startup actions

myStartupHook = do
  spawnOnce "setxkbmap fr -option \"caps:swapescape\" &"
  spawnOnce "xrandr --output DP-4 --mode 2560x1440 --primary"
  spawnOnce "xrandr --output DP-2 --mode 2560x1440 --right-of DP-4"
  spawnOnce "nitrogen --restore &"
  spawnOnce "kilall picom; picom -f &"


-- Main
main = do
  xmproc0 <- spawnPipe ("xmobar -x 0 " ++ myXMobarPath)
  xmproc1 <- spawnPipe ("xmobar -x 1 " ++ myXMobarPath)
  xmonad $ docks azertyConfig
    { terminal = myTerminal
    , modMask = myModMask
    , startupHook = myStartupHook
    , layoutHook = myLayout
    , borderWidth = myBorderWidth
    , normalBorderColor = myNormColor
    , focusedBorderColor = myFocusColor
    , workspaces = myWorkspaces
    , logHook = dynamicLogWithPP $ xmobarPP
      {
        ppOutput = \x -> hPutStrLn xmproc0 x >> hPutStrLn xmproc1 x
        , ppCurrent = xmobarColor "#FFEE00" "" . wrap "[" "]"
        , ppVisible = xmobarColor "#FFEE00" "" . wrap " " " "
        , ppHidden = xmobarColor "#DA8CE6" "" . wrap " " " "
        , ppHiddenNoWindows = xmobarColor "#999999" "" . wrap " " " "
        , ppTitle = xmobarColor "#EC9607" "" . shorten 60
        , ppSep =  "<fc=#bbbbbb> | </fc>"
        , ppUrgent = xmobarColor "#ff6161" "" . wrap "!" "!"
        , ppOrder  = \(ws:_:t:_) -> [ws,t]
      }
    }
    `removeKeysP` myKeysRemoved
    `additionalKeysP` myKeys
