--AM/PM
local thisDevice = fibaro:getSelfId();

local buttonPress = "1"		-- 1 for AM, 2 for PM
local timeDisplay = fibaro:getGlobalValue("VD"..thisDevice.."timeDisplay")
local fullTimeDisplay = ""

local AM_PMValues = {}
AM_PMValues["0"] = ""
AM_PMValues["1"] = "AM"
AM_PMValues["2"] = "PM"

tempTimeDisplay = timeDisplay:sub(1,4)..buttonPress
timeDisplay = tempTimeDisplay
fibaro:setGlobal("VD"..thisDevice.."timeDisplay",timeDisplay)

fullTimeDisplay = string.format("%s%s%s%s%s",timeDisplay:sub(1,2),":",timeDisplay:sub(3,4)," ",AM_PMValues[timeDisplay:sub(5,5)])
fibaro:call(thisDevice,"setProperty","ui.timeDisplay.value",fullTimeDisplay)