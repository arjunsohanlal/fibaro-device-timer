--Scene Code
--Scene autostart - triggers infinite loop triggered every second
--in scene, import global on time and duration, and compute on time and off time
--then check against mutually exclusive conditions on whether the current hh:mm is lined up either the on or off time.
--3 resulting conditions: turn it on, turn if off, leave it.
--should it check across all timers? more resource efficient.


----------------------------------------------------At sunrise
--[[
%% autostart
%% properties
%% weather
%% events
%% globals
--]]

local sourceTrigger = fibaro:getSourceTrigger();

function tempFunc()
	local currentDate = os.date("*t");
	local startSource = fibaro:getSourceTrigger();
	if (
	 ( ((currentDate.wday == 2 or currentDate.wday == 4) and string.format("%02d", currentDate.hour) .. ":" .. string.format("%02d", currentDate.min) == fibaro:getValue(1, "sunriseHour")) )
	)
	then
		fibaro:call(94, "turnOn");
	end

	setTimeout(tempFunc, 60*1000)
end

if (sourceTrigger["type"] == "autostart") then
tempFunc()
else

local currentDate = os.date("*t");
local startSource = fibaro:getSourceTrigger();
if (
startSource["type"] == "other"
)
then
	fibaro:call(94, "turnOn");
end

end

------------------------------------------------------- 90m before sunrise
--[[
%% autostart
%% properties
%% weather
%% events
%% globals
--]]

local sourceTrigger = fibaro:getSourceTrigger();

function tempFunc()
	local currentDate = os.date("*t");
	local startSource = fibaro:getSourceTrigger();
	if (
	 ( ((currentDate.wday == 2 or currentDate.wday == 4) and os.date("%H:%M", os.time()+90*60) == fibaro:getValue(1, "sunriseHour")) )
	)
	then
		fibaro:call(94, "turnOn");
	end

	setTimeout(tempFunc, 60*1000)
end

if (sourceTrigger["type"] == "autostart") then
tempFunc()
else

local currentDate = os.date("*t");
local startSource = fibaro:getSourceTrigger();
if (
startSource["type"] == "other"
)
then
	fibaro:call(94, "turnOn");
end

end

