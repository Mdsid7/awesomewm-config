local awful = require("awful")

volume_widget = awful.widget.watch("amixer sget Master", 1, function(widget, stdout)
                                     local volume = tonumber(string.match(stdout, "(%d?%d?%d)%%"))
    -- volume = string.format("% 3d", volume)

    stdout = string.match(stdout, "%[(o[^%]]*)%]")

    if string.find(stdout, "on", 1, true) then
        volume = " " .. volume .. "%"
    else
        volume = " N/A"
    end
    widget.text = volume
end)

battery_widget =  awful.widget.watch("acpi", 1, function(widget, stdout)
                                     local battery = tonumber(string.match(stdout, "(%d?%d?%d)%%"))
    -- volume = string.format("% 3d", volume)

    --  if string.find(stdout, "on", 1, true) then
    --     volume = " " .. volume
    -- else
    --     volume = " N/A"
    -- end
    battery = " " .. battery .. "%"
    widget.text = battery
end)

brightness_widget =  awful.widget.watch("light", 1, function(widget, stdout)
                                          local brightness = math.floor(stdout)
    -- volume = string.format("% 3d", volume)

    --  if string.find(stdout, "on", 1, true) then
    --     volume = " " .. volume
    -- else
    --     volume = " N/A"
    -- end
    brightness = "    " .. brightness .. "%"
    widget.text = brightness
end)

date_widget =  awful.widget.watch("date +%D", 1, function(widget, stdout)
                                          local date = stdout
    -- volume = string.format("% 3d", volume)

    --  if string.find(stdout, "on", 1, true) then
    --     volume = " " .. volume
    -- else
    --     volume = " N/A"
    -- end
    date = "  " .. date
    widget.text = date
end)

time_widget =  awful.widget.watch("date +%T", 1, function(widget, stdout)
                                          local time = stdout
    -- volume = string.format("% 3d", volume)

    --  if string.find(stdout, "on", 1, true) then
    --     volume = " " .. volume
    -- else
    --     volume = " N/A"
    -- end
    time = "  " .. time .. "  "
    widget.text = time
end)
net_widget =  awful.widget.watch("nmcli connection show", 1, function(widget, stdout)
                                          local net = string.match(stdout, "%a+%l")
    -- volume = string.format("% 3d", volume)

    --  if string.find(stdout, "on", 1, true) then
    --     volume = " " .. volume
    -- else
    --     volume = " N/A"
    -- end
    net = "  " .. net
    widget.text = net
end)
