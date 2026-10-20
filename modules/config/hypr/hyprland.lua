hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.on("hyprland.start", function ()
   hl.exec_cmd("awww-daemon")
   hl.exec_cmd("qs")
   hl.exec_cmd("dbus-update-activation-environment --systemd --all")
   hl.exec_cmd("systemctl --user start hyprpolkitagent")
   hl.exec_cmd("systemctl --user start opentabletdriver")
   hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
   hl.exec_cmd("wl-paste --type text --watch cliphist store")
   hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

hl.config({
    general = {
        gaps_in          = 4,
        gaps_out         = 8,
        border_size      = 0,
        col              = {
            active_border   = "rgba(ffffff75)",
            inactive_border = "rgba(ffffff65)",
        },
        resize_on_border = true,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding         = 18,
        rounding_power   = 3,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        shadow           = {
            enabled      = true,
            range        = 9,
            render_power = 3,
            color        = 0x9e000000,
        },

        blur             = {
            enabled           = false,
            size              = 1,
            passes            = 1, 
            xray              = false,
            special           = false,
            ignore_opacity    = true,
            new_optimizations = true,
        },
    },
})

hl.config({
    dwindle = {
        preserve_split = true,
        smart_split = false,
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
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
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
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

local terminal        = "kitty"
local terminal2        = "ghostty"
local fileManager     = "dolphin"
local browser         = "zen-beta"
local browser2        = "brave"

local wallpaperPicker = "~/nixos/scripts/wallpaper-picker.sh"
local lock            = "~/nixos/scripts/lock.sh"

local closeWindowBind = hl.bind("SUPER + C", hl.dsp.window.close())

hl.bind("SUPER + SHIFT + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + SHIFT + P", hl.dsp.window.pseudo())
hl.bind("SUPER + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Apps
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(terminal2))
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd(browser2))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("code"))

-- Quickshell
hl.bind("SUPER + T", hl.dsp.global("lazy:bar"))

-- Rofi
hl.bind("SUPER + R", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + W", hl.dsp.exec_cmd(wallpaperPicker))
hl.bind("SUPER + L", hl.dsp.exec_cmd(lock))

-- Cliphist
hl.bind("SUPER + D",
    hl.dsp.exec_cmd("cliphist list | rofi -dmenu -p '> '  -no-show-icons -display-columns 2 | cliphist decode | wl-copy"))
hl.bind("SUPER + SHIFT + X", hl.dsp.exec_cmd("cliphist wipe"))

-- Hyprpicker
hl.bind("SUPER + A", hl.dsp.exec_cmd("hyprpicker -a"))

--Hyprshot
hl.bind("SUPER + F", hl.dsp.exec_cmd("hyprshot -m region -o $HOME/Pictures/Screenshots"))
hl.bind("SUPER + G", hl.dsp.exec_cmd("hyprshot -m window -o $HOME/Pictures/Screenshots"))
hl.bind("SUPER + H", hl.dsp.exec_cmd("hyprshot -m output -o $HOME/Pictures/Screenshots"))

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

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Animations
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

hl.window_rule({ name  = "move-hyprland-run", match = { class = "hyprland-run" }, move  = "20 monitor_h-120", float = true, })
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" }, float = true, size = { 900, 600 }, animation = "slide bottom", })
hl.window_rule({ match = { class = "org.kde.dolphin" }, float = true, animation = "slide bottom", })
hl.window_rule({ match = { class = "org.gnome.Loupe" }, float = true, animation = "slide bottom", })
hl.window_rule({ match = { class = "org.gnome.Decibels" }, float = true, animation = "slide bottom", })
hl.window_rule({ match = { class = "mpv" }, animation = "slide bottom", })

hl.layer_rule({ match = { namespace = "rofi" }, blur = true, ignore_alpha = 0, animation = "slide bottom", })
hl.layer_rule({ match = { namespace = "notifications"}, animation = "slide right", })
