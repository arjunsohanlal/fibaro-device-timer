--Reset
thisDevice = fibaro:getSelfId()

fibaro:call(thisDevice,"setProperty","ui.Status.value","Resetting...")
fibaro:call(thisDevice,"setProperty","ui.Days.value","")
fibaro:call(thisDevice,"setProperty","ui.Duration.value","")
fibaro:call(thisDevice,"setProperty","ui.timeDisplay.value","")

fibaro:setGlobal("VD"..thisDevice.."timeDisplay","----0")
fibaro:setGlobal("VD"..thisDevice.."AM_PM","0")
fibaro:setGlobal("VD"..thisDevice.."activeWeeks","0000000")
fibaro:setGlobal("VD"..thisDevice.."hours","")
fibaro:setGlobal("VD"..thisDevice.."minutes","")
fibaro:setGlobal("VD"..thisDevice.."duration","30")
fibaro:setGlobal("VD"..thisDevice.."status","0")

fibaro:sleep(1000)

fibaro:call(thisDevice,"setProperty","ui.Status.value","Disabled")
fibaro:call(thisDevice,"setProperty","ui.Days.value","")
fibaro:call(thisDevice,"setProperty","ui.Duration.value","30 minutes")
fibaro:call(thisDevice,"setProperty","ui.timeDisplay.value","--:--")