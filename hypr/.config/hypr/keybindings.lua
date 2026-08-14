-- █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄ █ █▄░█ █▀▀ █▀
-- █░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀ █ █░▀█ █▄█ ▄█
--
-- See https://wiki.hypr.land/Configuring/Basics/Binds/
--  &  https://wiki.hypr.land/Configuring/Basics/Dispatchers/

local scrPath = os.getenv("HOME") .. "/.local/share/bin"

-- Main modifier
local mainMod = "SUPER" -- super / meta / windows key

-- Assign apps
local term    = "kitty"
local editor  = "code"
local file    = "nautilus"
local browser = "google-chrome-stable --ozone-platform=wayland"


-- Window/Session actions
hl.bind(mainMod .. " + C",             hl.dsp.exec_cmd(scrPath .. "/dontkillsteam.sh"))  -- close focused window
hl.bind("ALT + F4",                    hl.dsp.exec_cmd(scrPath .. "/dontkillsteam.sh"))  -- close focused window
hl.bind(mainMod .. " + SHIFT + Backspace", hl.dsp.exit())                                -- kill hyprland session
hl.bind(mainMod .. " + I",             hl.dsp.window.float())                            -- toggle float
hl.bind(mainMod .. " + G",             hl.dsp.group.toggle())                            -- toggle group
hl.bind("CTRL + ALT + Return",         hl.dsp.window.fullscreen())                       -- toggle fullscreen
hl.bind(mainMod .. " + SHIFT + L",     hl.dsp.exec_cmd("hyprlock"))                      -- launch lock screen
hl.bind(mainMod .. " + SHIFT + F",     hl.dsp.exec_cmd(scrPath .. "/windowpin.sh"))      -- toggle pin on focused window
hl.bind(mainMod .. " + Backspace",     hl.dsp.exec_cmd(scrPath .. "/logoutlaunch.sh"))   -- launch logout menu
hl.bind("CTRL + ALT + W",              hl.dsp.exec_cmd("killall waybar || waybar"))      -- toggle waybar without reloading

-- Application shortcuts
hl.bind(mainMod .. " + Return",        hl.dsp.exec_cmd(term))                            -- launch terminal emulator
hl.bind(mainMod .. " + E",             hl.dsp.exec_cmd(file))                            -- launch file manager
hl.bind(mainMod .. " + SHIFT + C",     hl.dsp.exec_cmd(editor))                          -- launch text editor
hl.bind(mainMod .. " + F",             hl.dsp.exec_cmd(browser))                         -- launch web browser
hl.bind("CTRL + SHIFT + Escape",       hl.dsp.exec_cmd(scrPath .. "/sysmonlaunch.sh"))   -- launch system monitor

-- Rofi menus
hl.bind(mainMod .. " + space",         hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/rofilaunch.sh d")) -- application launcher
hl.bind(mainMod .. " + Tab",           hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/rofilaunch.sh w")) -- window switcher
hl.bind(mainMod .. " + SHIFT + E",     hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/rofilaunch.sh f")) -- file explorer

-- Audio control
hl.bind("F10",                 hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o m"), { locked = true })                     -- toggle audio mute
hl.bind("F11",                 hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o d"), { locked = true, repeating = true })   -- decrease volume
hl.bind("F12",                 hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o i"), { locked = true, repeating = true })   -- increase volume
hl.bind("XF86AudioMute",       hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o m"), { locked = true })                     -- toggle audio mute
hl.bind("XF86AudioMicMute",    hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -i m"), { locked = true })                     -- toggle microphone mute
hl.bind("XF86AudioLowerVolume",hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o d"), { locked = true, repeating = true })   -- decrease volume
hl.bind("XF86AudioRaiseVolume",hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o i"), { locked = true, repeating = true })   -- increase volume

-- Media control
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Brightness control
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(scrPath .. "/brightnesscontrol.sh i"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(scrPath .. "/brightnesscontrol.sh d"), { locked = true, repeating = true })

-- Move between grouped windows
hl.bind(mainMod .. " + CTRL + H", hl.dsp.group.prev())
hl.bind(mainMod .. " + CTRL + L", hl.dsp.group.next())

-- Screenshot/Screencapture
hl.bind(mainMod .. " + P",         hl.dsp.exec_cmd(scrPath .. "/screenshot.sh s"))   -- partial screenshot capture
hl.bind(mainMod .. " + CTRL + P",  hl.dsp.exec_cmd(scrPath .. "/screenshot.sh sf"))  -- partial screenshot capture (frozen screen)
hl.bind(mainMod .. " + ALT + P",   hl.dsp.exec_cmd(scrPath .. "/screenshot.sh m"))   -- monitor screenshot capture
hl.bind("Print",                   hl.dsp.exec_cmd(scrPath .. "/screenshot.sh p"))   -- all monitors screenshot capture

-- Custom scripts
hl.bind(mainMod .. " + ALT + G",     hl.dsp.exec_cmd(scrPath .. "/gamemode.sh"))            -- disable hypr effects for gamemode
hl.bind(mainMod .. " + ALT + Right", hl.dsp.exec_cmd(scrPath .. "/swwwallpaper.sh -n"))     -- next wallpaper
hl.bind(mainMod .. " + ALT + Left",  hl.dsp.exec_cmd(scrPath .. "/swwwallpaper.sh -p"))     -- previous wallpaper
hl.bind(mainMod .. " + ALT + Up",    hl.dsp.exec_cmd(scrPath .. "/wbarconfgen.sh n"))       -- next waybar mode
hl.bind(mainMod .. " + ALT + Down",  hl.dsp.exec_cmd(scrPath .. "/wbarconfgen.sh p"))       -- previous waybar mode
hl.bind(mainMod .. " + SHIFT + R",   hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/wallbashtoggle.sh -m")) -- wallbash mode select menu
hl.bind(mainMod .. " + SHIFT + T",   hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/themeselect.sh"))       -- theme select menu
hl.bind(mainMod .. " + SHIFT + A",   hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/rofiselect.sh"))        -- rofi select menu
hl.bind(mainMod .. " + SHIFT + X",   hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/themestyle.sh"))        -- theme style select menu
hl.bind(mainMod .. " + SHIFT + W",   hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/swwwallselect.sh"))     -- wallpaper select menu
hl.bind(mainMod .. " + V",           hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/cliphist.sh c"))        -- clipboard
hl.bind(mainMod .. " + SHIFT + V",   hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/cliphist.sh"))          -- clipboard manager
hl.bind(mainMod .. " + SHIFT + space", hl.dsp.exec_cmd(scrPath .. "/keyboardswitch.sh"))                         -- switch keyboard layout
hl.bind(mainMod .. " + slash",       hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/keybinds_hint.sh c"))   -- keybinds hint
hl.bind(mainMod .. " + ALT + A",     hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/animations.sh"))        -- animations manager
hl.bind(mainMod .. " + B",           hl.dsp.exec_cmd("waybartoggle.sh"))

-- Move/Change window focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "d" }))
hl.bind("ALT + Tab",       hl.dsp.focus({ direction = "d" }))

-- Switch workspaces / move focused window to a workspace (silently with ALT)
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i, follow = true }))
    hl.bind(mainMod .. " + ALT + " .. key,       hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Switch workspaces to a relative workspace
hl.bind(mainMod .. " + CTRL + L",    hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + CTRL + H",    hl.dsp.focus({ workspace = "r-1" }))

-- Move to the first empty workspace
hl.bind(mainMod .. " + CTRL + Down", hl.dsp.focus({ workspace = "empty" }))

-- Resize windows
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.resize({ x =  30, y =   0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Left",  hl.dsp.window.resize({ x = -30, y =   0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Up",    hl.dsp.window.resize({ x =   0, y = -30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Down",  hl.dsp.window.resize({ x =   0, y =  30, relative = true }), { repeating = true })

-- Move focused window to a relative workspace
hl.bind(mainMod .. " + CTRL + ALT + Right", hl.dsp.window.move({ workspace = "r+1", follow = true }))
hl.bind(mainMod .. " + CTRL + ALT + Left",  hl.dsp.window.move({ workspace = "r-1", follow = true }))

-- Move active window around current workspace: nudge it if floating, else shift it in the tiling tree.
-- Replaces the old exec + jq + hyprctl round-trip.
local function nudgeOrShift(dx, dy, dir)
    return function()
        local w = hl.get_active_window()
        if w and w.floating then
            hl.dispatch(hl.dsp.window.move({ x = dx, y = dy, relative = true }))
        else
            hl.dispatch(hl.dsp.window.move({ direction = dir }))
        end
    end
end

hl.bind(mainMod .. " + SHIFT + CTRL + left",  nudgeOrShift(-30,   0, "l"), { repeating = true, description = "Move activewindow left" })
hl.bind(mainMod .. " + SHIFT + CTRL + right", nudgeOrShift( 30,   0, "r"), { repeating = true, description = "Move activewindow right" })
hl.bind(mainMod .. " + SHIFT + CTRL + up",    nudgeOrShift(  0, -30, "u"), { repeating = true, description = "Move activewindow up" })
hl.bind(mainMod .. " + SHIFT + CTRL + down",  nudgeOrShift(  0,  30, "d"), { repeating = true, description = "Move activewindow down" })

-- Scroll through existing workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/Resize focused window
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + Z",         hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + X",         hl.dsp.window.resize(), { mouse = true })

-- Move/Switch to special workspace (scratchpad)
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special", follow = false }))
hl.bind(mainMod .. " + S",       hl.dsp.workspace.toggle_special())

-- Toggle focused window split
hl.bind(mainMod .. " + O", hl.dsp.layout("togglesplit"))
