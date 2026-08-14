-- █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█   █▀█ █░█ █░░ █▀▀ █▀
-- ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀   █▀▄ █▄█ █▄▄ ██▄ ▄█
--
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- Rules are evaluated top to bottom -- the last match wins.

local function opacity(value, matches)
    for _, m in ipairs(matches) do
        hl.window_rule({ match = m, opacity = value })
    end
end

local function float(matches)
    for _, m in ipairs(matches) do
        hl.window_rule({ match = m, float = true })
    end
end


-- Opacity

opacity("0.90 0.90", {
    { class = "^(firefox)$" },
    { class = "^(Google-chrome)$" },
    { class = "^(Brave-browser)$" },
    { class = "^(com.github.rafostar.Clapper)$" }, -- Clapper-Gtk
})

opacity("0.80 0.80", {
    { class = "^(code-oss)$" },
    { class = "^([Cc]ode)$" },
    { class = "^(code-url-handler)$" },
    { class = "^(code-insiders-url-handler)$" },
    { class = "^(kitty)$" },
    { class = "^(org.kde.dolphin)$" },
    { class = "^(org.kde.ark)$" },
    { class = "^(nwg-look)$" },
    { class = "^(qt5ct)$" },
    { class = "^(qt6ct)$" },
    { class = "^(kvantummanager)$" },
    { class = "^(com.github.tchx84.Flatseal)$" },            -- Flatseal-Gtk
    { class = "^(hu.kramo.Cartridges)$" },                   -- Cartridges-Gtk
    { class = "^(com.obsproject.Studio)$" },                 -- Obs-Qt
    { class = "^(gnome-boxes)$" },                           -- Boxes-Gtk
    { class = "^(vesktop)$" },                               -- Vesktop
    { class = "^(discord)$" },                               -- Discord-Electron
    { class = "^(WebCord)$" },                               -- WebCord-Electron
    { class = "^(ArmCord)$" },                               -- ArmCord-Electron
    { class = "^(app.drey.Warp)$" },                         -- Warp-Gtk
    { class = "^(net.davidotek.pupgui2)$" },                 -- ProtonUp-Qt
    { class = "^(yad)$" },                                   -- Protontricks-Gtk
    { class = "^(Signal)$" },                                -- Signal-Gtk
    { class = "^(io.github.alainm23.planify)$" },            -- planify-Gtk
    { class = "^(io.gitlab.theevilskeleton.Upscaler)$" },    -- Upscaler-Gtk
    { class = "^(com.github.unrud.VideoDownloader)$" },      -- VideoDownloader-Gtk
    { class = "^(io.gitlab.adhami3310.Impression)$" },       -- Impression-Gtk
    { class = "^(io.missioncenter.MissionCenter)$" },        -- MissionCenter-Gtk
    { class = "^(io.github.flattool.Warehouse)$" },          -- Warehouse-Gtk
})

opacity("0.80 0.70", {
    { class = "^(org.pulseaudio.pavucontrol)$" },
    { class = "^(blueman-manager)$" },
    { class = "^(nm-applet)$" },
    { class = "^(nm-connection-editor)$" },
    { class = "^(org.kde.polkit-kde-authentication-agent-1)$" },
    { class = "^(polkit-gnome-authentication-agent-1)$" },
    { class = "^(org.freedesktop.impl.portal.desktop.gtk)$" },
    { class = "^(org.freedesktop.impl.portal.desktop.hyprland)$" },
})

opacity("0.70 0.70", {
    { class = "^([Ss]team)$" },
    { class = "^(steamwebhelper)$" },
    { class = "^([Ss]potify)$" },
    { initial_title = "^(Spotify Free)$" },
    { initial_title = "^(Spotify Premium)$" },
})


-- Floating

float({
    { class = "^(org.kde.dolphin)$", title = "^(Progress Dialog — Dolphin)$" },
    { class = "^(org.kde.dolphin)$", title = "^(Copying — Dolphin)$" },
    { title = "^(About Mozilla Firefox)$" },
    { class = "^(firefox)$", title = "^(Picture-in-Picture)$" },
    { class = "^(firefox)$", title = "^(Library)$" },
    { class = "^(kitty)$", title = "^(top)$" },
    { class = "^(kitty)$", title = "^(btop)$" },
    { class = "^(kitty)$", title = "^(htop)$" },
    { class = "^(vlc)$" },
    { class = "^(kvantummanager)$" },
    { class = "^(qt5ct)$" },
    { class = "^(qt6ct)$" },
    { class = "^(nwg-look)$" },
    { class = "^(org.kde.ark)$" },
    { class = "^(org.pulseaudio.pavucontrol)$" },
    { class = "^(blueman-manager)$" },
    { class = "^(nm-applet)$" },
    { class = "^(nm-connection-editor)$" },
    { class = "^(org.kde.polkit-kde-authentication-agent-1)$" },
    { class = "^(Signal)$" },                                -- Signal-Gtk
    { class = "^(com.github.rafostar.Clapper)$" },           -- Clapper-Gtk
    { class = "^(app.drey.Warp)$" },                         -- Warp-Gtk
    { class = "^(net.davidotek.pupgui2)$" },                 -- ProtonUp-Qt
    { class = "^(yad)$" },                                   -- Protontricks-Gtk
    { class = "^(eog)$" },                                   -- Imageviewer-Gtk
    { class = "^(io.github.alainm23.planify)$" },            -- planify-Gtk
    { class = "^(io.gitlab.theevilskeleton.Upscaler)$" },    -- Upscaler-Gtk
    { class = "^(com.github.unrud.VideoDownloader)$" },      -- VideoDownloader-Gtk
    { class = "^(io.gitlab.adhami3310.Impression)$" },       -- Impression-Gtk
    { class = "^(io.missioncenter.MissionCenter)$" },        -- MissionCenter-Gtk

    -- common modals
    { title = "^(Open)$" },
    { title = "^(Choose Files)$" },
    { title = "^(Save As)$" },
    { title = "^(Confirm to replace files)$" },
    { title = "^(File Operation Progress)$" },
    { class = "^(xdg-desktop-portal-gtk)$" },
})


-- █░░ ▄▀█ █▄█ █▀▀ █▀█   █▀█ █░█ █░░ █▀▀ █▀
-- █▄▄ █▀█ ░█░ ██▄ █▀▄   █▀▄ █▄█ █▄▄ ██▄ ▄█

for _, ns in ipairs({
    "waybar",
    "rofi",
    "notifications",
    "swaync-notification-window",
    "swaync-control-center",
    "logout_dialog",
}) do
    hl.layer_rule({ match = { namespace = ns }, blur = true })
end
