--Reset R1
thisDevice = fibaro:getSelfId()

local globalList = {{name = "timeDisplay", value = "----0"},
                    {name = "AM_PM", value = "0"},
                    {name = "activeWeeks", value = "0000000"},
                    {name = "hours", value = ""},
                    {name = "minutes", value = ""},
                    {name = "duration", value = "30"},
                    {name = "status", value = "0"}
                }

fibaro:call(thisDevice,"setProperty","ui.Status.value","Resetting...")
fibaro:call(thisDevice,"setProperty","ui.Days.value","")
fibaro:call(thisDevice,"setProperty","ui.Duration.value","")
fibaro:call(thisDevice,"setProperty","ui.timeDisplay.value","")

for i,v in ipairs(globalList) do
	fibaro:setGlobal("VD"..thisDevice..v.name,v.value)
end

fibaro:sleep(1000)

fibaro:call(thisDevice,"setProperty","ui.Status.value","Disabled")
fibaro:call(thisDevice,"setProperty","ui.Days.value","")
fibaro:call(thisDevice,"setProperty","ui.Duration.value","30 minutes")
fibaro:call(thisDevice,"setProperty","ui.timeDisplay.value","--:--")