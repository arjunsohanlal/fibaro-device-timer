--Disable
thisDevice = fibaro:getSelfId()

fibaro:setGlobal("VD"..thisDevice.."status","0")
fibaro:call(thisDevice,"setProperty","ui.Status.value","Disabled")