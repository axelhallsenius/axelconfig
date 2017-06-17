import XMonad
import XMonad.Config.Desktop

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

{-
main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , terminal = "urxvt"
				, borderWidth = 0
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        ]
-}

main = do
  xmonad =<< statusBar "xmobar" myPP toggleStrutsKey defaultConfig
    { terminal           = "urxvt"
    , focusFollowsMouse  = True
    , clickJustFocuses   = False
    , borderWidth        = 0
    , modMask            = mod4Mask
    --, workspaces         = myworkspaces
    , normalBorderColor  = "#dddddd"
    , focusedBorderColor = "#00dd00"
    , manageHook         = mymanager
    --, startupHook        = setWMName "LG3D"
    }

myPP = xmobarPP { ppOutput          = putStrLn
                , ppCurrent         = xmobarColor "#6699cc" ""  . wrap "➤" ""
                --, ppHiddenNoWindows = xmobarColor "grey" ""
                , ppTitle           = xmobarColor "#99cc99"  "" . shorten 20
                , ppLayout          = shorten 6
                --, ppVisible         = wrap "(" ")"
                , ppUrgent          = xmobarColor "red" "yellow"
                }

toggleStrutsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)

mymanager = composeAll
  [ className =? "gimp" --> doFloat
  , className =? "vlc"  --> doFloat
  ]
