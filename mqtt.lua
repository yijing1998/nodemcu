m = mqtt.Client("node1998", 120)

m:on("connect", function(client)
    print ("mqtt connected")
    m:subscribe("/mqtt-spy/yijing1998/", 0, function(client)
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

m:connect("test.mosquitto.org")
