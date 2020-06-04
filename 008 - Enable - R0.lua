--Enable, check inside day setting buttons at the end - if activeWeeks = 0, then set status to disabled, or press disable button, ***or rather press enable, if status is 1.
thisDevice = fibaro:getSelfId()

hours = fibaro:getGlobal("VD"..thisDevice.."hours")
minutes = fibaro:getGlobal("VD"..thisDevice.."minutes")
AM_PM = fibaro:getGlobal("VD"..thisDevice.."AM_PM")
activeWeeks = fibaro:getGlobal("VD"..thisDevice.."activeWeeks")
local AM_PMValues = {}
AM_PMValues["0"] = ""
AM_PMValues["1"] = "AM"
AM_PMValues["2"] = "PM"

local statusValues = {}
statusValues["0"] = "Disabled"
statusValues["1"] = "Active - "

statusString = ""

local flag1 = 0
local flag2 = 0
local flag3 = 0
local flag4 = 0

if (hours ~= "") then
	flag1 = 1
end
if (minutes ~= "") then
	flag2 = 1
end
if (AM_PM ~= "0") then
	flag3 = 1
end
if (tonumber(activeWeeks) >= 1) then
	flag4 = 1
end

if (flag1 == 1 and flag2 == 1 and flag3 == 1 and flag4 == 1) then
	status = "1"
	fibaro:setGlobal("VD"..thisDevice.."status",status)

	--Substring for time
	if tonumber(minutes) <= 10 then
		minutes = "0"..minutes
	end
	fullTimeDisplay = hours..":"..minutes.." "..AM_PMValues[AM_PM]

	--Substring for duration
	duration = fibaro:getGlobal("VD"..thisDevice.."duration")	

	--Substring for days
	weekList = {"Sun","Mon","Tue","Wed","Thu","Fri","Sat"}
	weekDisplay = ""
	weekDisplayIndex = 1

	for i = 1,7,1 do
	  if (activeWeeks:sub(i,i) == "1") then
	    if (weekDisplayIndex > 1) then
	      weekDisplay = weekDisplay .. ", "
	    end
	    weekDisplay = weekDisplay .. weekList[i]
	    weekDisplayIndex = weekDisplayIndex + 1
	  end
	end

	--Final string
	--statusString = statusValues[status]..fullTimeDisplay.." for "..duration.." minutes on "..weekDisplay
	statusString = statusValues[status]..fullTimeDisplay.." for "..duration.." minutes."
else
	status = "0"
	if ((flag1 == 0 or flag2 == 0 or flag3 == 0) and flag4 == 0) then
		fibaro:call(thisDevice,"setProperty","ui.Status.value",statusValues[status].." - active days & time not set.")
	elseif ((flag1 == 0 or flag2 == 0 or flag3 == 0) and flag4 == 1) then
		fibaro:call(thisDevice,"setProperty","ui.Status.value",statusValues[status].." - time not set.")
	elseif ((flag1 == 1 or flag2 == 1 or flag3 == 1) and flag4 == 0) then
		fibaro:call(thisDevice,"setProperty","ui.Status.value",statusValues[status].." - active days not set.")
	end
	fibaro:setGlobal("VD"..thisDevice.."status",status)
	statusString = statusValues[status]
	fibaro:sleep(1000)
end

fibaro:call(thisDevice,"setProperty","ui.Status.value",statusString)