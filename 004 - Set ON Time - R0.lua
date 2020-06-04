--Set ON Time
function refreshDisplay(deviceID)
    -- if (fibaro:getGlobalValue("VD"..deviceID.."hours") == nil) or (fibaro:getGlobalValue("VD"..deviceID.."minutes") == nil) then
    --     fibaro:setGlobal("VD"..deviceID.."timeDisplay","----0")
    -- else
    --     hours = fibaro:getGlobalValue("VD"..deviceID.."hours")
    --     minutes = fibaro:getGlobalValue("VD"..deviceID.."minutes")
    --     AM_PM = fibaro:getGlobalValue("VD"..deviceID.."AM_PM")
    --     if (tonumber(hours) >= 10) then
    --         fibaro:setGlobal("VD"..deviceID.."timeDisplay",hours..minutes..AM_PM)
    --     else
    --         fibaro:setGlobal("VD"..deviceID.."timeDisplay"," "..hours..minutes..AM_PM)
    --     end
    -- end
    fibaro:setGlobal("VD"..deviceID.."timeDisplay","----0")
    fibaro:call(deviceID,"setProperty","ui.timeDisplay.value","Invalid time.")
    fibaro:sleep(1000);
    fibaro:debug("refreshDisplay initiated")
    local refreshedDisplay = fibaro:getGlobalValue("VD"..deviceID.."timeDisplay")
    local AMPM = refreshedDisplay:sub(5,5)
    local AM_PMValues = {}
    AM_PMValues["0"] = ""
    AM_PMValues["1"] = "AM"
    AM_PMValues["2"] = "PM"
    local fullTimeDisplay = string.format("%s%s%s%s%s",refreshedDisplay:sub(1,2),":",refreshedDisplay:sub(3,4)," ",AM_PMValues[AMPM])
    fibaro:call(deviceID,"setProperty","ui.timeDisplay.value",fullTimeDisplay)
end


fibaro:debug("Start")
local thisDevice = fibaro:getSelfId()
local timeDisplay = fibaro:getGlobalValue("VD"..thisDevice.."timeDisplay")
local AM_PM = timeDisplay:sub(5,5)
local AM_PMValues = {}
AM_PMValues["0"] = ""
AM_PMValues["1"] = "AM"
AM_PMValues["2"] = "PM"

local flag1 = 0
local flag2 = 0
local flag3 = 0
local flag4 = 0
local flag5 = 0
local flag6 = 0

if ((timeDisplay:sub(2,2) ~= "-") and (timeDisplay:sub(3,3) ~= "-") and (timeDisplay:sub(4,4) ~= "-")) then
    if ((timeDisplay:sub(1,1) == "-") or (tonumber(timeDisplay:sub(1,1)) == 0) or (tonumber(timeDisplay:sub(1,1)) == 1)) then
        flag1 = 1
    end
    if ((tonumber(timeDisplay:sub(2,2)) >= 0) and (tonumber(timeDisplay:sub(2,2)) <= 9)) then
        flag2 = 1
    end
    if ((tonumber(timeDisplay:sub(3,3)) >= 0) and (tonumber(timeDisplay:sub(3,3)) <= 5)) then
        flag3 = 1
    end
    if ((tonumber(timeDisplay:sub(4,4)) >= 0) and (tonumber(timeDisplay:sub(4,4)) <= 9)) then
        flag4 = 1
    end
    if (tonumber(AM_PM) ~= 0) then
        flag5 = 1
    end
    if (((tonumber(timeDisplay:sub(1,1)) == 0) or (timeDisplay:sub(1,1) == "-")) and (tonumber(timeDisplay:sub(2,2)) == 0)) then
        flag6 = 0
    else
        flag6 = 1
    end

    if (flag1 == 1 and flag2 == 1 and flag3 == 1 and flag4 == 1 and flag5 == 1 and flag6 == 1) then
        local hours = tonumber(timeDisplay:sub(1,2))
        if hours < 0 then
            hours = hours*(-1)
            fibaro:debug("minus converted for "..hours)
        end
        local minutes = tonumber(timeDisplay:sub(3,4))
        fibaro:debug("hours:"..hours.." minutes:"..minutes)
        if (hours >= 10) then
            timeDisplay = hours
        else
            timeDisplay = " "..hours
        end
        if (minutes >= 10) then
            timeDisplay = timeDisplay..minutes..AM_PM
        else
            timeDisplay = timeDisplay.."0"..minutes..AM_PM
        end
        fibaro:setGlobal("VD"..thisDevice.."hours",hours)
        fibaro:setGlobal("VD"..thisDevice.."minutes",minutes)
        fibaro:setGlobal("VD"..thisDevice.."AM_PM",AM_PM)
        fibaro:setGlobal("VD"..thisDevice.."timeDisplay",timeDisplay)

        local fullTimeDisplay = "Updated to "..string.format("%s%s%s%s%s",timeDisplay:sub(1,2),":",timeDisplay:sub(3,4)," ",AM_PMValues[AM_PM])
        fibaro:call(thisDevice,"setProperty","ui.timeDisplay.value",fullTimeDisplay)
        fibaro:debug("timeDisplay updated to:"..fullTimeDisplay)
        fibaro:setGlobal("VD"..thisDevice.."timeDisplay","----0")
    else
        refreshDisplay(thisDevice)
    end
else
    refreshDisplay(thisDevice)
end