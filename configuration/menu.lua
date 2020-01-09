local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local themes_path = os.getenv("HOME") .. "/.config/awesome/icons/"
local beautiful = require("beautiful")
require("awful.hotkeys_popup.keys")

social = {
  {"Whatsapp", browser .. "https://web.whatsapp.com/", themes_path .. "whatsapp.png"  },
  {"Telegram", "telegram-desktop", themes_path .. "telegram.png" },
  {"Discord", "discord", themes_path .. "discord.png" },
  {"Reddit", browser .. "https://www.reddit.com/", themes_path .. "reddit.png"},
  {"Github", browser .. "https://github.com/", themes_path .. "github.png"},
}

myawesomemenu = {
  { "Help", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "Manual", terminal .. " -e man awesome" },
  { "Edit Config", editor_cmd .. " " .. awesome.conffile },
  { "Restart", awesome.restart },
  { "Quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = {
                            {"Social", social, themes_path .. "browser.png"},
                            {"Terminal", terminal, themes_path.."termux.png" },
                            {"Firefox", "firefox", themes_path.."firefox.png"},
                            {"Dolphin", "dolphin", themes_path.."filemanager.png"},
                            {"Awesome", myawesomemenu, beautiful.awesome_icon },
}
                       })

mylauncher = awful.widget.launcher({ image = themes_path.."apex.png",
                                     menu = mymainmenu })
