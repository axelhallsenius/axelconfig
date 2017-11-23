import XMonad
import XMonad.Actions.GridSelect
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Layout.Magnifier
import XMonad.Layout.NoBorders
import XMonad.Layout.Grid
import XMonad.Prompt
import XMonad.Prompt.Shell
import qualified XMonad.Actions.Submap as SM
import qualified XMonad.Actions.Search as S
import Data.Monoid
import System.IO
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    -- shellPrompt
    , ((modm,               xK_p     ), shellPrompt defaultXPConfig)
    -- launch gmrun
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")
    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)
    -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)
    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)
    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)
    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)
    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )
    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )
    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)
    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)
    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)
    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    , ((modm              , xK_b     ), sendMessage ToggleStruts)
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "killall trayer; xmonad --recompile; xmonad --restart")
    ]
    ++
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
    ++
    -- GridSelect
    [((modm, xK_g), goToSelected defaultGSConfig)]
    ++
    -- Magnifier
    [ ((modm .|. controlMask          , xK_semicolon), sendMessage MagnifyMore)
    , ((modm .|. controlMask              , xK_minus), sendMessage MagnifyLess)
    , ((modm .|. controlMask              , xK_o    ), sendMessage ToggleOff  )
    , ((modm .|. controlMask .|. shiftMask, xK_o    ), sendMessage ToggleOn   )
    , ((modm .|. controlMask              , xK_m    ), sendMessage Toggle     )    
    ]
    ++
    -- Search
    [((modm, xK_s), SM.submap $ searchEngineMap $ S.selectSearch)
    , ((modm .|. shiftMask, xK_s), SM.submap $ searchEngineMap $ S.promptSearch defaultXPConfig)]

alc, rakuten :: S.SearchEngine
alc = S.searchEngine "alc" "http://eow.alc.co.jp/search?q="
rakuten = S.searchEngine "rakuten" "http://websearch.rakuten.co.jp/?tool_id=1&rid=2000&qt="

searchEngineMap :: (Num t, Ord t) => (S.SearchEngine -> a) -> M.Map (t, KeySym) a
searchEngineMap method = M.fromList $
                         [ ((0, xK_g), method S.google)
                         , ((0, xK_h), method S.hoogle)
                         , ((0, xK_w), method S.wikipedia) 
                         , ((0, xK_a), method alc)
                         , ((0, xK_r), method rakuten) ]

------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
myMouseBindings :: XConfig t -> M.Map (KeyMask, Button) (Window -> X ())
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:
myLayout = magnifiercz 1.2 $ withBorder 1 (tiled ||| Mirror tiled ||| Grid) ||| Full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:
myManageHook :: Query (Endo WindowSet)
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

defaults = defaultConfig {
      -- simple stuff
        terminal           = "mlterm",
        focusFollowsMouse  = True,
        borderWidth        = 0,
        modMask            = mod3Mask,
        workspaces         = ["1","2","3","4","5","6","7","8","9"],
        normalBorderColor  = "#dddddd",
        focusedBorderColor = "#f26711",

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = mempty,
        startupHook        = return ()
    }

main :: IO ()
main = do
  -- exec other process
  spawn "Esetroot -scale /home/kiwamu/wallpapers/4xmonad.png"
  spawn "trayer --edge top --align right --SetDockType true --SetPartialStrut false --expand true --width 25 --transparent true --tint 0x000000 --height 19"
  spawn "wicd-client -t"
  spawn "nm-applet --sm-disable"
  spawn "bluetooth-applet"
  spawn "xmodmap /home/kiwamu/.Xmodmap"
  spawn "dropbox start"
  spawn "skype"
  spawn "xscreensaver -no-splash"
  spawn "/usr/lib/notification-daemon/notification-daemon"
  xmproc <- spawnPipe "xmobar"
  -- start xmonad
  xmonad $ defaults {
    manageHook = manageDocks <+> manageHook defaults,
    layoutHook = avoidStruts  $  layoutHook defaults,
    logHook = dynamicLogWithPP xmobarPP {
      ppOutput = hPutStrLn xmproc,
      ppTitle = xmobarColor "green" "" . shorten 50
      }}
