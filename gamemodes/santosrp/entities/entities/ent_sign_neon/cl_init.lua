
-----------------------------------------------------
--[[
	Name: cl_init.lua
	For: SantosRP
	By: Ultra
]]--

include "shared.lua"
ENT.RenderGroup = RENDERGROUP_BOTH

local fonts = {
	[0] = { blur = "NeonSignFont_Clip_Blur_128px", text = "NeonSignFont_Clip_128px", preview = "NeonSignFont_Clip_24px" },
	[1] = { blur = "NeonSignFont_Beon_Blur_128px", text = "NeonSignFont_Beon_128px", preview = "NeonSignFont_Beon_24px" },
	[2] = { blur = "NeonSignFont_Mexcellent_Blur_128px", text = "NeonSignFont_Mexcellent_128px", preview = "NeonSignFont_Mexcellent_24px" },
}

function ENT:Initialize()
	self.m_vecCamPos = Vector( -6, 0, 5 )
	self.m_angCamAng = Angle( 0, -180, 90 )
	self.m_intCamScale = 0.075

	self.m_sndLightHum = CreateSound( self, "ambient/machines/power_transformer_loop_1.wav" )
	self.m_sndLightHum:SetSoundLevel( 51 )
end

function ENT:OnRemove()
	if self.m_sndLightHum then
		self.m_sndLightHum:Stop()
	end
end

function ENT:RenderText()
	if self:GetPos():Distance( LocalPlayer():GetPos() ) > GAMEMODE.Config.RenderDist_Level2 then return end

	render.PushFilterMag( TEXFILTER.POINT )
	render.PushFilterMin( TEXFILTER.POINT ) 
		cam.Start3D2D( self:LocalToWorld(self.m_vecCamPos), self:LocalToWorldAngles(self.m_angCamAng), self.m_intCamScale )
			if self:GetOn() then
				draw.SimpleText(
					self:GetText() or "",
					fonts[self:GetFontID()].blur,
					0,
					0,
					Color( self:GetColR() *0.9, self:GetColG() *0.9, self:GetColB() *0.9, 255 ),
					TEXT_ALIGN_LEFT,
					TEXT_ALIGN_CENTER
				)
			end
			
			draw.SimpleText(
				self:GetText() or "",
				fonts[self:GetFontID()].text,
				0,
				0,
				self:GetOn() and Color( self:GetColR(), self:GetColG(), self:GetColB(), 255 ) or
					Color( self:GetColR() *0.33, self:GetColG() *0.33, self:GetColB() *0.33 ),
				TEXT_ALIGN_LEFT,
				TEXT_ALIGN_CENTER
			)
		cam.End3D2D()
	render.PopFilterMin()
	render.PopFilterMag()
end

local getLightIndex
do
	local idx = 0
	getLightIndex = function()
		idx = idx +1
		return idx
	end
	hook.Add( "Think", "ResetNeonLightIndex", function()
		idx = 0
	end )
end

function ENT:Think()
	surface.SetFont( "NeonSignFont_Clip_128px" )
	local w, h = surface.GetTextSize( self:GetText() or "" )
	if w <= 0 then

		return
	end
	w = w *self.m_intCamScale

	self:SetRenderBounds(
		self:OBBMins() -Vector((w +8), 0, 0),
		self:OBBMaxs()
	)

	if self.m_sndLightHum then
		if self:GetOn() then
			if not self.m_sndLightHum:IsPlaying() then self.m_sndLightHum:PlayEx( 0.3, 100 ) end
		else
			if self.m_sndLightHum:IsPlaying() then self.m_sndLightHum:Stop() end
			return
		end
	end

	if self:GetPos():Distance( LocalPlayer():GetPos() ) > 512 then return end

	local glowPos
	local curTime, lightDieTime = CurTime(), FrameTime() *6
	local lightDecay, lightBrightness, lightSize = 1000 *lightDieTime, 2, 32
	local blockSize = lightSize /2
	for i = 1, math.floor( w /blockSize ) do
		glowPos = self:LocalToWorld( self.m_vecCamPos -Vector(blockSize *i, 0.25, 4) +Vector(blockSize /2, 0, 0) )

		local dlight = DynamicLight( 32768 +getLightIndex() )
		if dlight then
			dlight.pos = glowPos
			dlight.r = self:GetColR()
			dlight.g = self:GetColG()
			dlight.b = self:GetColB()
			dlight.brightness = lightBrightness
			dlight.Decay = lightDecay
			dlight.Size = lightSize
			dlight.DieTime = curTime +lightDieTime
		end
	end
end

function ENT:DrawTranslucent()
	self:RenderText()
end

function ENT:RequestSetText( strText, intFont )
	GAMEMODE.Net:RequestSetNeonSignText( self, strText, intFont or 0 )
end

GAMEMODE.Net:RegisterEventHandle( "ent", "nsgn_sm", function( intMsgLen, pPlayer )
	if ValidPanel( g_NeonSignMenu ) then
		g_NeonSignMenu:Remove()
	end

	g_NeonSignMenu = vgui.Create( "SRPNeonSignMenu" )
	g_NeonSignMenu:SetTitle( "Sign Menu" )
	g_NeonSignMenu:SetSize( 480, 96 )
	g_NeonSignMenu:SetPos( (ScrW() /2) -(g_NeonSignMenu:GetWide() /2), ScrH() *0.66 )
	g_NeonSignMenu:SetEntity( net.ReadEntity() )
	g_NeonSignMenu:SetVisible( true )
	g_NeonSignMenu:MakePopup()
end )

function GAMEMODE.Net:RequestSetNeonSignText( entSign, strText, intFont )
	self:NewEvent( "ent", "nsgn_st" )
		net.WriteEntity( entSign )
		net.WriteString( strText )
		net.WriteUInt( intFont, 4 )
	self:FireEvent( pPlayer )
end

--[[ FONTS ]]--

--ID 0: Clip
surface.CreateFont( "NeonSignFont_Clip_128px", {
	size = 128,
	font = "Clip",
	weight = 500,
	additive = true,
	blursize = 0.5,
} )
surface.CreateFont( "NeonSignFont_Clip_Blur_128px", {
	size = 128,
	font = "Clip",
	weight = 500,
	additive = true,
	blursize = 12,
} )
surface.CreateFont( "NeonSignFont_Clip_26px", {
	size = 26,
	font = "Clip",
	weight = 750,
} )

--ID 1: Beon
surface.CreateFont( "NeonSignFont_Beon_128px", {
	size = 128,
	font = "Beon",
	weight = 500,
	additive = true,
	blursize = 0.5,
} )
surface.CreateFont( "NeonSignFont_Beon_Blur_128px", {
	size = 128,
	font = "Beon",
	weight = 500,
	additive = true,
	blursize = 12,
} )
surface.CreateFont( "NeonSignFont_Beon_26px", {
	size = 26,
	font = "Beon",
	weight = 750,
} )

--ID 2: Mexcellent
surface.CreateFont( "NeonSignFont_Mexcellent_128px", {
	size = 128,
	font = "Mexcellent",
	weight = 500,
	additive = true,
	blursize = 0.5,
} )
surface.CreateFont( "NeonSignFont_Mexcellent_Blur_128px", {
	size = 128,
	font = "Mexcellent",
	weight = 500,
	additive = true,
	blursize = 12,
} )
surface.CreateFont( "NeonSignFont_Mexcellent_26px", {
	size = 26,
	font = "Mexcellent",
	weight = 750,
} )