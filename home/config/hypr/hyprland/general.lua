hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 8,
        border_size = 0,
        extend_border_grab_area = 20,
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
        col = {
            active_border = "rgba(ffffff20)",
            inactive_border = "rgba(ffffff65)",
        },
    },
    decoration = {
        dim_around = 0.3,
        dim_inactive = false,
        dim_modal = true,
        dim_special = 0.2,
        dim_strength = 0.4,
        rounding = 18,
        rounding_power = 3,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 4,
            color = 0x9e000000,
            scale = 1.0,
        },
        blur = {
            enabled = true,
            size = 5,
            passes = 3,
            brightness = 1,
            contrast = 1,
            xray = true,
            special = false,
            ignore_opacity = true,
            new_optimizations = true,
            noise = 0,
            vibrancy = 0.1,
            vibrancy_darkness = 0,
        },
    },
})
hl.config({
    dwindle = {
        preserve_split = true,
        smart_split = true,
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
        force_default_wallpaper = 2,
        disable_hyprland_logo = false,
        allow_session_lock_restore = true,
        always_follow_on_dnd = true,
        session_lock_blur = true,
        session_lock_xray = true,
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
        tablet       = {
            enabled = true,
        }
    },
})
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace"
})
