local awful = require('awful')
local beautiful = require('beautiful')

local M = {}

function M.setup(options)
  awful.rules.rules = {
    {
      rule = {},
      properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        keys = options.clientkeys,
        placement = awful.placement.no_overlap + awful.placement.no_offscreen,
        raise = true,
        screen = awful.screen.preferred,
      },
    },
  }
end

return M
