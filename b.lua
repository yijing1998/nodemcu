-- print AP list in new format
wifi.setmode(wifi.STATIONAP)
function listap(t)
    for k,v in pairs(t) do
        print(k.." : "..v)
    end
end
wifi.sta.getap(1, listap)