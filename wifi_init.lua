if (wifi.getmode() ~= wifi.STATION) then
    wifi.setmode(wifi.STATION)
end

--[[station_cfg1={}
station_cfg1.ssid="Xiaomi_B7BB1"
station_cfg1.pwd="1472583690"
station_cfg1.auto=false
station_cfg1.save=true
wifi.sta.config(station_cfg1)--]]

station_cfg2={}
station_cfg2.ssid="Xiaomi_B7BB"
station_cfg2.pwd="1472583690x"
station_cfg2.auto=true
station_cfg2.save=true
wifi.sta.config(station_cfg2)

--[[station_cfg3={}
station_cfg3.ssid="lastone"
station_cfg3.pwd="1472583690"
station_cfg3.auto=false
station_cfg3.save=true
wifi.sta.config(station_cfg3)--]]