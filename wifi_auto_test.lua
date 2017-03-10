wifi.eventmon.register(wifi.eventmon.STA_CONNECTED, function(T)
    print("connected")
end)

wifi.eventmon.register(wifi.eventmon.STA_DISCONNECTED, function(T)
    if (T.REASON == nil) then
        print("disconnected:"..T.SSID)
    else
        print("disconnected:"..T.SSID.."  reason:%s"..T.REASON)
    end
end)