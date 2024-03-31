local awful = require('awful')

local M = {}

function M.setup(_)
  awful.layout.layouts = {
    awful.layout.suit.tile.right,
    awful.layout.suit.max,
    awful.layout.suit.magnifier,
  }
end

return M
