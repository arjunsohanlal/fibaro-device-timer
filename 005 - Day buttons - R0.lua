--Day buttons
local thisDevice = fibaro:getSelfId()
local weekDayNumber = 2
local activeWeeks = fibaro:getGlobalValue("VD"..thisDevice.."activeWeeks")
local dayStatus = 1 - (activeWeeks:sub(weekDayNumber,weekDayNumber) % 2)
local activeWeeksTemp = ""
for i = 1,7,1 do
  if (i ~= weekDayNumber) then
    activeWeeksTemp = activeWeeksTemp..activeWeeks:sub(i,i)
  else
    activeWeeksTemp = activeWeeksTemp..dayStatus
  end
end

activeWeeks = activeWeeksTemp
fibaro:setGlobal("VD"..thisDevice.."activeWeeks",activeWeeks)

local weekList = {"Sun","Mon","Tue","Wed","Thu","Fri","Sat"}
local weekDisplay = ""
local weekDisplayIndex = 1

for i = 1,7,1 do
  if (activeWeeks:sub(i,i) == "1") then
    if (weekDisplayIndex > 1) then
      weekDisplay = weekDisplay .. ", "
    end
    weekDisplay = weekDisplay .. weekList[i]
    weekDisplayIndex = weekDisplayIndex + 1
  end
end

fibaro:call(thisDevice,"setProperty","ui.Days.value",weekDisplay)

if (fibaro:getGlobal("VD"..thisDevice.."status") == "1") and (tonumber(activeWeeks) == 0) then
  fibaro:call(thisDevice,"pressButton","34")
end

--Scene autostart - triggers infinite loop triggered every second
--in scene, import global on time and duration, and compute on time and off time
--then check against mutually exclusive conditions on whether the current hh:mm is lined up either the on or off time.
--3 resulting conditions: turn it on, turn if off, leave it.
--should it check across all timers? more resource efficient.