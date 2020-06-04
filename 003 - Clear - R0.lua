--Clear
local thisDevice = fibaro:getSelfId()

fibaro:setGlobal('VD'..thisDevice..'timeDisplay',"----0")
local timeDisplay = fibaro:getGlobalValue("VD"..thisDevice.."timeDisplay")

local AM_PMValues = {}
AM_PMValues["0"] = ""
AM_PMValues["1"] = "AM"
AM_PMValues["2"] = "PM"

fullTimeDisplay = string.format("%s%s%s%s%s",timeDisplay:sub(1,2),":",timeDisplay:sub(3,4)," ",AM_PMValues[timeDisplay:sub(5,5)])
fibaro:call(thisDevice,"setProperty","ui.timeDisplay.value",fullTimeDisplay)