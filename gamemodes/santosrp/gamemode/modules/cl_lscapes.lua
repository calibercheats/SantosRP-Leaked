
-----------------------------------------------------
--[[
	Name: cl_lscapes.lua
	For: SantosRP
	By: Ultra
]]--

local Module = {}
Module.Name = "LuaScapes (Lua Soundscape Override)"
Module.m_tblRegister = {}
Module.m_tblSounds = { Loops = { Day={}, Night={}, Raining={} } }
Module.m_bNight = false

function Module:LoadSoundScape()
	local data = file.Exists( "santosrp/gamemode/modules/lscapes/".. game.GetMap():gsub(".bsp", "").. ".lua", "LUA" )
	if not data then return end
	
	self:Register( include("santosrp/gamemode/modules/lscapes/".. game.GetMap():gsub(".bsp", "").. ".lua") )
end

function Module:Register( tblGroups )
	for k, v in pairs( tblGroups ) do
		self.m_tblRegister[v.UID] = v
	end
end

local indoorTraces = {
	Vector( 9.352347, 11.727472, 0 ),
	Vector( -3.337814, 14.623919, 0 ),
	Vector( -13.514533, 6.508256, 0 ),
	Vector( -13.514533, -6.508256, 0 ),
	Vector( -3.337814, -14.623919, 0 ),
	Vector( 9.352347, -11.727472, 0 ),
	Vector( 15, 0, 0 ),
}

local indoorsMask = bit.bor( MASK_SOLID, MASK_SPLITAREAPORTAL, MASK_SHOT_PORTAL, MASK_BLOCKLOS )
function Module:IsIndoors()
	local pl = LocalPlayer()
	if pl:InVehicle() and not pl:GetVehicle():GetThirdPersonMode() then return true end

	local bIndoors, plyPos, tr = 0, LocalPlayer():GetPos(), nil
	local zPos = GAMEMODE.Config.Weather_SkyZPos
	if not zPos then
		zPos = util.TraceLine{
			start = plyPos, 
			endpos = plyPos +(vector_up *1500),
			filter = LocalPlayer()
		}

		zPos = zPos.HitSky and zPos.HitPos.z or (plyPos +Vector(0, 0, 1500)).z
	end
	
	local temp = Vector( plyPos.x, plyPos.y, zPos )
	local dist = vector_up *(zPos -plyPos.z -60)
	local trFilter = { pl, pl:GetVehicle(), IsValid(pl:GetVehicle()) and pl:GetVehicle():GetParent() }
	for _, vec in pairs( indoorTraces ) do
		tr = util.TraceLine{
			start = temp +vec, 
			endpos = temp +vec -dist,
			filter = trFilter,
			mask = indoorsMask
		}

		if tr.Hit then
			bIndoors = bIndoors +1
		end
	end

	return bIndoors >= 5
end

function Module:SwitchSoundScape( strUID )
	self:PurgeLoops()
	local from = self.m_strActiveScape
	self.m_strActiveScape = strUID
	self:OnSoundScapeChanged( from, strUID )
end

--[[ Loops ]]--
function Module:PurgeLoops()
	local loops = self.m_tblSounds.Loops

	for k, v in pairs( loops ) do
		for k2, v2 in pairs( v ) do
			if v2.snd:IsPlaying() then v2.snd:FadeOut( 2 ) end
		end
	end

	timer.Simple( 2, function()
		for k, v in pairs( loops ) do
			for k2, v2 in pairs( v ) do
				if v2.snd then v2.snd:Stop() end
			end
		end

		loops = nil
	end )

	self.m_tblSounds.Loops = { Day={}, Night={}, Raining={} }
end

function Module:UpdateLoops()
	local scape = self.m_tblRegister[self.m_strActiveScape]
	if not scape then return end
	
	local time = GAMEMODE.Module:GetModule( "daynight" ):GetTime()
	local raining = GAMEMODE.Module:GetModule( "weather" ):HasRunningTypes()
	local isNight = time < 300 or time >= 1290
	local indoors = self:IsIndoors()

	local key = raining and "Raining" or (isNight and "Night" or "Day")
	--Update and/or play loops from the active group
	for idx, data in pairs( scape.Groups[key] ) do
		if not data.flags.playonce then continue end
		if not self.m_tblSounds.Loops[key][idx] then
			local snd = type( data.src ) == "table" and table.Random( data.src ) or data.src
			snd = CreateSound( LocalPlayer(), snd )

			if data.flags.indoorfade and indoors then
				snd:PlayEx( 0.001, data.pitch )
				snd:ChangeVolume( data.volume_indoors, 1.5 )
				snd:ChangePitch( data.pitch_indoors, 1.5 )
			else
				snd:PlayEx( 0.001, data.pitch )
				snd:ChangeVolume( data.volume, 1.5 )
			end

			self.m_tblSounds.Loops[key][idx] = { snd = snd, indoorsSet = data.flags.indoorfade and indoors }
		else
			local snd = self.m_tblSounds.Loops[key][idx]
			if not snd then continue end

			if not snd.snd:IsPlaying() then snd.snd:PlayEx( 0.001, data.pitch ) end
			if data.flags.indoorfade then
				if indoors and not snd.indoorsSet then
					snd.snd:ChangeVolume( data.volume_indoors, 1.5 )
					snd.snd:ChangePitch( data.pitch_indoors, 1.5 )
					snd.indoorsSet = true
				elseif not indoors and snd.indoorsSet then
					snd.snd:ChangeVolume( data.volume, 1.5 )
					snd.snd:ChangePitch( data.pitch, 1.5 )
					snd.indoorsSet = false
				end
			else
				snd.snd:ChangeVolume( data.volume, 1.5 )
			end
		end
	end

	--Stop loops from other groups
	for k, v in pairs( scape.Groups ) do
		if k == key then continue end
		
		for idx, snd in pairs( self.m_tblSounds.Loops[k] ) do
			local sndl = snd.snd
			if snd.snd:IsPlaying() then
				snd.snd:FadeOut( 4 )
				timer.Simple( 4, function()
					if self.m_strActiveScape ~= scape.UID then return end
					if sndl then sndl:Stop() end
				end )
			end
		end
		self.m_tblSounds.Loops[k] = {}
	end
end

--[[ Events ]]--
function Module:OnSoundScapeChanged( strFrom, strTo )
	self:UpdateLoops()
end

function Module:GamemodeWeatherStarted( strTypeID, intStartTime, intRunTime, tblModule )
	self:UpdateLoops()
end

function Module:GamemodeWeatherStopped( strTypeID, tblModule )
	self:UpdateLoops()
end

function Module:GamemodeOnTimeChanged( intOld, intNew )
	if intNew < 300 or intNew >= 1290 then
		if not self.m_bNight then
			self.m_bNight = true
			self:UpdateLoops()
		end
	else
		if self.m_bNight then
			self.m_bNight = false
			self:UpdateLoops()
		end
	end
end

--[[ Logic ]]--
function Module:ThinkSoundScape()
	self:UpdateLoops()
end

function Module:Think()
	self:ThinkSoundScape()

	local curPos = LocalPlayer():GetPos()
	local closest, dist, temp = nil, 1e9, nil
	for k, v in pairs( self.m_tblRegister ) do
		for idx, pos in pairs( v.Points ) do
			temp = pos[1]:Distance( curPos )

			if temp < dist then
				dist = temp
				closest = { k, idx }
			end
		end
	end

	if not closest then return end

	if closest[1] ~= self.m_strActiveScape and self.m_strActiveScape ~= "" then
		--Before we switch to this one we need to make sure we are close enough and have LOS
		local pointData = self.m_tblRegister[closest[1]].Points[closest[2]]
		if curPos:Distance( pointData[1] ) <= pointData[2] then
			--switch to this one
			self:SwitchSoundScape( closest[1] )
		end
	end
end

function Module:OnLoad()
	self:RequireHook( "Think" )
	self:RequireHook( "GamemodeWeatherStarted" )
	self:RequireHook( "GamemodeWeatherStopped" )
	self:RequireHook( "GamemodeOnTimeChanged" )

	self:LoadSoundScape()
end

return Module