local awful = require("awful")
local gears = require("gears")

local wibox = require("wibox")

awful.screen.connect_for_each_screen(function(s)
    awful.tag({ "sys", "web", "chat", "work", "5" ,"6", "7", "8", "9"}, s, awful.layout.layouts[1])

    -- Layoutbox
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(awful.button({ }, 1, function () awful.layout.inc( 1) end),
                                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
					   awful.button({ }, 4, function () awful.layout.inc( 1) end),
					   awful.button({ }, 5, function () awful.layout.inc(-1) end)))

    -- Taglist widget
    s.mytaglist = awful.widget.taglist {
        screen = s,
	filter = awful.widget.taglist.filter.all,
	buttons = taglist_buttons,
    }

    -- Textclock widget
    mytextclock = wibox.widget.textclock('%a %e %b, %H:%M')

    -- Wibox
    s.mywibox = awful.wibar({ position = "top",
		              height = 32,
			      bg = "#00000000",
		              shape = gears.shape.rounded_rect,
		              screen = s
		            })

    -- Widgets for wibox
    s.mywibox:setup {
	{
            layout = wibox.layout.align.horizontal,
	    expand = "none",
	    { -- Left widgets
	        {
		    layout = wibox.layout.fixed.horizontal,
		    wibox.widget.textbox(" "),
	            s.mytaglist,
		    wibox.widget.textbox(" ")
	        },
		widget = wibox.container.background,
		bg = "#282c347F",
		shape = gears.shape.rounded_rect
            },
	    {
	        {
		    layout = wibox.layout.fixed.horizontal,
		    wibox.widget.textbox(" "),
                    mytextclock,
		    wibox.widget.textbox(" ")
		},
		widget = wibox.container.background,
		bg = "#282c347F",
		shape = gears.shape.rounded_rect
	    }, -- Middle widget
	    { -- Right widgets
	        {
		    layout = wibox.layout.fixed.horizontal,
		    wibox.widget.textbox(" "),
	            wibox.widget.systray(),
		    wibox.widget.textbox(" | "),
	            mytextclock,
	            --s.mylayoutbox,
		    wibox.widget.textbox(" ")
		},
		widget = wibox.container.background,
		bg = "#282c347F",
		shape = gears.shape.rounded_rect
	    }
        },
	widget = wibox.container.margin,
	left = 8,
	right = 8,
	top = 8,
	bottom = 0
    }
end)
