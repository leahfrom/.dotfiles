local awful = require("awful")
local gears = require("gears")

local wibox = require("wibox")

local vicious = require("vicious")


awful.screen.connect_for_each_screen(function(s)
    awful.tag({ "sys", "web", "chat", "work", "misc"}, s, awful.layout.layouts[1])

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

    -- CPU
    mycpuwidget = wibox.widget.textbox()
    vicious.register(mycpuwidget, vicious.widgets.cpu, "  $1%", 3)

    -- Memory
    mymemwidget = wibox.widget.textbox()
    vicious.register(mymemwidget, vicious.widgets.mem, " $1%", 13)

    -- Network
    mynetwidget = wibox.widget.textbox()
    vicious.register(mynetwidget, vicious.widgets.net, " ${enp42s0 down_kb}/${enp42s0 up_kb} kb", 3)

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
	            --wibox.widget.systray(),
		    --wibox.widget.textbox(" | "),
		    mycpuwidget,
		    wibox.widget.textbox(" "),
		    mymemwidget,
		    wibox.widget.textbox(" "),
		    mynetwidget,
	            --mytextclock,
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
