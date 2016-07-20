
-----------------------------------------------------
--[[
	Name: map_daynight.lua
	For: SantosRP
	By: Ultra
]]--

if CLIENT then return end
if not GM.Module:GetModule( "daynight" ) then return end
local modDayNight = GM.Module:GetModule( "daynight" )

g_EvoCityDayNightLogic = g_EvoCityDayNightLogic or {}
hook.Add( "InitPostEntity", "GetEvocityNightLights", function()
	for k, v in pairs( ents.GetAll() ) do
		if v:GetName() == "day_events" then
			g_EvoCityDayNightLogic.Day = v
		elseif v:GetName() == "night_events" then
			g_EvoCityDayNightLogic.Night = v
		elseif v:GetName() == "nightlights1" then
			table.insert( modDayNight.m_tblNightLights, v )
		elseif v:GetName() == "nightlights2" then
			table.insert( modDayNight.m_tblNightLights, v )
		end
	end

	modDayNight.m_bHasNightLights = true
end )

hook.Add( "GamemodeOnTimeChanged", "FireEvocityLights", function( intOldTime, intNewTime )
	if intNewTime < 300 or intNewTime >= 1290 then
		if not modDayNight:NightLightsOn() then
			g_EvoCityDayNightLogic.Night:Fire( "Trigger" )
			modDayNight:TurnOnNightLights()
		end
	else
		if modDayNight:NightLightsOn() then
			g_EvoCityDayNightLogic.Day:Fire( "Trigger" )
			modDayNight:TurnOffNightLights()
		end
	end
end )