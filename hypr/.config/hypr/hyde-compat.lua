-- █░█ █▄█ █▀▄ █▀▀   █▀▀ █▀█ █▀▄▀█ █▀█ ▄▀█ ▀█▀
-- █▀█ ░█░ █▄▀ ██▄   █▄▄ █▄█ █░▀░█ █▀▀ █▀█ ░█░
--
-- HyDE's theme / wallbash / animation scripts still write hyprlang .conf files,
-- which Hyprland stopped reading when the .conf format was dropped in 0.57.
-- This reads those generated files and replays them through the Lua API, so
-- SUPER+SHIFT+T (themes), SUPER+ALT+A (animations) and wallbash keep working.
--
-- HyDE calls `hyprctl reload` after switching, and reload re-executes this
-- config -- so the new values are picked up with no polling or file watching.
--
-- Delete this file and its require() once HyDE ships a native Lua config.
-- Upstream tracking issue: HyDE-Project/HyDE#1756

local confDir = os.getenv("HOME") .. "/.config/hypr"

local vars  = {} -- $VARIABLES declared in the files
local execs = {} -- exec = ... lines

local BOOL = {
    yes = true,  ["true"]  = true,  on  = true,
    no  = false, ["false"] = false, off = false,
}

local function trim(s)
    return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function split(s)
    local out = {}
    for part in (s .. ","):gmatch("(.-),") do out[#out + 1] = trim(part) end
    return out
end

local function expand(s)
    return (s:gsub("%$([%w_]+)", function(k)
        return vars[k] or os.getenv(k) or ("$" .. k)
    end))
end

-- "yes" -> true, "13" -> 13, "0x80ffffff" -> int,
-- "rgba(aaff) rgba(bbff) 45deg" -> gradient, "0 0" -> vec2, else string.
local function coerce(v)
    local b = BOOL[v:lower()]
    if b ~= nil then return b end

    if v:match("^0[xX]%x+$") then return tonumber(v) end
    if v:match("^%-?%d+$") or v:match("^%-?%d*%.%d+$") then return tonumber(v) end

    local colors = {}
    for c in v:gmatch("rgba?%b()") do colors[#colors + 1] = c end
    if #colors >= 2 then
        return { colors = colors, angle = tonumber(v:match("(%-?%d+)%s*deg")) or 0 }
    end

    local x, y = v:match("^(%-?[%d.]+)%s+(%-?[%d.]+)$")
    if x then return { tonumber(x), tonumber(y) } end

    return v
end

-- Build a nested table for one leaf and hand it to hl.config, so an option this
-- Hyprland version no longer knows only loses itself, not the whole theme.
local function set(path, value)
    local root = {}
    local node = root
    for i = 1, #path - 1 do
        node[path[i]] = {}
        node = node[path[i]]
    end
    node[path[#path]] = value
    pcall(hl.config, root)
end

local LAYER_RULE = {
    blur        = function(r) r.blur = true end,
    blurpopups  = function(r) r.blur_popups = true end,
    noanim      = function(r) r.no_anim = true end,
    dimaround   = function(r) r.dim_around = true end,
    xray        = function(r) r.xray = true end,
    ignorealpha = function(r, arg) r.ignore_alpha = tonumber(arg) or 0.5 end,
}

local function layerRule(value)
    local parts = split(value)
    local namespace = parts[#parts]
    local verb, arg = parts[1]:match("^(%S+)%s*(.*)$")
    local handler = LAYER_RULE[(verb or ""):lower()]
    if not (handler and namespace) then return end

    local rule = { match = { namespace = namespace } }
    handler(rule, arg)
    pcall(hl.layer_rule, rule)
end

-- bezier = name, x0, y0, x1, y1
local function bezier(value)
    local p = split(value)
    if #p < 5 then return end
    pcall(hl.curve, p[1], {
        type   = "bezier",
        points = { { tonumber(p[2]), tonumber(p[3]) }, { tonumber(p[4]), tonumber(p[5]) } },
    })
end

-- animation = leaf, onoff, speed, curve[, style]
local function animation(value)
    local p = split(value)
    if #p < 2 then return end
    if p[2] == "0" then
        pcall(hl.animation, { leaf = p[1], enabled = false })
        return
    end
    pcall(hl.animation, {
        leaf    = p[1],
        enabled = true,
        speed   = tonumber(p[3]),
        bezier  = p[4],
        style   = p[5], -- nil when absent
    })
end

local load -- forward declaration, `source =` recurses

-- key = value handlers that are not plain config options
local KEYWORD = {
    exec        = function(v) execs[#execs + 1] = v end,
    ["exec-once"] = function(v) execs[#execs + 1] = v end,
    source      = function(v) load(v) end,
    bezier      = bezier,
    animation   = animation,
    layerrule   = layerRule,
    blurls      = function(v) pcall(hl.layer_rule, { match = { namespace = v }, blur = true }) end,
}

load = function(path)
    local f = io.open(path, "r")
    if not f then return end

    local stack = {}
    for raw in f:lines() do
        local line = trim(raw:gsub("#.*", ""))

        if line == "}" then
            table.remove(stack)

        elseif line:match("^[%w_]+%s*{$") then
            stack[#stack + 1] = line:match("^([%w_]+)")

        elseif line ~= "" then
            local key, value = line:match("^([^=]+)=(.*)$")
            if key then
                key, value = trim(key), expand(trim(value))

                if key:sub(1, 1) == "$" then
                    vars[key:sub(2)] = value
                elseif KEYWORD[key] then
                    KEYWORD[key](value)
                else
                    -- section stack + dotted/colon path, e.g. decoration > shadow:enabled
                    local p = { table.unpack(stack) }
                    for seg in key:gmatch("[^.:]+") do p[#p + 1] = seg end
                    set(p, coerce(value))
                end
            end
        end
    end

    f:close()
end

-- Same order the old hyprland.conf sourced them: wallbash colors override the
-- theme, which overrides the shared defaults.
load(confDir .. "/themes/common.conf")
load(confDir .. "/themes/theme.conf")
load(confDir .. "/themes/colors.conf")
load(confDir .. "/animations.conf")

-- On first launch the compositor isn't up yet, so defer to hyprland.start.
-- On `hyprctl reload` -- how HyDE applies a theme -- that event never fires
-- again, so run them right away instead.
local function runExecs()
    for _, cmd in ipairs(execs) do hl.exec_cmd(cmd) end
end

local ok, monitors = pcall(hl.get_monitors)
if ok and type(monitors) == "table" and #monitors > 0 then
    runExecs()
else
    hl.on("hyprland.start", runExecs)
end
