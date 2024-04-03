local awful = require('awful')
local gears = require('gears')

local M = {}

function M.setup(_)
  local modkey = 'Mod4'

  local myBrowser = 'firefox'
  local myTerminal = 'kitty'

  local globalkeys = gears.table.join(
    awful.key({ modkey, 'Control' }, 'r', awesome.restart),
    awful.key({ modkey, 'Shift' }, 'q', awesome.quit),
    awful.key({ modkey }, 'j', function() awful.client.focus.byidx(1) end),
    awful.key({ modkey }, 'k', function() awful.client.focus.byidx(-1) end),
    awful.key({ modkey, 'Shift' }, 'j', function() awful.client.swap.byidx(1) end),
    awful.key({ modkey, 'Shift' }, 'k', function() awful.client.swap.byidx(-1) end),
    awful.key({ modkey }, 'Return', function() awful.spawn(myTerminal) end),
    awful.key({ modkey }, 'r', function() awful.screen.focused().mypromptbox:run() end),
    awful.key({ modkey }, 'l', function() awful.tag.incmwfact(0.05) end),
    awful.key({ modkey }, 'h', function() awful.tag.incmwfact(-0.05) end),
    awful.key({ modkey }, 'space', function() awful.layout.inc(1) end),
    awful.key({ modkey, 'Shift' }, 'space', function() awful.layout.inc(-1) end),
    awful.key({ modkey, 'Control' }, 'space', awful.client.floating.toggle),
    awful.key({ modkey }, 'w', function() awful.spawn(myBrowser) end),
    awful.key({ modkey }, 'p', function() awful.spawn('flameshot gui') end)
  )

  local clientkeys = gears.table.join(
    awful.key({ modkey, 'Shift' }, 'c', function(c) c:kill() end)
  )

  local change_to_tag = function(i)
    return function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        tag:view_only()
      end
    end
  end

  local move_to_tag = function(i)
    return function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end
  end

  for i = 1, 9 do
    globalkeys = gears.table.join(
      globalkeys,
      awful.key({ modkey }, '#' .. i + 9, change_to_tag(i)),
      awful.key({ modkey, 'Shift' }, '#' .. i + 9, move_to_tag(i))
    )
  end

  root.keys(globalkeys)

  return {
    globalkeys = globalkeys,
    clientkeys = clientkeys,
  }
end

return M
