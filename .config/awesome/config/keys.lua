local awful = require('awful')
local gears = require('gears')

local M = {}

function M.setup(_)
  local modkey = 'Mod4'

  local myTerminal = 'kitty'

  local globalkeys = gears.table.join(
    awful.key(
      { modkey, 'Control' }, 'r',
      awesome.restart,
      { description = 'reload awesome', group = 'awesome' }
    ),
    awful.key(
      { modkey, 'Shift' }, 'q',
      awesome.quit,
      { description = 'quit awesome', group = 'awesome' }
    ),
    awful.key(
      { modkey }, 'j',
      function() awful.client.focus.byidx(1) end,
      { description = 'focus next by index', group = 'client' }
    ),
    awful.key(
      { modkey }, 'k',
      function() awful.client.focus.byidx(-1) end,
      { description = 'focus previous by index', group = 'client' }
    ),
    awful.key(
      { modkey, 'Shift' }, 'j',
      function() awful.client.swap.byidx(1) end,
      { description = 'swap with next client by index', group = 'client' }
    ),
    awful.key(
      { modkey, 'Shift' }, 'k',
      function() awful.client.swap.byidx(-1) end,
      { description = 'swap with previous client by index', group = 'client' }
    ),
    awful.key(
      { modkey }, 'Return',
      function() awful.spawn(myTerminal) end,
      { description = 'open a terminal', group = 'launcher' }
    ),
    awful.key(
      { modkey }, 'r',
      function() awful.screen.focused().mypromptbox:run() end,
      { description = 'run prompt', group = 'launcher' }
    ),
    awful.key(
      { modkey }, 'l',
      function() awful.tag.incmwfact(0.05) end,
      { description = 'increase master width factor', group = 'layout' }
    ),
    awful.key(
      { modkey }, 'h',
      function() awful.tag.incmwfact(-0.05) end,
      { description = 'decrease master width factor', group = 'layout' }
    ),
    awful.key(
      { modkey }, 'space',
      function() awful.layout.inc(1) end,
      { description = 'select next', group = 'layout' }
    ),
    awful.key(
      { modkey, 'Shift' }, 'space',
      function() awful.layout.inc(-1) end,
      { description = 'select previous', group = 'layout' }
    )
  )

  local clientkeys = gears.table.join(
    awful.key(
      { modkey, 'Shift' }, 'c',
      function(c) c:kill() end,
      { description = 'close', group = 'client' }
    )
  )

  for i = 1, 9 do
    globalkeys = gears.table.join(
      globalkeys,
      awful.key(
        { modkey }, '#' .. i + 9,
        function()
          local screen = awful.screen.focused()
          local tag = screen.tags[i]
          if tag then
            tag:view_only()
          end
        end,
        { description = 'view tag #' .. i, group = 'tag' }
      ),
      awful.key(
        { modkey, 'Shift' }, '#' .. i + 9,
        function()
          if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then
              client.focus:move_to_tag(tag)
            end
          end
        end,
        { description = 'move focused client to tag #' .. i, group = 'tag' }
      )
    )
  end

  root.keys(globalkeys)

  return {
    globalkeys = globalkeys,
    clientkeys = clientkeys,
  }
end

return M
