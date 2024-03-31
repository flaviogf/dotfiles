local awful = require('awful')
local dpi = require('beautiful.xresources').apply_dpi
local gears = require('gears')
local lain = require('lain')
local wibox = require('wibox')

local background = '#16161e'
local black = '#363b54'
local blue = '#7aa2f7'
local cyan = '#7dcfff'
local foreground = '#787c99'
local green = '#41a6b5'
local purple = '#bb9af7'
local red = '#f7768e'
local white = '#787c99'
local yellow = '#e0af68'

local theme = {}
theme.dir = os.getenv('HOME') .. '/.config/awesome/config'
theme.wallpaper = theme.dir .. '/wall.jpg'
theme.bg_focus = background
theme.bg_normal = background
theme.border_focus = purple
theme.border_normal = black
theme.border_width = dpi(2)
theme.font = 'JetBrainsMono Nerd Font 12'
theme.fg_focus = foreground
theme.fg_normal = foreground
theme.layout_txt_tile = '[t]'
theme.layout_txt_tilebottom = '[b]'
theme.layout_txt_max = '[m]'
theme.useless_gap = dpi(4)

local markup = lain.util.markup

awful.util.tagnames = { ' 1 ', ' 2 ', ' 3 ', ' 4 ', ' 5 ' }

local cpu = lain.widget.cpu({
  settings = function()
    widget:set_markup(markup.font(theme.font, markup(purple, ' cpu: ') .. cpu_now.usage .. '% '))
  end
})

local mem = lain.widget.mem({
  settings = function()
    widget:set_markup(markup.font(theme.font, markup(purple, ' mem: ') .. mem_now.used .. 'M '))
  end
})

local bat = lain.widget.bat({
  settings = function()
    widget:set_markup(markup.font(theme.font, markup(purple, ' bat: ') .. bat_now.perc .. '% '))
  end
})

local textclock = wibox.widget.textclock(' %H:%M ')
textclock.font = theme.font

local spr = wibox.widget.textbox(' ')

function theme.at_screen_connect(s)
  gears.wallpaper.maximized(theme.wallpaper, s, true)

  awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

  s.mytaglist = awful.widget.taglist(
    s,
    awful.widget.taglist.filter.all,
    awful.util.taglist_buttons,
    { bg_normal = background, bg_focus = purple }
  )

  s.mypromptbox = awful.widget.prompt()

  s.mywibox = awful.wibar({ position = 'top', screen = s, height = dpi(24), bg = background })

  s.mywibox:setup(
    {
      layout = wibox.layout.align.horizontal,
      {
        layout = wibox.layout.fixed.horizontal,
        s.mytaglist,
        spr,
        s.mypromptbox,
        spr,
      },
      nil,
      {
        layout = wibox.layout.fixed.horizontal,
        spr,
        cpu.widget,
        mem.widget,
        bat.widget,
        textclock,
      },
    }
  )
end

return theme
