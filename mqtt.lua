m = mqtt.Client("yijing1998", 120, "yijing1998", "46c87840c440417895090be1631dfaa1")

m:on("connect", function(client)
    print ("mqtt connected")
    --m:subscribe("yijing1998/f/homesw", 0, function(client)
    --     print("subscribe ok")
    --end)
    m:subscribe("yijing1998/f/atest", 0, function(client)
         print("subscribe ok")
    end)
end)

m:on("offline", function(client) print ("mqtt offline") end)

m:on("message", function(client, topic, data) 
  print(topic .. ":" ) 
  if data ~= nil then
    print(data)
  end
end)

m:connect("io.adafruit.com")
