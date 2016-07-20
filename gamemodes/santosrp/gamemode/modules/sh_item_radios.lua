
-----------------------------------------------------
--[[
	Name: sh_item_radios.lua
	For: SantosRP
	By: Ultra
]]--

local Module = {}
Module.Name = "item_radios_sh"
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
	Module.m_tblPropStreams = {}
	Module.m_varVolume = CreateClientConVar( "srp_pradio_volume", "1", true, false )
	local MAX_RADIO_DIST = 3072
	
	function Module:StartStream( entProp, strUrl )
		if GAMEMODE.Config.HasDataCap:GetInt() == 1 then return end
		if not IsValid( entProp ) then return end
		self:StopStream( entProp )

		sound.PlayURL( strUrl, "3d noplay", function( pAudioChan )
			if not IsValid( pAudioChan ) or not IsValid( entProp ) then return end
			self.m_tblPropStreams[entProp] = pAudioChan
		end )
	end

	function Module:StopStream( entProp )
		if not IsValid( self.m_tblPropStreams[entProp] ) then return end
		self.m_tblPropStreams[entProp]:Stop()
		self.m_tblPropStreams[entProp] = nil
	end

	function Module:Think()
		for k, v in pairs( self.m_tblPropStreams ) do
			if not IsValid( v ) then self.m_tblPropStreams[k] = nil continue end
			if not IsValid( k ) then
				if IsValid( v ) then v:Stop() end
				self.m_tblPropStreams[k] = nil
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
				--v:Set3DFadeDistance( 768, 3070 )
				v:SetPos( k:LocalToWorld(k:OBBCenter()) )
				v:SetVolume( math.max(self.m_varVolume:GetFloat(), 0) )
			end
		end
	end

	function Module:GamemodeDataCapModeChanged( strNewVal )
		if tonumber( strNewVal ) == 1 then
			for k, v in pairs( self.m_tblPropStreams ) do
				if IsValid( v ) then v:Stop() end
			end
			self.m_tblPropStreams = {}
		end
	end

	--Netcode
	function Module:RequestPlayPropRadio( eEnt, intID )
		GAMEMODE.Net:NewEvent( "iradio", "rp" )
			net.WriteEntity( eEnt )
			net.WriteUInt( intID, 32 )
		GAMEMODE.Net:FireEvent()
	end

	function Module:RequestPlayCustomPropRadio( eEnt, intID )
		GAMEMODE.Net:NewEvent( "iradio", "rpc" )
			net.WriteEntity( eEnt )
			net.WriteUInt( intID, 32 )
		GAMEMODE.Net:FireEvent()
	end

	function Module:RequestStopPropRadio( eEnt )
		GAMEMODE.Net:NewEvent( "iradio", "rs" )
			net.WriteEntity( eEnt )
		GAMEMODE.Net:FireEvent()
	end
end

function Module:OnLoad()
	if CLIENT then
		self:RequireHook( "GamemodeDataCapModeChanged" )
		self:RequireHook( "Think" )

		GM.Net:AddProtocol( "iradio", 11 )
		GM.Net:RegisterEventHandle( "iradio", "p", function( intMsgLen, pPlayer )
			local ent, id = net.ReadEntity(), net.ReadUInt( 32 )
			local data = Module.m_tblStations[id]
			Module:StartStream( ent, data.Url )
		end )

		GM.Net:RegisterEventHandle( "iradio", "pc", function( intMsgLen, pPlayer )
			Module:StartStream( net.ReadEntity(), "http://yp.shoutcast.com/sbin/tunein-station.pls?id=".. net.ReadUInt(32) )
		end )

		GM.Net:RegisterEventHandle( "iradio", "s", function( intMsgLen, pPlayer )
			Module:StopStream( net.ReadEntity() )
		end )

		GM.Net:RegisterEventHandle( "iradio", "m", function( intMsgLen, pPlayer )
			GAMEMODE.Gui:ShowPropRadioMenu()
		end )

		GM.Net:RegisterEventHandle( "iradio", "fupd", function( intMsgLen, pPlayer )
			local num = net.ReadUInt( 16 )
			if num == 0 then return end
			
			for i = 1, num do
				local ent, id = net.ReadEntity(), net.ReadUInt( 32 )
				local url = Module.m_tblPropStreams[id] and Module.m_tblPropStreams[id].Url or nil
				if not url then url = "http://yp.shoutcast.com/sbin/tunein-station.pls?id=".. id end
				Module:StartStream( ent, url )
			end
		end )
	end
end

return Module