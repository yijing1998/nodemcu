local mc = mqtt.Client("DeviceId-0xuu9swo9d", 60, "yijing1998", "46c87840c440417895090be1631dfaa1")

gpio.mode(0, gpio.OUTPUT)
gpio.write(0, gpio.LOW)
mc:on("message", function(client, topic, msg)
    if msg == nil then
        print(topic .. ": nil")
    else
        print(topic .. ":" .. msg)
    end
    
    local s = gpio.read(0)
    print("origin gpio value:" .. s)
    if s == gpio.HIGH then
        gpio.write(0, gpio.LOW)
    else
        gpio.write(0, gpio.HIGH)
    end
end)

mc:on("offline", function(client) print ("mqtt offline!") end)

mc:connect("io.adafruit.com", 8883, 1, 1,
    function(client)
        print("subscribing...")
        client:subscribe("yijing1998/f/homesw", 2)
    end, function(client, reason)
        print("can't connect! errorcode:" .. reason)
end)
