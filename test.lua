function dotest(id)
    gpio.mode(id, gpio.OUTPUT)
    print("read: " .. gpio.read(id))
    --gpio.mode(id, gpio.INPUT)
    --gpio.write(id, gpio.HIGH)
    --print("set: " .. gpio.HIGH)
end

for x=0, 8, 1 do
    dotest(x)
end
