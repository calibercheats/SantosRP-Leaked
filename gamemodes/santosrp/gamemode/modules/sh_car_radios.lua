
-----------------------------------------------------
--[[
	Name: sh_car_radios.lua
	For: SantosRP
	By: Ultra
]]--

local Module = {}
Module.Name = "car_radios_sh"
Module.m_tblStations = {
	--[862132] = { Name = "ANTENA1", Url = "http://yp.shoutcast.com/sbin/tunein-station.pls?id=" },
	--[389248] = { Name = "Rustic.FM", Url = "http://yp.shoutcast.com/sbin/tunein-station.pls?id=" },
	--[114517] = { Name = "Bassdrive", Url = "http://yp.shoutcast.com/sbin/tunein-station.pls?id=" },
	--[672454] = { Name = "NonStop.FM", Url = "http://yp.shoutcast.com/sbin/tunein-station.pls?id=" },
	--[37586] = { Name = "181.FM The Buzz", Url = "http://yp.shoutcast.com/sbin/tunein-station.pls?id=" },
	--[178543] = { Name = "Abacus.FM", Url = "http://yp.shoutcast.com/sbin/tunein-station.pls?id=" },
	--[1143428] = { Name = "SantosRP.FM", Url = "http://listen.spacial.com/api/listen/?sid=60913&method=sc&rid=" },

	{ Name = "Dirty South", Url = "http://174.37.110.72:8010/;" },
	{ Name = "TROPICALISIMA.FM", Url = "http://50.7.56.2:8000/;" },
	{ Name = "JARADIO", Url = "http://209.126.108.37:8575/;stream/1" },
	{ Name = "Bassdrive", Url = "http://69.93.119.200:9000/;" },
	{ Name = "Venice Classic", Url = "http://109.123.116.202:8022/;stream/1" },
	{ Name = "RAUTEMUSIK.FM", Url = "http://95.141.24.24:80/;" },
	{ Name = "Arrow.FM", Url = "http://91.221.151.237:8107/;" },
}

if CLIENT then
	Module.m_tblCarStreams = {}
	Module.m_varVolume = CreateClientConVar( "srp_cradio_volume", "1", true, false )
	local MAX_RADIO_DIST = 768
	
	function Module:StartStream( entVehicle, strUrl )
		if GAMEMODE.Config.HasDataCap:GetInt() == 1 then return end
		if not IsValid( entVehicle ) then return end
		self:StopStream( entVehicle )

		sound.PlayURL( strUrl, "3d noplay", function( pAudioChan )
			if not IsValid( pAudioChan ) or not IsValid( entVehicle ) then return end
			self.m_tblCarStreams[entVehicle] = pAudioChan
		end )
	end
	
	function Module:StopStream( entVehicle )
		if not IsValid( self.m_tblCarStreams[entVehicle] ) then return end
		self.m_tblCarStreams[entVehicle]:Stop()
		self.m_tblCarStreams[entVehicle] = nil
	end

	function Module:HUDPaint()
		for k, v in pairs( self.m_tblCarStreams ) do
			if not IsValid( v ) then self.m_tblCarStreams[k] = nil continue end
			if not IsValid( k ) then
				if IsValid( v ) then v:Stop() end
				self.m_tblCarStreams[k] = nil
				continue
			end

			local state = v:GetState()
			if k:GetPos():Distance( LocalPlayer():GetPos() ) > MAX_RADIO_DIST then
				if state == GMOD_CHANNEL_PLAYING then
					v:Pause()
				end
			else
				if state == GMOD_CHANNEL_PAUSED or state == GMOD_CHANNEL_STOPPED then
					if IsValid( v ) then v:Play() end
				end
			end
			
			if IsValid( v ) then
				local veh = LocalPlayer():GetVehicle()

				if IsValid( veh ) and (veh == k or veh:GetParent() == k) then
					v:SetPos( EyePos() )
				else
					v:SetPos( k:LocalToWorld(k:OBBCenter()) )
				end

				--v:Set3DFadeDistance( 768, 3070 )
				v:SetVolume( math.max(self.m_varVolume:GetFloat(), 0) )
			end
		end
	end

	function Module:GamemodeDataCapModeChanged( strNewVal )
		if tonumber( strNewVal ) == 1 then
			for k, v in pairs( self.m_tblCarStreams ) do
				if IsValid( v ) then v:Stop() end
			end
			self.m_tblCarStreams = {}
		end
	end

	--Netcode
	function Module:RequestPlayCarRadio( intID )
		GAMEMODE.Net:NewEvent( "cradio", "rp" )
			net.WriteUInt( intID, 32 )
		GAMEMODE.Net:FireEvent()
	end

	function Module:RequestPlayCustomCarRadio( intID )
		if not intID then return end
		GAMEMODE.Net:NewEvent( "cradio", "rpc" )
			net.WriteUInt( intID, 32 )
		GAMEMODE.Net:FireEvent()
	end

	function Module:RequestStopCarRadio()
		GAMEMODE.Net:NewEvent( "cradio", "rs" )
		GAMEMODE.Net:FireEvent()
	end
end

function Module:OnLoad()
	if CLIENT then
		self:RequireHook( "HUDPaint" )
		self:RequireHook( "GamemodeDataCapModeChanged" )

		GM.Net:AddProtocol( "cradio", 10 )
		GM.Net:RegisterEventHandle( "cradio", "p", function( intMsgLen, pPlayer )
			local ent, id = net.ReadEntity(), net.ReadUInt( 32 )
			local data = Module.m_tblStations[id]
			Module:StartStream( ent, data.Url )
		end )

		GM.Net:RegisterEventHandle( "cradio", "pc", function( intMsgLen, pPlayer )
			Module:StartStream( net.ReadEntity(), "http://yp.shoutcast.com/sbin/tunein-station.pls?id=".. net.ReadUInt(32) )
		end )

		GM.Net:RegisterEventHandle( "cradio", "s", function( intMsgLen, pPlayer )
			Module:StopStream( net.ReadEntity() )
		end )

		GM.Net:RegisterEventHandle( "cradio", "fupd", function( intMsgLen, pPlayer )
			local num = net.ReadUInt( 16 )
			if num == 0 then return end
			
			for i = 1, num do
				local ent, id = net.ReadEntity(), net.ReadUInt( 32 )
				local url = Module.m_tblCarStreams[id] and Module.m_tblStations[id].Url or nil
				if not url then url = "http://yp.shoutcast.com/sbin/tunein-station.pls?id=".. id end
				Module:StartStream( ent, url )
			end
		end )
	end
end

return Module