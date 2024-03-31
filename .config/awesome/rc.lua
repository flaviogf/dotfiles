pcall(require, 'luarocks.loader')

require('awful.autofocus')
local awful = require('awful')
local beautiful = require('beautiful')
require('awful.hotkeys_popup.keys')

beautiful.init(string.format('%s/.config/awesome/config/theme.lua', os.getenv('HOME')))

local keys = require('config.keys').setup()

require('config.layout').setup()
require('config.rules').setup(keys)

awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)

client.connect_signal('focus', function(c) c.border_color = beautiful.border_focus end)
client.connect_signal('unfocus', function(c) c.border_color = beautiful.border_normal end)
