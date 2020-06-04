--Main Loop R0
local thisDevice = fibaro:getSelfId()

if fibaro:getGlobalValue("VD"..thisDevice.."timeDisplay") == nil then
    local HC2 = Net.FHttp("127.0.0.1",11111);
    local postMsg = '{"name":"VD'..thisDevice..'timeDisplay","value":"----0"}'
    local response ,status, err = HC2:POST('/api/globalVariables',postMsg);
    fibaro:debug(response)
    fibaro:debug(status)
    fibaro:debug(err)
    if (tonumber(status) == 200 and tonumber(err)==0) then
      fibaro:debug("Global variable VD"..thisDevice.."timeDisplay created");
    end
end

if fibaro:getGlobalValue("VD"..thisDevice.."AM_PM") == nil then
    local HC2 = Net.FHttp("127.0.0.1",11111);
    local postMsg = '{"name":"VD'..thisDevice..'AM_PM","value":"0"}'
    local response ,status, err = HC2:POST('/api/globalVariables',postMsg);
    fibaro:debug(response)
    fibaro:debug(status)
    fibaro:debug(err)
    if (tonumber(status) == 200 and tonumber(err)==0) then
      fibaro:debug("Global variable VD"..thisDevice.."AM_PM created");
    end
end

if fibaro:getGlobalValue("VD"..thisDevice.."activeWeeks") == nil then
    local HC2 = Net.FHttp("127.0.0.1",11111);
    local postMsg = '{"name":"VD'..thisDevice..'activeWeeks","value":"0000000"}'
    local response ,status, err = HC2:POST('/api/globalVariables',postMsg);
    fibaro:debug(response)
    fibaro:debug(status)
    fibaro:debug(err)
    if (tonumber(status) == 200 and tonumber(err)==0) then
      fibaro:debug("Global variable VD"..thisDevice.."activeWeeks created");
    end
end

if fibaro:getGlobalValue("VD"..thisDevice.."hours") == nil then
    local HC2 = Net.FHttp("127.0.0.1",11111);
    local postMsg = '{"name":"VD'..thisDevice..'hours","value":""}'
    local response ,status, err = HC2:POST('/api/globalVariables',postMsg);
    fibaro:debug(response)
    fibaro:debug(status)
    fibaro:debug(err)
    if (tonumber(status) == 200 and tonumber(err)==0) then
      fibaro:debug("Global variable VD"..thisDevice.."hours created");
    end
end

if fibaro:getGlobalValue("VD"..thisDevice.."minutes") == nil then
    local HC2 = Net.FHttp("127.0.0.1",11111);
    local postMsg = '{"name":"VD'..thisDevice..'minutes","value":""}'
    local response ,status, err = HC2:POST('/api/globalVariables',postMsg);
    fibaro:debug(response)
    fibaro:debug(status)
    fibaro:debug(err)
    if (tonumber(status) == 200 and tonumber(err)==0) then
      fibaro:debug("Global variable VD"..thisDevice.."minutes created");
    end
end

if fibaro:getGlobalValue("VD"..thisDevice.."duration") == nil then
    local HC2 = Net.FHttp("127.0.0.1",11111);
    local postMsg = '{"name":"VD'..thisDevice..'duration","value":"30"}'
    local response ,status, err = HC2:POST('/api/globalVariables',postMsg);
    fibaro:debug(response)
    fibaro:debug(status)
    fibaro:debug(err)
    if (tonumber(status) == 200 and tonumber(err)==0) then
      fibaro:debug("Global variable VD"..thisDevice.."duration created");
    end
end

if fibaro:getGlobalValue("VD"..thisDevice.."status") == nil then
    local HC2 = Net.FHttp("127.0.0.1",11111);
    local postMsg = '{"name":"VD'..thisDevice..'status","value":"0"}'
    local response ,status, err = HC2:POST('/api/globalVariables',postMsg);
    fibaro:debug(response)
    fibaro:debug(status)
    fibaro:debug(err)
    if (tonumber(status) == 200 and tonumber(err)==0) then
      fibaro:debug("Global variable VD"..thisDevice.."status created");
    end
end