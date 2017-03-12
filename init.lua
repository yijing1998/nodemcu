if (wifi.getmode() ~= wifi.STATION) then
    wifi.setmode(wifi.STATION, true)
end

local function smartconfig()
    local t_smart = tmr.create()
    local tout_smart = 30000
    wifi.stopsmart()
    wifi.startsmart()
    wifi.sta.eventMonReg(wifi.STA_GOTIP, function()
        t_smart:unregister()
        wifi.sta.eventMonReg(wifi.STA_GOTIP)
        print("successful get ip address, stop the timer and begin user application!")
        --do user application
        --for more heap resource, user application must send reset command to restart the mcu
        --heap consumption is similar to that after reboot, so no need reboot?
    end)
    wifi.sta.eventMonStart()
    t_smart:alarm(tout_smart, tmr.ALARM_SINGLE, function()
        print("smartconfig timeout, redo smartconfig")
        wifi.sta.eventMonReg(wifi.STA_GOTIP)
        smartconfig()
    end)
end

local t_powerup = tmr.create()
local tout_powerup = 15000
t_powerup:alarm(tout_powerup, tmr.ALARM_SINGLE, function()
    if wifi.sta.getip() == nil then
        print("power up time out, no successful wifi connect, begin smartconfig!")
        smartconfig()
    else
        print("power up successful, wifi connceted! begin user application!")
        --do user application
    end
end)
