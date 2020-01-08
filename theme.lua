---------------------------
-- Default awesome theme --
---------------------------
local gears = require("gears")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local awful = require("awful")
local gfs = require("gears.filesystem")
local themes_path = os.getenv("HOME") .. "/.config/awesome/icons/"
local xrdb = xresources.get_current_theme () 
local theme = {}

theme.font          = "DejaVu Sans Mono 10"

theme.bg_normal     = "#181e24"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#b7c5d3"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(1)
theme.border_width  = dpi(0)
theme.border_normal = "#000000"
theme.border_focus  = "#ffffff"
theme.border_marked = "#91231c"
theme.border_radius = dpi(0)
-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"
theme.prompt_bg = xrdb.background
--Wibar
theme.wibar_fg = xrdb.foreground
theme.wibar_bg = xrdb.background
theme.wibar_opacity = 0.9
-- theme.wibar_opacity = .9
theme.wibar_border_width = dpi(1)
theme.wibar_border_color = xrdb.foreground
theme.wibar_height = 25
-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
  taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
  taglist_square_size, theme.fg_normal
)

theme.taglist_bg_focus = xrdb.foreground
theme.taglist_fg_focus = xrdb.background
theme.taglist_bg_occupied = "#00000000"
theme.taglist_fg_occupied = "#ffffff50"
--theme.taglist_bg_empty = theme.xbackground
--theme.taglist_fg_empty = theme.xbackground
--theme.taglist_bg_urgent = theme.xbackground
--theme.taglist_fg_urgent = theme.xcolor3
theme.taglist_disable_icon = false
theme.taglist_spacing = dpi(1)
theme.taglist_item_roundness = dpi(0)

--theme.taglist_text_empty    = {"","","","","","","","","",""}
theme.taglist_text_occupied = {"","","","","","","","","",""}
theme.taglist_text_focused  = {"","","","","","",""}
--theme.taglist_text_urgent = {"","","","","","","","","",""}

-- Variables set for theming notifications:
theme.notification_font = "Liberation Mono 10"
theme.notification_bg = xrdb.background
theme.notification_fg = xrdb.foreground


-- notification_[width|height|margin]
theme.notification_shape = gears.shape.rounded_rect
theme.notification_icon_size = dpi(60)
theme.notification_max_height = dpi(100)
theme.notification_max_width = dpi(500)
theme.notification_margin = dpi(0)
theme.notification_opacity = 1
-- theme.notification_font = theme.font
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."terminal.png"
theme.menu_height = dpi(25)
theme.menu_width  = dpi(150)
theme.menu_bg_focus = "#181e24"
theme.menu_bg_normal = "#111111"
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.png"

theme.wallpaper = themes_path.."default/background.png"

--Tasklist
theme.tasklist_disable_icon = true
--theme.tasklist_disable_task_name = false
theme.tasklist_plain_task_name = true
theme.tasklist_bg_focus = "#00000050"
theme.tasklist_fg_focus = xrdb.foreground
theme.tasklist_bg_normal = "#00000000"
theme.tasklist_fg_normal = xrdb.foreground
theme.tasklist_bg_minimize = "#000000"
theme.tasklist_fg_minimize = xrdb.foreground
theme.tasklist_spacing = dpi(5)
theme.tasklist_align = "center"




-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."flighttrack.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."appdialer.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
-- theme.awesome_icon = theme_assets.awesome_icon(
--     theme.menu_height, theme.bg_focus, theme.fg_focus
-- )
theme.awesome_icon = themes_path.."apex.png"
-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "/usr/share/icons/Papirus"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
