hl.monitor {
    output = "DP-2",
    mode = "2560x1440@240",
    position = "0x0",
    scale = 1,
}

hl.monitor {
    output = "HDMI-A-2",
    mode = "preferred",
    position = "2560x0",
    scale = 1,
}

hl.dsp.workspace.move({ 1, monitor = "DP-2" })
hl.dsp.workspace.move({ 11, monitor = "HDMI-A-2" })

hl.config {
    input = {
        kb_layout = "pl",

        follow_mouse = 1,
        repeat_delay = 400,
        repeat_rate = 30,
        touchpad = {
            natural_scroll = true,
            clickfinger_behavior = true,
            disable_while_typing = false,
        }
    },
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border = 0xFF61AFEF,
            inactive_border = 0x50101020,
        },
    },

    decoration = {
        rounding = 10,
        blur = {
            enabled = true,
            size = 8,
            passes = 3,
            new_optimizations = true,
            xray = true,
        },
        shadow = {
            render_power = 2,
            color = 0x30101020,
        },
    },
    dwindle = {
        preserve_split = true,
    },
    misc = {
        force_default_wallpaper = 0,
        focus_on_activate = true,
        animate_manual_resizes = false,
        animate_mouse_windowdragging = false,
    },
}

hl.layer_rule {
    name = "blur-notif",
    match = {
        namespace = "swaync-control-center",
    },
    blur = true,
    xray = false,
    ignore_alpha = false
}

hl.layer_rule {
    name = "ignore-gtklayershell-alpha",
    match = {
        namespace = "gtk-layer-shell",
    },
    ignore_alpha = false
}

hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.1 } } })
hl.curve("little_overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.02 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 2, bezier = "little_overshot" })
hl.animation({ leaf = "border", enabled = true, speed = 3, bezier = "overshot" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "overshot" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "little_overshot" })

hl.gesture { fingers = 3, direction = "horizontal", action = "workspace" }

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
})

hl.window_rule {
    name = "floaters-dev",
    match = {
        title = "^(dev:).*"
    },
    float = true
}

hl.window_rule {
    name = "floaters-dev",
    match = {
        title = "^(dev:).*"
    },
    float = true
}


hl.window_rule {
    name = "steam",
    match = {
        initial_class = "^(steam_app:).*"
    },
    fullscreen = true,
    monitor = 0,
}

hl.bind("SUPER + Q", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + RETURN",
    hl.dsp.exec_cmd("RUST_BACKTRACE=1 alacritty --config-file ~/.config/alacritty/alacritty-awesome.toml"))
hl.bind("SUPER + SHIFT + C", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + Q", hl.dsp.exit())
hl.bind("SUPER + E", hl.dsp.exec_cmd("nautilus"))
hl.bind("SUPER+ F", hl.dsp.window.fullscreen())
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd("tofi-drun | xargs -I{} hyprctl dispatch 'hl.exec_cmd(\"{}\")'"))

hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + SHIFT + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + SHIFT + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + SHIFT + down", hl.dsp.focus({ direction = "down" }))

package.path = package.path .. ";./?.lua;./?/init.lua"
local smw = require("plugins.split-monitor-workspaces")

smw.setup({
    workspace_count = 10, -- This will create 5 persistent workspaces on each monitor at startup
})

-- hl.bind("SUPER + M", smw.change_monitor("next"))

local mainMod = "SUPER"
for i = 1, smw.get_amount_of_workspaces() do
    local n = tostring(i)
    if n == "10" then n = "0" end
    hl.bind(mainMod .. " +" .. n, smw.workspace(n))
    hl.bind(mainMod .. " + SHIFT +" .. n, smw.move_to_workspace(n))
    hl.bind(mainMod .. " + CONTROL +" .. n, smw.move_to_workspace_silent(n))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("/home/duckonaut/.cargo/bin/multiplayerctl toggle"))
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("/home/duckonaut/.cargo/bin/multiplayerctl switch"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("/home/duckonaut/.cargo/bin/multiplayerctl previous"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("/home/duckonaut/.cargo/bin/multiplayerctl next"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +10"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10-"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))

hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" -t png - | wl-copy"))
hl.bind("SUPER + CONTROL + S",
    hl.dsp.exec_cmd("grim -g \"$(slurp)\" -o $(xdg-user-dir PICTURES)/grim/$(date +%Y-%m-%d-%H-%M-%S).png"))
hl.bind("print", hl.dsp.exec_cmd("grim -t png - | wl-copy"))

hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind("SUPER + P",
    hl.dsp.exec_cmd(
        "eww open --toggle --screen \"$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .id')\" powermenu"))
hl.bind("SUPER + Z", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/zentoggle.sh"))

hl.env("_JAVA_AWT_WM_NONEPARENTING", "1")
hl.env("XCURSOR_SIZE", "24")
hl.env("LIBVA_DRIVER_NAME", "radeonsi")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("dbus-update-activation-environment --all")
    hl.exec_cmd("sleep 1 && dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP") -- Some fix idk

    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("swaync")
    hl.exec_cmd("$HOME/.config/eww/scripts/open.sh")
    hl.exec_cmd("lxpolkit")
    hl.exec_cmd("hyprpm reload")
end)
