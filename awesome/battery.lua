local awful = require("awful")
local wibox = require("wibox")
local gfs = require("gears.filesystem")
local naughty = require("naughty")

local icon_path = gfs.get_configuration_dir() .. "themes/default/status/"

local battery_widget = wibox.widget {
    {
        id = "icon",
        widget = wibox.widget.imagebox,
        resize = false,
    },
    layout = wibox.container.margin(_, 0, 0, 3)
}

local notification
local function battery_status()
    awful.spawn.easy_async([[bash -c 'acpi']],
        function(stdout, _, _, _)
            naughty.destroy(notification)
            notification = naughty.notify {
                text = stdout,
                timeout = 5,
                hover_timeout = 0.5,
                width = 200,
            }
        end
    )
end

awful.widget.watch("acpi -b", 3,
    function(widget, stdout)
        local status, cap = string.match(stdout, ".+: (%a+), (%d+)")
        local cap = tonumber(cap)
        local status = tostring(status)
        --local cap = tonumber(stdout)

        if (cap == 100) then
            icon = "100"
        elseif (cap < 100 and cap >= 90) then
            icon = "090"
        elseif (cap < 90 and cap >= 80) then
            icon = "080"
        elseif (cap < 80 and cap >= 70) then
            icon = "070"
        elseif (cap < 70 and cap >= 60) then
            icon = "060"
        elseif (cap < 60 and cap >= 50) then
            icon = "050"
        elseif (cap < 50 and cap >= 40) then
            icon = "040"
        elseif (cap < 40 and cap >= 30) then
            icon = "030"
        elseif (cap < 30 and cap >= 20) then
            icon = "020"
        elseif (cap < 20 and cap >= 20) then
            icon = "010"
        elseif (cap < 10) then
            icon = "000"
        end

        if (status == "Charging") then
            widget.icon:set_image(icon_path .. "battery-" .. icon .. "-charging.svg")
        else
            widget.icon:set_image(icon_path .. "battery-" .. icon .. ".svg")
        end

    end,
    battery_widget
)

battery_widget:connect_signal("mouse::enter", function() battery_status() end)
battery_widget:connect_signal("mouse::leave", function() naughty.destroy(notification) end)

return battery_widget
