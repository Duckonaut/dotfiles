local gears   = require("gears")
local lain    = require("lain")
local awful   = require("awful")
local wibox   = require("wibox")
local dpi     = require("beautiful.xresources").apply_dpi
local naughty = require("naughty")

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local highlight_col = "#61AFEF"
local base_col = "#101020"
local base_col_transluscent = "#10102090"

local round_shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, dpi(4))
end

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/theming"
theme.wallpaper                                 = os.getenv("HOME") .. "/Pictures/campsite.jpg"
theme.font                                      = "Hack Nerd Font 11"
theme.fg_normal                                 = "#ffffff"
theme.fg_focus                                  = base_col
theme.fg_urgent                                 = base_col
theme.bg_normal                                 = base_col
theme.bg_focus                                  = highlight_col
theme.bg_urgent                                 = "#ba6840"
theme.clock_color                               = "#56b6c2"
theme.mem_color                                 = "#985fdd"
theme.cpu_color                                 = "#44b080"
theme.temp_color                                = "#c13251"
theme.bat_color                                 = "#e5c07b"
theme.net_color                                 = highlight_col
theme.music_color                               = "#98c379"
theme.volume_color                              = "#aaddee"
theme.network_color                             = "#61afef"
theme.systray_color                             = "#2980b9"
theme.border_width                              = dpi(2)
theme.border_normal                             = theme.bg_normal
theme.border_focus                              = theme.bg_focus
theme.border_marked                             = theme.bg_urgent
theme.tasklist_bg_focus                         = "#395fdc"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.bg_systray                                = theme.systray_color
theme.menu_height                               = dpi(24)
theme.menu_width                                = dpi(160)
theme.taglist_bg_empty                          = "#00000000"
theme.taglist_bg_occupied                       = "#395fdc"
theme.taglist_fg_occupied                       = base_col
theme.taglist_bg_focus                          = theme.bg_focus
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_net_up                             = theme.dir .. "/icons/net_up.png"
theme.widget_net_updown                         = theme.dir .. "/icons/net_updown.png"
theme.widget_net_down                           = theme.dir .. "/icons/net_down.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_off                          = theme.dir .. "/icons/note_off.png"
theme.widget_music_paused                       = theme.dir .. "/icons/paused.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_bg_focus                         = "#d19953"
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = dpi(4)
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

theme.notification_font         = "Hack Nerd Font 12"
theme.notification_shape        = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, dpi(12))
end
theme.notification_border_color = theme.bg_focus
theme.notification_border_width = dpi(20)
theme.notification_margin       = dpi(30)

theme.notification_max_width = dpi(500)
theme.notification_max_height = dpi(160)

local markup = lain.util.markup

local block = function(widgets, color)
    return wibox.container.margin(
        wibox.container.background(
            wibox.container.margin(
                wibox.widget(widgets),
                dpi(2), dpi(6), dpi(2), dpi(2)
            ),
            color, round_shape),
        dpi(4), dpi(0), dpi(4), dpi(4))
end

-- Textclock
local clocktext = awful.widget.watch(
    "date +' %R'", 60,
    function(widget, stdout)
        widget:set_markup(" " .. markup.font(theme.font, markup.fg.color(base_col, stdout)))
    end
)

local clock = block({
    clocktext,
    layout = wibox.layout.align.horizontal
},
    theme.clock_color)

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { clock },
    notification_preset = {
        font = "Hack Nerd Font 10",
        fg   = theme.fg_normal,
        bg   = base_col
    }
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local memtext = lain.widget.mem({
    settings = function()
        widget:set_markup(" " .. markup.font(theme.font, markup.fg.color(base_col, " " .. mem_now.used .. "MB")))
    end
})
local mem = block({
    --memicon,
    memtext,
    layout = wibox.layout.align.horizontal
},
    theme.mem_color)

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cputext = lain.widget.cpu({
    settings = function()
        widget:set_markup(" " .. markup.font(theme.font, markup.fg.color(base_col, " " .. cpu_now.usage .. "%")))
    end
})

local cpu = block({
    --cpuicon,
    cputext,
    layout = wibox.layout.align.horizontal
},
    theme.cpu_color)


-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temptext = awful.widget.watch(
    "cat /sys/class/thermal/thermal_zone9/temp", 10,
    function(widget, stdout)
        local tmp = string.sub(stdout, 1, -2)
        tmp = tonumber(tmp) / 1000
        tmp = string.format("%.1f", tmp)
        widget:set_markup(" " .. markup.font(theme.font, markup.fg.color(base_col, " " .. tmp .. "°C")))
    end
)

local temp = block({
    --tempicon,
    temptext,
    layout = wibox.layout.align.horizontal
},
    theme.temp_color)


-- Battery
local baticon = wibox.widget.imagebox(theme.widget_battery)
local battext = awful.widget.watch(
    "cat /sys/class/power_supply/BAT0/capacity", 20,
    function(widget, stdout)
        widget:set_markup(" " ..
            markup.font(theme.font, markup.fg.color(base_col, "  " .. string.sub(stdout, 1, -2) .. "%")))
    end
)

local bat = block({
    --baticon,
    battext,
    layout = wibox.layout.align.horizontal
},
    theme.bat_color)

-- Music
local musicicon = wibox.widget.imagebox(theme.widget_music)
local musictext = awful.widget.watch(
    'multiplayerctl metadata --format="{{artist}} :=:{{title}}:=:{{status}}"', 10,
    function(widget, stdout)
        local out = string.sub(stdout, 1, -2)

        local artist, title, status = string.match(out, "(.*):=:(.*):=:(.*)")

        if stdout == nil or
            artist == '' or
            artist == nil or
            status == '' or
            status == nil
        then
            musicicon.image = nil
            widget:set_markup("")
        else
            local text = artist
            if title ~= nil then
                text = text .. "- " .. title
            end

            widget:set_markup(" " .. markup.font(theme.font, markup.fg.color(base_col, text)))

            if status == "Playing" then
                musicicon.image = theme.widget_music
            elseif status == "Paused" then
                musicicon.image = theme.widget_music_paused
            else
                musicicon.image = nil
            end
        end
    end
)

function theme.update_music(command)
    awful.spawn.easy_async_with_shell(
        command .. '&& sleep 0.2 && multiplayerctl metadata --format="{{artist}} :=:{{title}}:=:{{status}}"',
        function(stdout)
            local out = string.sub(stdout, 1, -2)

            local artist, title, status = string.match(out, "(.*):=:(.*):=:(.*)")

            if stdout == nil or
                artist == '' or
                artist == nil or
                status == '' or
                status == nil
            then
                musicicon.image = nil
                musictext:set_markup("")
            else
                local text = artist
                if title ~= nil then
                    text = text .. "- " .. title
                end

                musictext:set_markup(" " .. markup.font(theme.font, markup.fg.color(base_col, text)))

                if status == "Playing" then
                    musicicon.image = theme.widget_music
                elseif status == "Paused" then
                    musicicon.image = theme.widget_music_paused
                else
                    musicicon.image = nil
                end
            end
        end
    )
end

local music = block({
    musicicon,
    musictext,
    layout = wibox.layout.align.horizontal
},
    theme.music_color)

local function go_to_player()
    awful.spawn.easy_async_with_shell(
        'cat ' .. (os.getenv("XDG_CACHE_HOME") or (os.getenv("HOME") .. '/.cache')) .. '/multiplayerctl/currentplayer',
        function(stdout)
            local player = string.sub(stdout, 1, -2)

            local lower_player = string.lower(player)

            for _, c in ipairs(client.get()) do
                if string.lower(c.class) == lower_player then
                    c.minimized = false
                    c:raise()
                    c:jump_to(false)
                    break
                end
            end
        end)
end

music:buttons(my_table.join(
    awful.button({}, 1,
        function()
            theme.update_music('multiplayerctl toggle')
        end
    ),
    awful.button({}, 2,
        go_to_player
    ),
    awful.button({}, 3,
        function()
            theme.update_music('multiplayerctl switch')
        end
    ),
    awful.button({}, 4,
        function()
            theme.update_music('multiplayerctl switch --back')
        end
    ),
    awful.button({}, 5,
        function()
            theme.update_music('multiplayerctl switch --next')
        end
    )
))

local volumetext = lain.widget.alsa({
    settings = function()
        local volicon = " "
        if volume_now.status == "off" then
            volicon = " "
        elseif tonumber(volume_now.level) == 0 then
            volicon = " "
        elseif tonumber(volume_now.level) <= 50 then
            volicon = " "
        else
            volicon = " "
        end

        widget:set_markup(" " .. markup.font(theme.font, markup.fg.color(base_col, volicon .. volume_now.level .. "%")))
    end
})

local volume = block({
    --volumeicon,
    volumetext,
    layout = wibox.layout.align.horizontal
},
    theme.volume_color)

-- {{ systray
local systray_proto = wibox.widget.systray()

local systray = wibox.container.margin(
        wibox.container.background(
            wibox.container.margin(
            systray_proto,
                dpi(2), dpi(2), dpi(2), dpi(2)
            ),
            theme.systray_color, round_shape),
        dpi(4), dpi(0), dpi(4), dpi(4))
-- }}

-- Separators
local spr = wibox.widget.textbox(' ')

function theme.at_screen_connect(s)
    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 2, function() awful.layout.set(awful.layout.layouts[1]) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc(1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = awful.util.taglist_buttons,
        style = {
            shape = round_shape,
        },
        layout = {
            spacing = 3,
            layout = wibox.layout.fixed.horizontal
        },
        widget_template = {
            layout = wibox.layout.fixed.horizontal,
            widget = wibox.container.margin,
            {
                widget = wibox.container.background,
                id = 'background_role',
                bg = theme.bg_normal,
                {
                    widget = wibox.container.margin,
                    left = 4,
                    right = 1,
                    top = 4,
                    bottom = 4,
                    {
                        id = 'text_role',
                        widget = wibox.widget.textbox,
                        bg = theme.bg_focus,
                    },
                },
            },
        },
    }

    s.mytaglist = wibox.container.margin(s.mytaglist, dpi(4), dpi(4), dpi(4), dpi(4))

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = awful.util.tasklist_buttons,
        style = {
            shape = round_shape,
        },
        layout = {
            spacing = 4,
            layout = wibox.layout.fixed.horizontal
        },
        widget_template = {
            layout = wibox.layout.flex.horizontal,
            margins = 4,
            widget = wibox.container.margin,
            {
                id = 'background_role',
                widget = wibox.container.background,
                {
                    widget = wibox.container.margin,
                    margins = 4,
                    {
                        id = 'text_role',
                        widget = wibox.widget.textbox,
                        bg = theme.bg_focus,
                    },
                },
            },
        }
    }

    s.mytasklist = wibox.container.margin(s.mytasklist, dpi(4), dpi(4), dpi(4), dpi(4))

    -- Create the wibox
    s.mywibox = awful.wibar({
        screen = s,
        height = dpi(40),
        bg = '#00000000',
        fg = theme.fg_normal,
        shape = function(cr, w, h)
            gears.shape.rounded_rect(cr, w, h, dpi(12))
        end
    })

    -- Add widgets to the wibox
    s.mywibox:setup {
        widget = wibox.container.margin,
        left = dpi(8),
        right = dpi(8),
        top = dpi(8),
        bottom = dpi(0),
        {
            widget = wibox.container.background,
            bg = base_col_transluscent,
            shape = function(cr, w, h)
                gears.shape.rounded_rect(cr, w, h, dpi(6))
            end,
            {
                layout = wibox.layout.align.horizontal,
                { -- Left widgets
                    layout = wibox.layout.fixed.horizontal,
                    --spr,
                    s.mytaglist,
                    s.mypromptbox,
                },
                -- s.mytasklist, -- Middle widget
                spr,
                { -- Right widgets
                    layout = wibox.layout.fixed.horizontal,
                    systray,
                    music,
                    volume,
                    cpu,
                    mem,
                    temp,
                    bat,
                    clock,
                    s.mylayoutbox,
                },
            }
        }
    }
end

return theme
