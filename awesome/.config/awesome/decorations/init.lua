local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")

beautiful.useless_gap = 4

-- Focus border
client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- Rounded corners
client.connect_signal("manage", function (c)
    if not c.fullscreen and not c.maximized then
        c.shape = gears.shape.rounded_rect
    end
end)

client.connect_signal("property::fullscreen", function (c)
    if c.fullscreen then
        c.shape = gears.shape.rectangle
    else
	c.shape = gears.shape.rounded_rect
    end
end)

client.connect_signal("property::maximized", function (c)
    if c.maximized then
        c.shape = gears.shape.rectangle
    else
        c.shape = gears.shape.rounded_rect
    end
end)
