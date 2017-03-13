local mc = mqtt.Client("DeviceId-0xuu9swo9d", 60, "yijing1998/esp8266", "pZjbpasTCSMbCH6PVz9GJ+Ef8vBkY4OKvvqAbkfOOHI=")

mc:on("message", function(client, topic, msg)
    if msg == nil then
        print(topic .. ": nil")
    else
        print(topic .. ":" .. msg)
    end
end)

mc:on("offline", function(client) print ("mqtt offline!") end)

mc:connect("yijing1998.mqtt.iot.gz.baidubce.com", 1883, 0, 1,
    function(client)
        print("subscribing...")
        client:subscribe("note", 0)
    end, function(client, reason)
        print("can't connect! errorcode:" .. reason)
end)
