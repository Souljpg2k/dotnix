-- MONITORS

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

-- ENVIRONMENT VARIABLES

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

--AUTOSTART

local kino = "qs -c ~/.config/kino"

hl.on("hyprland.start", function ()
   hl.exec_cmd(kino)
   hl.exec_cmd("dbus-update-activation-environment --systemd --all")
   hl.exec_cmd("systemctl --user start hyprpolkitagent")
   hl.exec_cmd("systemctl --user start opentabletdriver")
   hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
   hl.exec_cmd("wl-paste --type text --watch cliphist store")
   hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

-- LOOK AND FEEL

hl.config({
    general = {
        gaps_in                 = 4,
        gaps_out                = 8,
        border_size             = 0,
        extend_border_grab_area = 20,
        resize_on_border        = true,
        allow_tearing           = false,
        layout                  = "dwindle",
        col = { active_border   = "rgba(ffffff75)", inactive_border = "rgba(ffffff65)", },
    },

    decoration = {
        dim_around       = 0.2,
        dim_inactive     = false,
        dim_modal        = true,
        dim_special      = 0.2,
        dim_strength     = 0.4,
        rounding         = 18,
        rounding_power   = 3,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow           = {
            enabled      = true,
            range        = 9,
            render_power = 4,
            color        = 0x9e000000,
            scale        = 1.0,
        },

        wobble =  {
            enabled   = true,
            mesh      = 2,
            stiffness = 350,
            damping   = 15,
            mass      = 1,
            intensity = 0.3,
            value_epsilon = 0.3,
            velocity_epsilon = 1,
        },

        blur             = {
            enabled           = true,
            size              = 1,
            passes            = 2, 
            brightness        = 1,
            contrast          = 1,
            xray              = false,
            special           = false,
            ignore_opacity    = true,
            new_optimizations = true,
            noise             = 0,
            vibrancy          = 0.1,
            vibrancy_darkness = 0,
            variant           = "drops",

            drops = {
                speed = 3,
            },

            glass = {
                refraction = 20,
                roughness  = 1.0,
                size       = 50,
            },
        },
    },
})

hl.config({
    dwindle = {
        preserve_split     = true,
        smart_split        = true,
        precise_mouse_move = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

hl.config({
    misc = {
        force_default_wallpaper     = 0,
        disable_hyprland_logo       = false,
        allow_session_lock_restore  = true,
        always_follow_on_dnd        = true,
        font_family                 = "Inter",
        force_default_wallpaper     = -1,
        session_lock_blur           = true,
        session_lock_xray           = true,
        
        col = {
            splash = 0x55ffffff,
        },
    },
})

hl.config({
    input = {
        kb_layout    = "us,th",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "grp:win_space_toggle",
        kb_rules     = "",

        follow_mouse = 1,
        repeat_rate  = 80,
        repeat_delay = 180,
        sensitivity  = 0,

        touchpad     = {
            natural_scroll = false,
        },

        tablet = {
            enabled = true,
        }
    },
})

hl.gesture({
    fingers     = 3,
    direction   = "horizontal",
    action      = "workspace"
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

-- KEYBINDINGS

local terminal        = "kitty"
local terminal2       = "ghostty"
local fileManager     = "dolphin"
local browser         = "brave"
local browser2        = "helium"
local closeWindowBind = hl.bind("SUPER + C", hl.dsp.window.close())

-- Exit hyprland
hl.bind("SUPER + SHIFT + M", 
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Windows
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + SHIFT + P", hl.dsp.window.pseudo())
hl.bind("SUPER + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Apps
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(terminal2))
hl.bind("SUPER + ALT + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd(browser2))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("code"))

-- Quickshell
hl.bind("SUPER + SHIFT + T", hl.dsp.global("kino:bar"))

-- Rofi
hl.bind("SUPER + R", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("rofi -show run"))

-- Cliphist
hl.bind("SUPER + D",
    hl.dsp.exec_cmd("cliphist list | rofi -dmenu -p '> '  -no-show-icons -display-columns 2 | cliphist decode | wl-copy"))
hl.bind("SUPER + SHIFT + X", hl.dsp.exec_cmd("cliphist wipe"))

-- Hyprpicker
hl.bind("SUPER + A", hl.dsp.exec_cmd("hyprpicker -a"))

-- Hyprshot
hl.bind("SUPER + F", hl.dsp.exec_cmd("hyprshot -m region -o $HOME/Pictures/Screenshots"))
hl.bind("SUPER + G", hl.dsp.exec_cmd("hyprshot -m window -o $HOME/Pictures/Screenshots"))
hl.bind("SUPER + Print", hl.dsp.exec_cmd("hyprshot -m output -o $HOME/Pictures/Screenshots"))

-- Move focus with SUPER + arrow keys
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with SUPER + [0-9]
-- Move active window to a workspace with SUPER + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with SUPER + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with SUPER + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

--Pc multimedia keys for volume & playerctl
hl.bind("SUPER + U", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("SUPER + Y", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("SUPER + N", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("SUPER + T", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("SUPER + B", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- ANIMATIONS
hl.config({ animations = { enabled = true, }, })

hl.curve("easeOutQuint",   { type = "bezier", points = { { 0.23, 1 },    { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear",         { type = "bezier", points = { { 0, 0 },       { 1, 1 } } })
hl.curve("almostLinear",   { type = "bezier", points = { { 0.2, 1 },     { 0.2, 1 } } })
hl.curve("overshoot",      { type = "bezier", points = { { 0.2, 1.18 },  { 0.2, 1 } } } )
hl.curve("quick",          { type = "bezier", points = { { 0.15, 0 },    { 0.1, 1 } } })
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 400, dampening = 40 })

hl.animation({ leaf = "global",         enabled = true, speed = 9,    bezier = "default" })
hl.animation({ leaf = "border",         enabled = true, speed = 5,    bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",        enabled = true, speed = 4,    spring = "easy" })
hl.animation({ leaf = "windowsIn",      enabled = true, speed = 3,    spring = "easy", bezier = "default", style = "popin 20%" })
hl.animation({ leaf = "windowsOut",     enabled = true, speed = 2,    bezier = "almostLinear", style = "popin 10%" })
hl.animation({ leaf = "fadeIn",         enabled = true, speed = 5,    bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",        enabled = true, speed = 4,    bezier = "almostLinear" })
hl.animation({ leaf = "fade",           enabled = true, speed = 3,    bezier = "quick" })
hl.animation({ leaf = "layers",         enabled = true, speed = 3,    bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",       enabled = true, speed = 3,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",      enabled = true, speed = 1,    bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn",   enabled = true, speed = 2,    bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut",  enabled = true, speed = 2,    bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",     enabled = true, speed = 7,    bezier = "overshoot", style = "slide" })
hl.animation({ leaf = "zoomFactor",     enabled = true, speed = 7,    bezier = "quick" })

-- WINDOWS AND WORKSPACES

local suppressMaximizeRule = hl.window_rule({
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- Window_rules

hl.window_rule({ 
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" }, float = true, pin = true, size = { 900, 600 }, animation = "slide bottom", })
hl.window_rule({ match = { class = "org.kde.dolphin" }, float = true, pin = true, animation = "slide bottom", })
hl.window_rule({ match = { class = "org.gnome.Loupe" }, float = true, animation = "slide bottom", })
hl.window_rule({ match = { class = "mpv" }, animation = "slide bottom", })

-- Layer_rules

hl.layer_rule({ match = { namespace = "rofi" }, dim_around = true, animation = "slide bottom", })
hl.layer_rule({ match = { namespace = "fuzzel" }, dim_around = true, animation = "slide bottom", })
hl.layer_rule({ match = { namespace = "notifications"}, animation = "slide right", })
