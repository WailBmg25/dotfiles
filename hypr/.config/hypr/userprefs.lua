-- █░█ █▀ █▀▀ █▀█   █▀█ █▀█ █▀▀ █▀▀ █▀
-- █▄█ ▄█ ██▄ █▀▄   █▀▀ █▀▄ ██▄ █▀░ ▄█
--
-- Set your personal Hyprland configuration here.
-- This file is required last, so anything set here overrides the defaults.
--
-- e.g.
-- hl.config({ general = { gaps_out = 12 } })
-- hl.bind("SUPER + N", hl.dsp.exec_cmd("obsidian"))

-- Super + Left/Right: previous/next workspace
hl.bind("SUPER + Left",  hl.dsp.focus({ workspace = "r-1" }))
hl.bind("SUPER + Right", hl.dsp.focus({ workspace = "r+1" }))
