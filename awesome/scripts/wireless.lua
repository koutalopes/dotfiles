local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")
local gfs = require("gears.filesystem")

local icon_path = gfs.get_configuration_dir() .. "/themes/default/status/"

local wireless_widget = wibox.widget {
    {
        id = "icon",
        widget = wibox.widget.imagebox,
        resize = false,
    },
    layout = wibox.container.margin(_, 0, 0, 3)
}


awful.widget.watch('bash -c "iw wlp9s0 link | grep signal"', 10,
    function(widget, stdout)
        local signal = string.match(stdout, "%d+")
        local signal = tonumber(signal)

        if (signal == nil) then
            icon = "disconnected"
        elseif (signal > 0 and signal <= 60 ) then
            icon = "connected-100"
        elseif (signal > 60 and signal <= 70) then
            icon = "connected-75"
        elseif (signal > 70 and signal <= 80) then
            icon = "connected-50"
        elseif (signal > 80) then
            icon = "connected-25"  
        end

        widget.icon:set_image(icon_path .. "network-wireless-" .. icon .. ".svg")
    end,
    wireless_widget
)

return wireless_widget
