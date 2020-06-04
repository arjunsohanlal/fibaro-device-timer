--Main Loop R1
local thisDevice = fibaro.getSelfId()

local globalList = {{name = "timeDisplay", value = "----0"},
                    {name = "AM_PM", value = "0"},
                    {name = "activeWeeks", value = "0000000"},
                    {name = "hours", value = ""},
                    {name = "minutes", value = ""},
                    {name = "duration", value = "30"},
                    {name = "status", value = "0"}
                }

for i,v in ipairs(globalList) do
    if fibaro:getGlobalValue("VD"..thisDevice..v.name) == nil then
        local HC2 = Net.FHttp("127.0.0.1",11111);
        local postMsg = '{"name":"VD'..thisDevice..v.name..'","value":"'..v.value..'"}'
        local response ,status, err = HC2:POST('/api/globalVariables',postMsg);
        fibaro:debug(response)
        fibaro:debug(status)
        fibaro:debug(err)
        if (tonumber(status) == 200 and tonumber(err)==0) then
          fibaro:debug("Global variable VD"..thisDevice..v.name.." created");
        end
    end
end