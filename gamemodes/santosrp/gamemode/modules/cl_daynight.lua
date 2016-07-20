
-----------------------------------------------------
--[[
	Name: cl_daynight.lua
	For: SantosRP
	By: Ultra
]]--

local Module = {}
Module.Name = "daynight"
Module.m_intCurMinute = 1
Module.m_intCurDay = 1
Module.m_intCurLightScale = 1
Module.m_tblSkyScalars = {
	{ --Night time after midnight
		Compare = function( int ) return int < 300 end,
		Scalar = function( int ) return 0 end
	},
	{ --Dawn start to dawn end (0 to 0.1)
		Compare = function( int ) return int >= 300 and int < 315 end,
		Scalar = function( int ) return ((int -300) /14) *0.1 end
	},
	{ --Dawn start to dawn end (0 to 0.3)
		Compare = function( int ) return int >= 315 and int < 450 end,
		Scalar = function( int ) return (((int -315) /134) *0.2) +0.1 end
	},
	{ --Morning (0.3 to 1)
		Compare = function( int ) return int >= 450 and int < 660 end,
		Scalar = function( int ) return (((int -450) /209) *0.7) +0.3 end
	},
	{ --Mid-day
		Compare = function( int ) return int >= 660 and int < 980 end,
		Scalar = function( int ) return 1 end
	},
	{ --Afternoon (1 to 0.3)
		Compare = function( int ) return int >= 980 and int < 1200 end,
		Scalar = function( int ) return ((((int -1199) /219) *0.7) *-1) +0.3 end
	},
	{ --Dusk start to dusk end (0.3 to 0.1)
		Compare = function( int ) return int >= 1200 and int < 1290 end,
		Scalar = function( int ) return ((((int -1289) /89) *0.2) *-1) +0.1 end
	},
	{ --Dusk start to dusk end (0.1 to 0)
		Compare = function( int ) return int >= 1290 and int < 1305 end,
		Scalar = function( int ) return (((int -1304) /15) *0.1) *-1 end
	},
	{ --Dusk end to midnight
		Compare = function( int ) return int >= 1305 and int < 1440 end,
		Scalar = function( int ) return 0 end
	},
}

function Module:SetTime( intNewTime )
	if intNewTime ~= self:GetTime() then
		hook.Call( "GamemodeOnTimeChanged", GAMEMODE, self:GetTime(), intNewTime )
	end

	self:OnTimeChanged( self:GetTime(), intNewTime )
	self.m_intCurMinute = intNewTime
end

function Module:GetTime()
	return self.m_intCurMinute
end

function Module:SetDay( intNewDay )
	if intNewDay ~= self:GetDay() then
		hook.Call( "GamemodeOnDayChanged", GAMEMODE, self:GetDay(), intNewDay )
	end

	self:OnDayChanged( self:GetDay(), intNewDay )
	self.m_intCurDay = intNewDay
end

function Module:GetDay()
	return self.m_intCurDay
end

function Module:GetLightScale()
	return self.m_intCurLightScale
end

function Module:SetupWorldFog()
	if not GAMEMODE.Config.FogLightingEnabled then return end

	--local fade = math.Clamp( self:GetLightScale() *4, 0, 1 )
	--fade = fade *0.33
	local map = 0.8
	local fade = self:GetLightScale()
	fade = fade -(1 -map)
	if fade < 0 then fade = 0 end
	fade = (fade *1) /map

	local fogData = {
		Color = Color( 15, 15, 15 ),
		Start = 1,
		End = 2,//Lerp( fade, 4500, 6144 ),
		Density = Lerp( fade, 0.71, 0 ),
	}

	hook.Call( "GamemodeSetupWorldFog", GAMEMODE, fogData )

	render.FogMode( 1 )
	render.FogStart( fogData.Start )
	render.FogEnd( fogData.End )
	render.FogMaxDensity( fogData.Density )
	render.FogColor( fogData.Color.r, fogData.Color.g, fogData.Color.b )

	return true
end

function Module:SetupSkyboxFog( intScale )
end

function Module:OnTimeChanged( intOldTime, intNewTime )
	local found
	for _, data in pairs( self.m_tblSkyScalars ) do
		if data.Compare( self.m_intCurMinute ) then
			self.m_intCurLightScale = data.Scalar( self.m_intCurMinute )
			found = true
			break
		end
	end
	if not found then
		self.m_intCurLightScale = 0
	end
end

function Module:OnDayChanged( intOldDay, intNewDay )
end

function Module:OnLoad()
	self:RequireHook( "SetupWorldFog" )
	self:RequireHook( "SetupSkyboxFog" )

	GM.Net:AddProtocol( "weather", 14 )
	GM.Net:RegisterEventHandle( "weather", "t", function( intMsgLen, pPlayer )
		self:SetTime( net.ReadUInt(32) )
	end )

	GM.Net:RegisterEventHandle( "weather", "d", function( intMsgLen, pPlayer )
		self:SetDay( net.ReadUInt(8) )
	end )

	GM.Net:RegisterEventHandle( "weather", "fupd_time", function( intMsgLen, pPlayer )
		self:SetDay( net.ReadUInt(8) )
		self:SetTime( net.ReadUInt(32) )
	end )
end

return Module