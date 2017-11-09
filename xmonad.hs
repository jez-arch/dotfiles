import XMonad
import XMonad.Config
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Actions.SpawnOn
import XMonad.Layout.Spiral
import System.IO

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myConfig = defaultConfig
   { terminal    = myTerminal
   , modMask     = myModMask
   , workspaces  = myWorkspaces
   , borderWidth = myBorderWidth
   , layoutHook  = myLayoutHook  
   , manageHook  = myManageHook 
   , startupHook = myStartupHook
   }

myTerminal    = "xterm"
myModMask     = mod4Mask
myWorkspaces  = ["Term","Web","Music","Files"]
myBorderWidth = 0
myBar         = "/usr/bin/xmobar"
myPP          = xmobarPP { ppCurrent = xmobarColor "#ee9a00" "" . wrap "<" ">"
                         , ppTitle = xmobarColor "#1793D1" "" . shorten 40
                         }
 
myLayoutHook  = avoidStruts $ myLayout layoutHook defaultConfig
myManageHook  = manageHook defaultConfig <+> manageDocks
myLayout      = spiral (6/7) ||| Full 
myStartupHook = do spawnOn "Term" "xterm" 


toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b) 
