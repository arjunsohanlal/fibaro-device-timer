--Time - numbered buttons
local thisDevice = fibaro:getSelfId()

local buttonPress = 1
local timeDisplay = fibaro:getGlobalValue("VD"..thisDevice.."timeDisplay")
local timeDisplayTemp = ""

timeDisplayTemp = string.format("%s%s%s%s%s",timeDisplay:sub(2,2),timeDisplay:sub(3,3),timeDisplay:sub(4,4),buttonPress,timeDisplay:sub(5,5))
timeDisplay = timeDisplayTemp
fibaro:setGlobal("VD"..thisDevice.."timeDisplay",timeDisplay)

local fullTimeDisplay = ""

local AM_PMValues = {}
AM_PMValues["0"] = ""
AM_PMValues["1"] = "AM"
AM_PMValues["2"] = "PM"

fullTimeDisplay = string.format("%s%s%s%s%s",timeDisplay:sub(1,2),":",timeDisplay:sub(3,4)," ",AM_PMValues[timeDisplay:sub(5,5)])
fibaro:call(thisDevice,"setProperty","ui.timeDisplay.value",fullTimeDisplay)