import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { terminal    = "st"
        , modMask     = mod4Mask
        , borderWidth = 1
        , normalBorderColor  = "black"
        , focusedBorderColor = "black"
        , manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , handleEventHook = docksEventHook <+> handleEventHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
            { ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "white" "" . shorten 50
            }
        } `additionalKeys`
        [ ((mod1Mask .|. controlMask, xK_l), spawn "mpc pause; slock")
        , ((mod4Mask, xK_f), sendMessage ToggleStruts)
        , ((0, 0x1008ff11), spawn "amixer set Master 2%-")
        , ((controlMask, 0x1008ff11), spawn "amixer -c 1 set PCM 2%-")
        , ((0, 0x1008ff12), spawn "amixer set Master toggle")
        , ((0, 0x1008ff13), spawn "amixer set Master 2%+")
        , ((0, 0x1008ffb2), spawn "amixer set Capture toggle")
        , ((controlMask, 0x1008ff13), spawn "amixer -c 1 set PCM 2%+")
        , ((0, 0x1008ff14), spawn "mpc toggle")
        , ((0, 0x1008ff16), spawn "mpc prev")
        , ((0, 0x1008ff17), spawn "mpc next")
        , ((0, 0x1008FF41), spawn "st -e alsamixer")
        , ((0, 0x1008FF59), spawn ("$HOME/bin/chlayout -p layout" ++ dmenuOpts))
        , ((mod1Mask .|. controlMask, xK_n), spawn "$HOME/bin/nmcli_dmenu")
        , ((mod1Mask .|. controlMask, xK_t), spawn "st")
        , ((mod1Mask .|. controlMask, xK_Return), spawn ("dmenu_run -p '$'" ++ dmenuOpts))
        , ((mod1Mask .|. controlMask, xK_p), spawn ("$HOME/bin/passmenu -p 'pass'" ++ dmenuOpts))
        , ((mod1Mask .|. controlMask, xK_o), spawn ("$HOME/bin/filemenu -l 10 -p 'open'" ++ dmenuOpts))
        ]

dmenuOpts = " -fn sans:size=8 -i -sb '#5294E2'"
