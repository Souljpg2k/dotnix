local suppressMaximizeRule = hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})
hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})
hl.window_rule({
    name = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move = "20 monitor_h-120",
    float = true,
})
hl.window_rule({
    match = { class = "com.saivert.pwvucontrol" },
    float = true,
    pin = true,
    size = { 900, 400 },
    animation = "slide bottom",
})
hl.window_rule({
    match = { class = "org.kde.dolphin" },
    float = true,
    pin = true,
    animation = "slide bottom",
})
hl.window_rule({
    match = { class = "org.gnome.Loupe" },
    float = true,
    animation = "slide bottom",
})
hl.window_rule({
    match = { class = "xdg-desktop-portal-gtk" },
    float = true,
    size = { 900, 600 },
})
hl.window_rule({
    match = { class = "mpv" },
    animation = "slide bottom",
})
hl.window_rule({
    match = { class = "kitty" },
    no_blur = true,
})
hl.window_rule({
    match = { class = "com.mitchellh.ghostty" },
    no_blur = true,
})
hl.layer_rule({
    match = { namespace = "yuki" },
    blur = true,
    xray = true,
    ignore_alpha = 0,
})
hl.layer_rule({
    match = { namespace = "rofi" },
    dim_around = false,
    animation = "slide bottom",
    blur = true,
    ignore_alpha = 0.5,
})
hl.layer_rule({
    match = { namespace = "notifications" },
    animation = "slide right",
    blur = true,
    ignore_alpha = 0,
})
hl.window_rule({
    match = { class = "dev.zed.Zed" },
    no_blur = true,
})
