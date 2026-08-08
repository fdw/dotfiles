------------------
---- MONITORS ----
------------------

require("monitors")
require("workspaces")

hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("/home/fdw/.config/hypr/scripts/lid.sh on"), { locked = true })
hl.bind("switch:on:Lid Switch",  hl.dsp.exec_cmd("/home/fdw/.config/hypr/scripts/lid.sh off"),  { locked = true })

---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local menu        = "rofi -show combi -modes combi,drun,ssh -combi-modes drun,ssh"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("udiskie -NsF")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("hyprsunset")
    -- Clipboard
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE",    "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM",      "wayland;xcb")
hl.env("GDK_BACKEND",         "wayland,x11,*")
hl.env("CLUTTER_BACKEND",     "wayland")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in     = 4,
        gaps_out    = 4,
        border_size = 2,

        -- Tokyo Night Cyan -> Purple gradient
        col = {
            active_border   = { colors = {"rgba(7dcfffee)", "rgba(bb9af7ee)"}, angle = 45 },
            inactive_border = "rgba(1a1b26aa)",
        },

        resize_on_border = true,
        layout = "scrolling",
    },

    decoration = {
        rounding         = 8,
        active_opacity   = 1.0,
        inactive_opacity = 0.96,

        blur = {
            enabled  = false,
            size     = 5,
            passes   = 2,
            vibrancy = 0.1696,
        },

        shadow = {
            enabled      = false,
            range        = 12,
            render_power = 3,
            color        = 0xee1a1a1a, -- rgba(1a1a1aee)
        },
    },

    animations = {
        enabled = true,
    },
})

-- Bezier curve (replaces: bezier = myBezier, 0.05, 0.9, 0.1, 1.05)
hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })

-- Animations (replaces: animation = <leaf>, <enabled>, <speed>, <bezier>[, <style>])
hl.animation({ leaf = "windows",     enabled = true, speed = 5,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 5,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 5,  bezier = "default" })

-------------------------
---- SCROLLING LAYOUT ----
-------------------------

hl.config({
    input = {
        kb_layout          = "eu",
        sensitivity        = 1.0,
        numlock_by_default = true,

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.config({
    scrolling = {
        column_width              = 0.55,
        direction                 = "right",
        focus_fit_method          = 1,
        follow_focus              = true,
        fullscreen_on_one_column  = false,
        explicit_column_widths    = "0.333, 0.55, 0.75, 1.0",
    },
})

----------------------
---- WINDOW RULES ----
----------------------

hl.window_rule({ match = { class = "udiskie" }, float = true })

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- --- Core Actions ---
hl.bind(mainMod .. " + Return",     hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + X",          hl.dsp.window.close())

-- --- Screenshots (hyprshot) ---
hl.bind("Print",         hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m window"))

-- --- Rofi Suite ---
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + S",     hl.dsp.exec_cmd("rofi -show system -modi system:rofi-power-menu -theme tokyonight-text"))
hl.bind(mainMod .. " + C",     hl.dsp.exec_cmd("cliphist list | rofi -dmenu -theme tokyonight-text | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + E",     hl.dsp.exec_cmd("rofimoji"))
hl.bind(mainMod .. " + P",     hl.dsp.exec_cmd("rofi-rbw --selector-args='-theme tokyonight-text'"))
hl.bind(mainMod .. " + O",     hl.dsp.exec_cmd("rofyk"))
hl.bind(mainMod .. " + M",     hl.dsp.exec_cmd('LC_NUMERIC=en_US.UTF-8 rofi -show calc -modi calc -no-show-match -no-sort -theme tokyonight-text -calc-command "echo -n \'{result}\' | xsel -b"'))

-- --- Scrolling Layout Navigation (Arrows + Comma/Period) ---
hl.bind(mainMod .. " + left",   hl.dsp.focus({ direction = "left"  }))
hl.bind(mainMod .. " + right",  hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + comma",  hl.dsp.focus({ direction = "left"  }))
hl.bind(mainMod .. " + period", hl.dsp.focus({ direction = "right" }))

-- Swap Column Position (SHIFT + Arrows + Comma/Period)
hl.bind(mainMod .. " + SHIFT + left",   hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + SHIFT + right",  hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + SHIFT + comma",  hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + SHIFT + period", hl.dsp.layout("swapcol r"))

-- Focus Stacked Windows Up / Down
hl.bind(mainMod .. " + up",   hl.dsp.focus({ direction = "up"   }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Layout & Window Controls
hl.bind(mainMod .. " + Equal",       hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + Minus",      hl.dsp.layout("colresize -conf"))
hl.bind(mainMod .. " + F",          hl.dsp.layout("fit expand"))
hl.bind(mainMod .. " + CTRL + comma", hl.dsp.layout("consume_or_expel prev"))
hl.bind(mainMod .. " + CTRL + period", hl.dsp.layout("consume_or_expel next"))
hl.bind(mainMod .. " + V",          hl.dsp.window.float({ action = "toggle" }))

-- Workspaces (1-10)
for i = 1, 10 do
    local key = i % 10  -- workspace 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Hardware Keys (Volume, Brightness, Media)
-- bindel  -> { locked = true, repeating = true }  (edge-triggered, repeats while held)
-- bindl   -> { locked = true }                    (active while screen is locked)
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +3%"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -3%"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s +20%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 20%-"),  { locked = true, repeating = true })
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Mouse Control (replaces bindm)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
