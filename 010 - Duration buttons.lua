duration = 5
thisDevice = fibaro:getSelfId()
fibaro:setGlobal("VD"..thisDevice.."duration",duration)
fibaro:call(thisDevice,"setProperty","ui.Duration.value",duration.." minutes")

if (fibaro:getGlobal("VD"..thisDevice.."status") == "1") then
  fibaro:call(thisDevice,"pressButton","34")
end