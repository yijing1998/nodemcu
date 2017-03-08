lighton=0
pin=2
gpio.mode(pin,gpio.OUTPUT)
local mt = tmr.create()
mt:register(2000,tmr.ALARM_AUTO,function()
    if lighton==0 then
        lighton=1
        gpio.write(pin,gpio.HIGH)
    else
        lighton=0
        gpio.write(pin,gpio.LOW)
    end
end)
mt:start()
