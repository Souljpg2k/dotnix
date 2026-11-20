local terminal        = "kitty"
local terminal2       = "ghostty"
local fileManager     = "dolphin"
local browser         = "brave"
local browser2        = "zen-beta"
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

-- Rofi
hl.bind("SUPER + R", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("rofi -show run"))
hl.bind("SUPER + D",
    hl.dsp.exec_cmd("cliphist list | rofi -dmenu -p '> '  -no-show-icons -display-columns 2 | cliphist decode | wl-copy"))
hl.bind("SUPER + SHIFT + X", hl.dsp.exec_cmd("cliphist wipe"))

-- Hypr
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + A", hl.dsp.exec_cmd("hyprpicker -a"))
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

-- multimedia keys for volume & playerctl
hl.bind("SUPER + U", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("SUPER + Y", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("SUPER + N", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("SUPER + T", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("SUPER + B", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
