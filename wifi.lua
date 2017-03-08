wifi.setmode(wifi.STATION, false)

station_cfg={}
station_cfg.ssid="Xiaomi_B7BB"
station_cfg.pwd="1472583690"
station_cfg.auto=false
wifi.sta.config(station_cfg)

wifi.sta.connect()

wifi.sta.eventMonReg(wifi.STA_CONNECTING, function(previous_State)
    if(previous_State==wifi.STA_GOTIP) then
        print("Station lost connection with access point\n\tAttempting to reconnect...")
    else
        print("STATION_CONNECTING")
    end
end)

wifi.sta.eventMonReg(wifi.STA_WRONGPWD, function()
    print("STATION_WRONG_PASSWORD")
end)

wifi.sta.eventMonReg(wifi.STA_FAIL, function()
    print("STATION_CONNECT_FAIL")
end)

wifi.sta.eventMonReg(wifi.STA_GOTIP, function()
    print("STATION_GOT_IP")
end)

wifi.sta.eventMonStart()