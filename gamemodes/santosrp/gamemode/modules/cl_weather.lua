
-----------------------------------------------------
--[[
	Name: cl_weather.lua
	For: SantosRP
	By: Ultra
]]--

local Module = {}
Module.Name = "weather"
Module.m_tblTypes = {}
Module.m_tblActiveTypes = {}

function Module:LoadTypes()
	GM:PrintDebug( 0, "->LOADING WEATHER TYPES" )

	local foundFiles, foundFolders = file.Find( GM.Config.GAMEMODE_PATH.. "modules/weather/*.lua", "LUA" )
	GM:PrintDebug( 0, "\tFound ".. #foundFiles.. " files." )

	for k, v in pairs( foundFiles ) do
		GM:PrintDebug( 0, "\tLoading ".. v )
		self:RegisterType( include(GM.Config.GAMEMODE_PATH.. "modules/weather/".. v) )
	end

	GM:PrintDebug( 0, "->WEATHER TYPES LOADED" )
end

function Module:RegisterType( tblWeatherType )
	if self.m_tblTypes[tblWeatherType.ID] then return end
	self.m_tblTypes[tblWeatherType.ID] = tblWeatherType
end

function Module:GetType( strTypeID )
	return self.m_tblTypes[strTypeID]
end

function Module:IsTypeRunning( strTypeID )
	return self.m_tblActiveTypes[strTypeID] and true
end

function Module:GetActiveTypeData( strTypeID )
	return self.m_tblActiveTypes[strTypeID]
end

function Module:HasRunningTypes()
	return table.Count( self.m_tblActiveTypes ) > 0
end

function Module:StartType( strTypeID, intStartTime, intRunTime )
	local timeOffset = math.max( CurTime() -intStartTime, 0 )
	self.m_tblActiveTypes[strTypeID] = {
		Start = intStartTime,
		RunTime = intRunTime,
		Offset = timeOffset,
	}

	self.m_tblTypes[strTypeID]:Start( intStartTime, intRunTime, timeOffset )
	hook.Call( "GamemodeWeatherStarted", GAMEMODE, strTypeID, intStartTime, intRunTime, self )
end

function Module:StopType( strTypeID )
	self.m_tblActiveTypes[strTypeID] = nil
	self.m_tblTypes[strTypeID]:Stop()
	hook.Call( "GamemodeWeatherStopped", GAMEMODE, strTypeID, self )
end

function Module:Think()
	for typeID, data in pairs( self.m_tblActiveTypes ) do
		if not self.m_tblTypes[typeID].Think then continue end
		self.m_tblTypes[typeID]:Think()
	end
end

function Module:PostDrawTranslucentRenderables()
	for typeID, data in pairs( self.m_tblActiveTypes ) do
		if not self.m_tblTypes[typeID].PostDrawTranslucentRenderables then continue end
		self.m_tblTypes[typeID]:PostDrawTranslucentRenderables()
	end
end

function Module:RenderScreenspaceEffects()
	for typeID, data in pairs( self.m_tblActiveTypes ) do
		if not self.m_tblTypes[typeID].RenderScreenspaceEffects then continue end
		self.m_tblTypes[typeID]:RenderScreenspaceEffects()
	end
end

function Module:GamemodeSetupWorldFog( ... )
	if not GAMEMODE.Config.FogLightingEnabled then return end
	
	for typeID, data in pairs( self.m_tblActiveTypes ) do
		if not self.m_tblTypes[typeID].GamemodeSetupWorldFog then continue end
		return self.m_tblTypes[typeID]:GamemodeSetupWorldFog( ... )
	end
end

function Module:GamemodeSetupSkyboxFog( ... )
	if not GAMEMODE.Config.FogLightingEnabled then return end
	
	for typeID, data in pairs( self.m_tblActiveTypes ) do
		if not self.m_tblTypes[typeID].GamemodeSetupSkyboxFog then continue end
		return self.m_tblTypes[typeID]:GamemodeSetupSkyboxFog( ... )
	end
end

function Module:OnLoad()
	self:LoadTypes()
	self:RequireHook( "Think" )
	self:RequireHook( "PostDrawTranslucentRenderables" )
	self:RequireHook( "RenderScreenspaceEffects" )
	self:RequireHook( "GamemodeSetupWorldFog" )
	self:RequireHook( "GamemodeSetupSkyboxFog" )

	--Netcode
	GM.Net:AddProtocol( "weather", 13 )
	GM.Net:RegisterEventHandle( "weather", "b_str", function( intMsgLen, pPlayer )
		Module:StartType( net.ReadString(), net.ReadUInt(32), net.ReadUInt(16) )
	end )

	GM.Net:RegisterEventHandle( "weather", "b_sto", function( intMsgLen, pPlayer )
		Module:StopType( net.ReadString() )
	end )

	GM.Net:RegisterEventHandle( "weather", "fupd", function( intMsgLen, pPlayer )
		local num = net.ReadUInt( 8 )
		if num == 0 then return end
		
		for i = 1, num do
			Module:StartType( net.ReadString(), net.ReadUInt(32), net.ReadUInt(16) )
		end
	end )
end

return Module